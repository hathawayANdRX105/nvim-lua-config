local nvim_tree = Check_status('nvim-tree')
local nvim_tree_config = Check_status('nvim-tree.config')

local icons = require'config.icons'
local tree_cb = nvim_tree_config.nvim_tree_callback

vim.g.nvim_tree_indent_markers = 1

vim.g.nvim_tree_icons = {
       default=        "ﴔ",
       symlink=        "",
       git= icons.git,
       folder= icons.folder,
       lsp= {
	      hint = icons.diagnostics.Hint,
	      info = icons.diagnostics.Information,
	      warning = icons.diagnostics.Warning,
	      error = icons.diagnostics.Error,
        }
       }

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

nvim_tree.setup {
  disable_netrw        = true,
  hijack_netrw         = true,
  open_on_setup        = false,
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup   = {"startify", "dashboard", "alpha"},
  auto_close           = true,
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = true,
  update_cwd           = true,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = icons.diagnostics.Hint,
      info = icons.diagnostics.Information,
      warning = icons.diagnostics.Warning,
      error = icons.diagnostics.Error,
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = { ".git", }
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  -- default git integration
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'right',
    auto_resize = true,
    preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {
      	{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "?", cb = tree_cb "toggle_help" },
      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  show_icons = {
		git = 1,
		files   = 1,
    folders = 1,
		folder_arrows = 1,
		tree_width    = 30,
	},
}
