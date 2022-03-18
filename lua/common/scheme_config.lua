return {
	tokyonight = {
		global_config = {
			tokyonight_style = "night",
			lightline = { colorscheme ='tokyonight'},
			tokyonight_italic_functions = true,
			tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" },
			tokyonight_colors = { hint = "orange", error = "#ff0000" },
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

	},

	kanagawa = {
		global_config = {
			lightline = { colorscheme= 'kanagawa'},
		},
		setup = function()
			require('lualine').setup { options = { theme = "kanagawa" }}
		end

	}

}
