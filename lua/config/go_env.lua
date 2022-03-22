local M = {}

M.setup = function()

  Check_status('go').setup({
    dap_debug = false, -- set to false to disable dap
    dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua
                         -- false: do not use keymap in go/dap.lua.  you must define your own.
    dap_debug_gui = false, -- set to true to enable dap gui, highly recommand
    dap_debug_vt = false, -- set to true to enable dap virtual text

    gopls_cmd = 'gopls',
    lsp_gofumpt = true,
  })

  -- local exec = vim.api.nvim_exec

  -- exec([[autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()]], false)

  -- lsp support
  -- exec[[autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)]]

  -- exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
end

return M
