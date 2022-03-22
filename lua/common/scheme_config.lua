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
			catppuccin.setup({
        transparent_background = false,
        term_colors = true,
        styles = {
            comments = "italic",
            functions = "italic",
            keywords = "italic",
            strings = "NONE",
            variables = "italic",
        },
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
              },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
              },
          },
          lsp_trouble = true,
          cmp = true,
          lsp_saga = true,
          gitgutter = false,
          gitsigns = true,
          telescope = true,
          nvimtree = {
            enabled = true,
            show_root = false,
            transparent_panel = false,
          },
          neotree = {
            enabled = true,
            show_root = false,
            transparent_panel = false,
          },
          which_key = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          neogit = true,
          barbar = true,
          ts_rainbow = true,
          hop = true,
          symbols_outline = true,

          dashboard = false,
          vim_sneak = false,
          fern = false,
          bufferline = false,
          markdown = false,
          lightspeed = false,
          notify = false,
          telekasten = false,
        }
      })

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

	},

  moonlight = {
    global_config = {
			moonlight_italic_comments = true,
			moonlight_italic_keywords = true,
			moonlight_italic_functions = true,
			moonlight_italic_variables = false,
			moonlight_contrast = true,
			moonlight_borders = false,
			moonlight_disable_background = false,
    },
    setup = function() 
      require('lualine').setup { options = { theme = 'moonlight' } }
      require('moonlight').set{}
    end
  },

  calvera = {
    global_config = {
      calvera_borders = true,
      calvera_contrast = true,
      calvera_hide_eob = true,
      calvera_custom_colors = {contrast = "#0f111a"},
      calvera_italic_comments = true,
      calvera_italic_keywords = true,
      calvera_italic_functions = true,
    },
    setup = function()
     require('calvera').set() 
    end
  }
}
