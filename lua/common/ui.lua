local ui_global_config = {
	-- lightline = { colorscheme ='tokyonight'},
	-- tokyonight_italic_functions = true,
	-- tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" },
	-- tokyonight_colors = { hint = "orange", error = "#ff0000" },
	-- registers_return_symbol = "↵",

	neovide_transparency = 0.8,

	moonflyIgnoreDefaultColors = 1,
	nightflyCursorColor = 1,
	nightflyTransparent = 1,
	nightflyUnderlineMatchParen = 1,
	asyncrun_open = 10,

	-- fix up for cursorhold
	cursorhold_updatetime = 100, 
 }

local ui_opt_config = {
	guifont = 'Lekton Nerd Font Mono:h20',
	updatetime = 250,
}

-- backup scheme: kanagawa / tokyonight
-- vim.cmd[[colorscheme nightfly]]

-- renamer enhance-ui
-- vim.cmd[[hi default link RenamerNormal Normal]]
-- vim.cmd[[hi default link RenamerBorder RenamerNormal]]
-- vim.cmd[[hi default link RenamerTitle Identifier]]


-- show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local cmds = {
	[[colorscheme nightfly]],
	[[hi default link RenamerNormal Normal]],
	[[hi default link RenamerBorder RenamerNormal]],
	[[hi default link RenamerTitle Identifier]],
	[[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]],


	-- highlight quickfix list
	[[syn match QuickFixWarn /warning/]],
	[[syn match QuickFixWarn /warn/]],
	[[syn match QuickFixErr /error/]],
	[[syn match QuickFixNote /note/]],
	[[hi def link     QuickFixErr         Function]],
	[[hi def link     QuickFixWarn         Function]],
	[[hi def link     QuickFixNote         Function]],
	[[hi QuickFixErr guifg=red]],
	[[hi QuickFixWarn guifg=yellow]],
	[[hi QuickFixNote guifg=green]],
}

Load_global_set(ui_global_config)
Load_set(ui_opt_config)
Load_cmd(cmds)



-- setup diagnostics symbol for lsp
function Setup_diagnostics_symbol()
	local icons = require("config.icons")
	local signs = {
	  { hl = "DiagnosticSignError", text = icons.diagnostics.Error },
	  { hl = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
	  { hl = "DiagnosticSignHint", text = icons.diagnostics.Hint },
	  { hl = "DiagnosticSignInfo", text = icons.diagnostics.Information },
	}

	for _, sign in pairs(signs) do
	      vim.fn.sign_define(sign.hl, { texthl = sign.hl, text = sign.text, numhl = sign.hl })
	end
end
Setup_diagnostics_symbol()


-- lualine theme
require('lualine').setup({options={theme='nightfly'}})
