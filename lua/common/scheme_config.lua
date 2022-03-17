return {
	tokyonight = {
		global_config = {
			lightline = { colorscheme ='tokyonight'},
			tokyonight_italic_functions = true,
			tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" },
			tokyonight_colors = { hint = "orange", error = "#ff0000" },
			registers_return_symbol = "↵",
		},
		setup = function() end

	},

	nightfly = {
		global_config = {
			moonflyIgnoreDefaultColors = 1,
			nightflyCursorColor = 1,
			nightflyTransparent = 1,
			nightflyUnderlineMatchParen = 1,
		},
		setup = function()
			require('lualine').setup({options = {theme = 'nightfly'}})
		end
	},

	catppuccin = {
		global_config = {
			lightline = { colorscheme= 'catppuccin'},
		},
		setup = function()
			local catppuccin = require("catppuccin")
			catppuccin.setup()

			require('lualine').setup { options = { theme = "catppuccin" }}
		end

	}

}
