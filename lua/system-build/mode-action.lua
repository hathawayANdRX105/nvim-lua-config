 local M = {}
local cmd = vim.cmd

-- set up quickfix window with auto padding
cmd[[let g:asyncrun_open = 9]]
cmd[[let g:asyncrun_bell = 1]]
cmd[[let g:asyncrun_rootmarks = ['.mark', '.svn', '.git', '.root', '_darcs', 'build.xml'] ]]

cmd[[autocmd User AsyncRunPre let g:asyncrun_open=9]]
-- cmd[[autocmd User AsyncRunStart :copen 12]]
cmd[[autocmd User AsyncRunStop  :copen 12]]

	-- renamer
	-- { mode='i', key = '<F2>', 	map = '<cmd>lua require("renamer").rename({empty=true})<cr>', opt=opt },
	-- { mode='n', key = '<F2>', 	map = '<cmd>lua require("renamer").rename({empty=true})<cr>', opt=opt },
	-- { mode='v', key = '<leader>lr', map = '<cmd>lua require("renamer").rename({empty=true})<cr>', opt=opt },

cmd[[nnoremap <silent> <F2> :lua require("renamer").rename()<CR>]]
M.mappings = {
  name = "+Lsp-Mode",
  r = { "<cmd>ModeAction run<CR>", "run" },
  b = { "<cmd>ModeAction build<CR>", "build" },
  t = { "<cmd>ModeAction test_func<CR>", "go-test-func"},
  T = { "<cmd>ModeAction test<CR>", "test" },

  a = { "<cmd>ModeAction codeaction<CR>", "code-action"},
  c = { "<cmd>ModeAction comment<CR>", "func-comment"},
  d = { "<cmd>ModeAction doc<CR>", "go-doc" },
  f = { "<cmd>ModeAction fmt<CR>", "format" },
  l = { "<cmd>ModeAction lint<CR>", "go-lint" },
  i = { "<cmd>ModeAction import<CR>", "go-import" },

}

-- cmd[[nnoremap <silent> <F2> :ModeAction rename<CR>]]

local mode_opts = {
	go = {
    -- project
		-- build_project 		= "AsyncRun go build .",
		-- test_project		= "AsyncRun go tset test",
		-- test_func		= "AsyncRun go test test -v -run <cword>",
		-- run_project		= "AsyncRun go run cmd/main.go",
		run	= { "AsyncRun go run cmd/main.go", copen =true },
    build = { "GoBuild", copen=true },
    test_func = { "GoTestFunc", copen=true },
    test = { "GoTest -v", copen=true },

    -- lsp
    codeaction = "GoCodeAction",
    comment = "GoCmt",
    doc = "GoDoc",
    fmt = "lua require('go.format').gofmt()",
    lint = "GoLint",
    import = "GoImport",
    rename = "GoRename",
	},

	python = "bottom -rows=12",
}

M.ModeAction = function(...)
  local args = {...}

  local ft = vim.bo.filetype
  local opt = unpack(args)

  local success, action = pcall( function ()
      return mode_opts[ft][opt]
    end)

  if not success then return end

  local copen = nil

  if type(action) == 'table' then
     -- print("table => ", vim.inspect(action))
     copen = action['copen']
     action = unpack(action)
     -- print("action =>", action, "  copen =>", copen)
  end

  cmd("silent! " ..action)
  if copen ~= nil then
    cmd[[copen 15]]
  end
end

cmd[[command! -nargs=* ModeAction lua require'system-build.mode-action'.ModeAction(<f-args>)]]

return M
