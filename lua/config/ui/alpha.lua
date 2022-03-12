local alpha = Check_status('alpha')
local icons = require "config.icons"


local dashboard = require "alpha.themes.dashboard"
local header = {
    '          ▀████▀▄▄              ▄█ ',
    '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
    '    ▄        █          ▀▀▀▀▄  ▄▀  ',
    '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
    '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
    '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
    '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
    '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
    '   █   █  █      ▄▄           ▄▀   ',
}

dashboard.section.header.val = header

dashboard.section.buttons.val = {
	dashboard.button("f", icons.documents.Files .. " Find file", 		":Telescope find_files <CR>"),
	dashboard.button("e", icons.ui.NewFile .. " New file", 			":ene <BAR> startinsert <CR>"),
	dashboard.button("r", icons.ui.History .. " Recent files", 		":Telescope oldfiles <CR>"),
	dashboard.button("i", icons.ui.Note.." Open private nvim-config",     	':e $MYVIMRC<CR>'),
	dashboard.button("t", icons.ui.List .. " Find text", 			":Telescope live_grep <CR>"),
	dashboard.button("p", icons.ui.Project.." Project",                  	':Telescope projects<CR>'),
	dashboard.button("s", icons.ui.SignIn .. " Find Session", 		":SessionManager load_session<CR>"),
	dashboard.button("l", icons.ui.History .. " Last Session", 		":SessionManager load_last_session<CR>"),
	dashboard.button("q", icons.diagnostics.Error .. " Quit", 		":qa!<CR>"),
}


dashboard.section.footer.val = "Okeydokey!"


 dashboard.section.header.opts = {
		 position = "center",
		 hl = "Type"
 }
 dashboard.section.buttons.opts = {
	 spacing = 1,
	 hl = "Keyword",
	 hl_group = "button",
 }
 dashboard.section.footer.opts= {
     position = "center",
     hl = "Type",
}


-- dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
-- disable tabline when alpha is displaying
vim.cmd[[ autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2 ]]

alpha.setup(dashboard.config)

