local ui_global_config = {
	asyncrun_open = 10,
	-- fix up for cursorhold
	cursorhold_updatetime = 100,
	neovide_transparency = 0.999,

	registers_return_symbol = "↵",
 }

local ui_opt_config = {
	-- guifont = 'Lekton Nerd Font Mono:h20',
	-- guifont = 'mononoki Nerd Font Mono:h18',
	guifont = 'JetBrainsMono Nerd Font Mono:h18',
	updatetime = 250,
}



local cmds = {
	-- renamer
	-- [[hi default link RenamerNormal Normal]],
	-- [[hi default link RenamerBorder RenamerNormal]],
	-- [[hi default link RenamerTitle Identifier]],
	-- [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]],


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

	-- ui
	[[set termguicolors]],
	[[set cursorline]],
}

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

-- backup scheme: kanagawa / tokyonight / catppuccin
-- vim.cmd[[colorscheme nightfly]]


local function Setup_colorscheme(scheme_name)
	local scheme_config = require'common.scheme_config'
	local scheme_global_config = scheme_config[scheme_name].global_config
	local scheme_setup = scheme_config[scheme_name].setup

  -- perhaps i miss setup scheme config & setup func
  if scheme_config ~= nil then
    Load_global_set(scheme_global_config)
  end

  if scheme_setup ~= nil then
    scheme_setup()
  end

	vim.cmd("colorscheme "..scheme_name)
end

return {
  setup = function()
    local theme = 'catppuccin'

    Load_global_set(ui_global_config)
    Load_set(ui_opt_config)
    Load_cmd(cmds)
    Setup_diagnostics_symbol()
    Setup_colorscheme(theme)
  end,
}
