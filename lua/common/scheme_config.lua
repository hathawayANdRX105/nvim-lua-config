local GetRandomPick = require('common.ui').GetRandomPick

return {
  tokyonight = {
    global_config = {
      tokyonight_style = "night",
      lightline = { colorscheme ='tokyonight'},
      tokyonight_italic_functions = true,
      tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" },
      tokyonight_colors = { hint = "orange", error = "#ff0000" },
    },
    setup = function()
      local styles = { 'storm', 'night', 'day'}
      vim.g.tokyonight_style = GetRandomPick(styles)
    end

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
          strings = "italic",
          variables = "NONE",
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
          gitsigns = false,
          telescope = true,
          nvimtree = {
            enabled = true,
            show_root = false,
            transparent_panel = false,
          },
          which_key = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          neogit = true,
          barbar = true,
          ts_rainbow = true,
          hop = true,
          symbols_outline = true,
          notify = true,
          dashboard = true,

          neotree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
          },
          vim_sneak = false,
          fern = false,
          bufferline = false,
          markdown = false,
          lightspeed = false,
          telekasten = false,
        }
      })

      require('lualine').setup { options = { theme = 'catppuccin' }}
    end

  },

  kanagawa = {
    global_config = {
      lightline = { colorscheme= 'kanagawa'},
    },
    setup = function()
      require('lualine').setup { options = { theme = "kanagawa" }}

      require('kanagawa').setup({
        undercurl = true,           -- enable undercurls
        commentStyle = "italic",
        functionStyle = "NONE",
        keywordStyle = "italic",
        statementStyle = "bold",
        typeStyle = "NONE",
        variablebuiltinStyle = "italic",
        specialReturn = true,       -- special highlight for the return keyword
        specialException = true,    -- special highlight for exception handling keywords
        transparent = false,        -- do not set background color
        dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
        globalStatus = false,       -- adjust window separators highlight for laststatus=3
      })
    end

  },

  -- moonlight = {
  --   global_config = {
  --     moonlight_italic_comments = true,
  --     moonlight_italic_keywords = true,
  --     moonlight_italic_functions = true,
  --     moonlight_italic_variables = false,
  --     moonlight_contrast = true,
  --     moonlight_borders = false,
  --     moonlight_disable_background = false,
  --   },
  --   setup = function()
  --     require('lualine').setup { options = { theme = 'moonlight' } }
  --     require('moonlight').set{}
  --   end
  -- },

  -- calvera = {
  --   global_config = {
  --     calvera_borders = true,
  --     calvera_contrast = true,
  --     calvera_hide_eob = true,
  --     calvera_custom_colors = {contrast = "#0f111a"},
  --     calvera_italic_comments = true,
  --     calvera_italic_keywords = true,
  --     calvera_italic_functions = true,
  --   },
  --   setup = function()
  --     require('calvera').set()
  --   end
  -- },

  material = {
    global_config = {

    },
    setup = function()
      local styles = { "darker", "lighter", "ocenanic", "palenight", "deep ocean", }
      local style = GetRandomPick(styles)
      vim.g.material_style = style

      require('lualine').setup { options = { theme = 'material' } }

      require('material').setup({

        contrast = {
          sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = true, -- Enable contrast for floating windows
          line_numbers = true, -- Enable contrast background for line numbers
          sign_column = true, -- Enable contrast background for the sign column
          cursor_line = true, -- Enable darker background for the cursor line
          non_current_windows = false, -- Enable darker background for non-current windows
          popup_menu = true, -- Enable lighter background for the popup menu
        },

        italics = {
          comments = true, -- Enable italic comments
          keywords = true, -- Enable italic keywords
          functions = true, -- Enable italic functions
          strings = false, -- Enable italic strings
          variables = false -- Enable italic variables
        },

        contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
          "nvimtree",
          "terminal", -- Darker terminal background
          "packer", -- Darker packer background
          "qf" -- Darker qf list background
        },

        high_visibility = {
          lighter = true, -- Enable higher contrast text for lighter style
          darker = true -- Enable higher contrast text for darker style
        },

        disable = {
          borders = false, -- Disable borders between verticaly split windows
          background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
          term_colors = false, -- Prevent the theme from setting terminal colors
          eob_lines = false -- Hide the end-of-buffer lines
        },

        lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
        async_loading = true -- Load parts of the theme asyncronously for faster startup (turned on by default)
      })
    end
  },
}
