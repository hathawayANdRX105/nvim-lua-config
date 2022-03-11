-- set up quickfix window with auto padding
vim.cmd[[let g:asyncrun_open = 9]]
vim.cmd[[let g:asyncrun_bell = 1]]
vim.cmd[[let g:asyncrun_rootmarks = ['.mark', '.svn', '.git', '.root', '_darcs', 'build.xml'] ]]

vim.cmd[[autocmd User AsyncRunPre let g:asyncrun_open=9]]
-- vim.cmd[[autocmd User AsyncRunStart :copen 12]]
vim.cmd[[autocmd User AsyncRunStop  :copen 12]]

local build_opts = {
	go = {
		build_project 		= "go build <root>",
		run_project		= "go run <root>/main.go",
		test_project		= "go test <root>/test",
		test_func		= "go test <root>/test -v -run <cword>",
		run			= "go run <root>/main.go",
	},

	python = {
		run			= "python $(VIM_FILENAME)",

	},
	

	c = {
		build_project		= [[-cmd=<root> make]],
		run_project		= [[-cmd=<root> make run]],
		test_project		= [[-cmd=<root> make test]],
		build			= [[gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"]],
		run			= [[-raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"]],
		update_cmake		= [[-cmd=<root> cmake .]],
	},



	term 		= "-mode=term -pos=bottom -rows=12",
}

function AsyncRunByOpts(task)
	local opt = build_opts[vim.bo.filetype]
	print("filetype=>"..vim.bo.filetype)
	vim.cmd("AsyncRun " ..opt[task] .. "<CR>")
end

function Run()
	AsyncRunByOpts('run')
end

function TestProject()
	AsyncRunByOpts('test_project')
end

function RunProject()
	AsyncRunByOpts('run_project')
end

function BuildProject()
	AsyncRunByOpts('build_project')
end
