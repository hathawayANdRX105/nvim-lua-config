local default_config = {
	number = true,
	termguicolors = true,
}

-- vim.cmd[[au BufWritePost <buffer> lua require('lint').try_lint()]]
-- load set-option config
Load_set(default_config)

local cmds = require'common.command'
Load_cmd(cmds)
