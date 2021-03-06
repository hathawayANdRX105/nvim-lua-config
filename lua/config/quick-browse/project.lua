local project = Check_status('project_nvim')

-- keymap when telescope project
--[[
-- normal	| insert	| action 
-- f		| <c-f>		| find_project_files
-- b		| <c-b>		| browse_project_files
-- d		| <c-d>		| delete_project
-- s		| <c-s>		| search_in_projec_files
-- r		| <c-s>		| recent_project_files
-- w		| <c-w>		| change_working_directory
--]]

project.setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },

  -- Manual mode doesn't automatically change your root directory, so you have
  -- the option to manually do so using `:ProjectRoot` command.
  manual_mode = false,

  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearangne the detection methods.
  detection_methods = { "lsp", "pattern" },

  -- All the patterns used to detect root dir, when **"pattern"** is in
  -- detection_methods
  patterns = { ".git", ".mark", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

  -- Table of lsp clients to ignore by name
  -- eg: { "efm", ... }
  ignore_lsp = {},

  -- Don't calculate root dir on specific directories
  -- Ex: { "~/.cargo/*", ... }
  exclude_dirs = {
    "c:/Users/Administrator/project/*",
    "c:/Users/Administrator/.AppData/*",
  },

  -- Show hidden files in telescope
  show_hidden = false,

  -- When set to false, you will get a message when project.nvim changes your
  -- directory.
  silent_chdir = true,

  -- Path where project.nvim will store the project history for use in
  -- telescope
  datapath = vim.fn.stdpath("data"),
})

local telescope = Check_status('telescope')
telescope.load_extension('projects')

