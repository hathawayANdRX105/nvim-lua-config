local which_key = Check_status("which-key")

local leader_maps = {
  ['`'] = { "<cmd>SymbolsOutline<CR>", "symbols" },
  -- ["1"] = { "<cmd>lua require'util.toggle'.TreeToggle()<CR>", "explorer" },
  ["1"] = { "<cmd>lua require'nvim-tree'.toggle()<CR>", "explorer" },
  ["2"] = { "<cmd>Telescope file_browser<CR>", "file-browser" },
  ["3"] = { "<cmd>ToggleTerm<CR>", "terminal" },
  ['4'] = { "<cmd>Telescop projects<CR>", "switch-projects" },
  ['0'] = { [[<cmd>lua require"telescope.builtin".buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>]], "switch" },
  ['<CR>'] = { "<cmd>source<CR>", "source" },

  d = {
    name = "+Debug",
    d = { "<cmd>lua require('dapui').toggle()<CR>", "debug" },
    o = { "<cmd>lua require('dapui').open()<CR>", "debug-open" },
    c = { "<cmd>lua require('dapui').close()<CR>", "debug-close"},

  },

  v = {
    name = "+View",
    c = { "<cmd>LuaCacheClear<CR>", 	"cache-clear" },
    l = { "<cmd>LuaCacheLog<CR>", 		"cache-log" },
    p = { "<cmd>LuaCacheProfile<CR>",	"cache-profile"},
  },

  w = {
    name = "+Window",
    h = { "<C-W>h", "to-left" },
    j = { "<C-W>j", "to-down" },
    k = { "<C-W>k", "to-up"   },
    l = { "<C-W>l", "to-right"},

    H = { "<C-W>H", "move-left" },
    J = { "<C-W>J", "move-down" },
    K = { "<C-W>K", "move-up"   },
    L = { "<C-W>L", "move-right"},

    s = { "<cmd>lua require'focus'.split_command('j')<CR>", "split"},
    v = { "<cmd>lua require'focus'.split_command('l')<CR>", "vertical"},

    -- n = { "<C-w>w", "win-next"},
    p = { "<cmd>WindowPick<CR>", "window-pick"},
    z = { "<cmd>WindowZap<CR>", "window-zap"},
    w = { "<cmd>WindowSwap<CR>", "window-swap"},
    c = { "<C-w>c", "close"},
  },

  b = {
    name = "+Buffer",
    k = { "<cmd>BufferClose<CR>"    , "kill" },
    d = { "<cmd>BufferDelete<CR>"   , "delete" },
    n = { "<cmd>BufferNext<CR>"     , "buf-next" },
    l = { "<cmd>BufferLast<CR>"     , "buf-last" },
    p = { "<cmd>BufferPrevious<CR>" , "buf-prev" },
    b = { [[<cmd>lua require"telescope.builtin".buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>]], "switch" },
    o = {
      name = "+Buffer-Order",
      n = { "<cmd>BufferOrderByBufferNumber<CR>" , 'order-by-number'},
      d = { "<cmd>BufferOrderByDirectory<CR>"    , 'order-by-directory'},
      l = { "<cmd>BufferOrderByLanguage<CR>"     , 'order-by-language'},
    }
  },

  f = {
    name = "+File",
    f = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", "open-file" },
    r = { " <cmd>Telescop oldfiles<CR>      " , " recent-file  " },
    g = { " <cmd>Telescop git_files<CR>     " , " git-file     " },
    s = { " <cmd>silent write<CR>           " , " save-file    " },
    b = { " <cmd>Telescope file_browser<CR> " , " file-browser " },
  },

  s = {
    name = "+Search",
    s = { "<cmd>Telescop current_buffer_fuzzy_find<CR>", "lines" },
    k = { "<cmd>Telescop keymaps<CR>", "keymaps" },
    q = { "<cmd>Telescop quickfix<CR>", "quickfix" },
    m = { "<cmd>Telescop marks<CR>", "marks" },
    c = { "<cmd>Telescop commands<CR>", "commands" },
    h = { "<cmd>Telescop search_history<CR>", "search-history" },
    t = { "<cmd>Telescop tags<CR>", "tags" },
  },

  p = {
    name = "+Project",
    p = { "<cmd>Telescop projects<CR>", "switch-projects" },
    s = { "<cmd>Telescop grep_string<CR>", "search-string" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Symbols", },
    w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Diagnostics", },
    l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "show-folder", },
    a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "add-folder", },
    d = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "remove-folder", },
  },

  q = {
    name = "+Session",
    a = { "<cmd>Alpha<CR>", "alpha" },
    q = { "<cmd>qa!<CR>", "quit-nvim" },
    l = { "<cmd>SessionManager load_session<CR>", "load-session" },
    d = { "<cmd>SessionManager delete_session<CR>", "delete-session" },
    s = { "<cmd>SessionManager save_current_session<CR>", "save-session" },
    c = { "<cmd>SessionManager load_current_session<CR>", "load-current-session" },
    ['<tab>'] = { "<cmd>SessionManager load_last_session<CR>", "load-last-session" },
  },

  l = {
    name = "+Lsp",
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>",	"lsp-rename" },
    R = { "<cmd>lua require('renamer').rename({empty=true})<CR>",	"renamer" },

    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code-action" },
    A = { "<cmd>CodeActionMenu<CR>", "code-action" },

    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>",  "format" },
    c = { "<cmd>lua vim.lsp.codelens.run()<CR>",  "code-action" },
    L = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",  "lsp-quickfix" },

    q = { "<cmd>TroubleToggle quickfix<CR>",  "quickfix" },
    l = { "<cmd>TroubleToggle loclist<CR>",  "quickfix" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "trouble-workplace" },
    F = { "<cmd>TroubleToggle lsp_references<CR>",  "trouble-reference" },

    s = { "<cmd>Telescope lsp_document_symbols<CR>",  "document-symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",  "workplace-symbols" },

    j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",  "next-fix" },
    k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>",  "prev-fix" },

    g = {
      name = "lsp-goto",
      D = {  '<cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration' },
      d = {  '<cmd>lua vim.lsp.buf.definition()<CR>', 'definition' },
      i = {  '<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation' },
      r = {  '<cmd>lua vim.lsp.buf.references()<CR>', 'references' },
    }

  },

  t = {
    name = "+Toggle",
    t = { "<cmd>Telescope<CR>", "telescope"},
    i = { "<cmd>LspInstallInfo<CR>", "lsp-installer"},
    d = { "<cmd>Gitsigns diffthis HEAD<CR>", "diff" },
    s = { "<cmd>Gitsigns toggle_signs<CR>", "signs" },
    h = { "<cmd>:set hlsearch!<CR>", "hlsearch" },
    g = { "<cmd>Neogit<CR>", "git" },
    I = { "<cmd>PackerInstall<CR>", "packer-install" },
    C = { "<cmd>PackerClean<CR>", "packer-clean" },
    S = { "<cmd>PackerSync<CR>", "packer-sync" },
  },

  j = {
    name = "+Jump",
    j = { "<cmd>HopChar1<CR>",	"hop-char1" },
    w = { "<cmd>HopWord<CR>",	"hop-word" },
    l = { "<cmd>HopLine<CR>",	"hop-line" },
    p = { "<cmd>HopPattern<CR>",	"hop-pattern" },
    k = { "<cmd>HopChar2<CR>",	"hop-char2" },
  },

  g = {
    name = "+Git",
    g = { "<cmd>Neogit kind=split_above<CR>",	"neogit-status" },
    c = { "<cmd>Neogit commit<CR>",			"neogit-commit" },
    b = { "<cmd>Neogit branch<CR>",			"neogit-branch" },
    r = { "<cmd>Neogit rebase<CR>",			"neogit-rebase" },
    p = { "<cmd>Neogit pull<CR>",			"neogit-pull" },
    P = { "<cmd>Neogit push<CR>",			"neogit-push" },
    Z = { "<cmd>Neogit stash<CR>",			"neogit-stash" },
    L = { "<cmd>Neogit log<CR>",			"neogit-log" },
    j = { "<cmd>Gitsigns prev_hunk<CR>",		"prev-hunk" },
    k = { "<cmd>Gitsigns next_hunk<CR>",		"next-hunk" },
    v = { "<cmd>Gitsigns preview_hunk<CR>",		"preview-hunk" },
    s = {
      name = "+Stage",
      h = { "<cmd>Gitsigns stage_hunk<CR>", "stage-hunk" },
      b = { "<cmd>Gitsigns stage_buffer<CR>", "stage-buffer" },
      u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "undo-stage" },
    },
    R = {
      name = "+Reset",
      h = { "<cmd>Gitsigns reset_hunk<CR>", "reset-hunk" },
      b = { "<cmd>Gitsigns reset_buffer<CR>", "reset-buffer" },
    },
    d = {
      name = "+Diff",
      o = { "<cmd>DiffviewOpen<CR>",			"diff-view" },
      c = { "<cmd>DiffviewClose<CR>",			"diff-view-close" },
      h = { "<cmd>DiffviewFileHistory<CR>",		"diff-file-history"},
    },
  }
}

local localleader_mappings = {
  name = "+LocalLeader",

  r = { "<cmd>Telescop search_history<CR>", "file-history" },
  b = { [[<cmd>lua require"telescope.builtin".buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>]], "switch" },

  p = { "clipboard-paste" },
  y = { "clipboard-paste" },
  d = { "clipboard-delete" },

  a = { "<cmd>CodeActionMenu<CR>", "code-action" },
  q = { "<cmd>lua require'util.toggle'.QfToggle()<CR>", "quickfix-list" },
  D = { "<cmd>lua require('dapui').toggle()<CR>", "debug" },

  i = {
    name = "+iswap",
    i = { "<cmd>ISwapWith<CR>",	"swap-with-current" },
    s = { "<cmd>ISwap<CR>",		"swap-select" },
  },

  s = { "<cmd>Telescop current_buffer_fuzzy_find<CR>", "quick-fuzzy" },
  f = { "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", "quick-file" },
  m = { '<cmd>Telescope marks', "quick-mark" },

  ['='] = { "mqGVgg=`q", "indent-file" },
}


local g_mappings = {
  name = "+goto",
  a = { '<C-Home>', 'goto-head' },
  e = { '<C-End>', 'goto-end' },

  w = { '<cmd>HopWord<CR>',	'hop-word' },
  l = { '<cmd>HopLine<CR>',	'hop-line' },
  j = { '<cmd>HopChar1<CR>',	'hop-char1' },


  [';'] = { [[<cmd>lua require("Comment.api").toggle_current_linewise()<CR>]],
    "comment-line"
  },
  ['/'] = { [[<cmd>lua require("Comment.api").toggle_current_blockwise()<CR>]],
    "comment-block"
  },

  -- window swap / window zap
  p = { "<cmd>WindowPick<CR>",	"window-pick" },
  b = { "<cmd>BufferPick<CR>",  "buffer-pick" },

  d = { "<cmd>Trouble lsp_definitions<CR>", "trouble-definition" },
  r = { "<cmd>Trouble lsp_references<CR>", "trouble-reference" },
  i = { "<cmd>Trouble lsp_implementations<CR>", "trouble-implemention" },
  y = { "<cmd>Trouble lsp_type_definitions<CR>", "trouble-type-definition" },
  q = { "<cmd>Trouble quickfix<CR>", "trouble-quickfix" },


  t = {
    name = "+Todo-item",
    u = "task-undo",
    p = "pending",
    d = "done",
    h = "on-hold",
    c = "cancel",
    r = "recurring",
    i = "important",
  }
}

local g_vmode_mappings = {
  name = "+goto",
  -- [';'] = { [[<cmd>lua require("Comment.api").locked.toggle_linewise_op(vim.fn.visualmode())<CR>]],
  -- 	"comment-block"
  -- },
  -- ['/'] = { [[<cmd>lua require("Comment.api").locked.toggle_blockwise_op(vim.fn.visualmode())<CR>]],
  -- 	"comment-line"
  -- },
  [';'] = { "comment-block" },
  ['/'] = { "comment-line" },
}
local w_mappings = {
  name = "+Quick-window",
  h = { "<C-W>h", "to-left" },
  j = { "<C-W>j", "to-down" },
  k = { "<C-W>k", "to-up"   },
  l = { "<C-W>l", "to-right"},

  H = { "<C-W>H", "move-left" },
  J = { "<C-W>J", "move-down" },
  K = { "<C-W>K", "move-up"   },
  L = { "<C-W>L", "move-right"},

  s = { "<cmd>lua require'focus'.split_command('j')<CR>", "split"},
  v = { "<cmd>lua require'focus'.split_command('l')<CR>", "vertical"},

  p = { "<cmd>WindowPick<CR>", "window-pick"},
  z = { "<cmd>WindowZap<CR>", "window-zap"},
  w = { "<cmd>WindowSwap<CR>", "window-swap"},
  c = { "<C-w>c", "close"},
}

local b_mappings = {
  name = '+Quick-buf',
  d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "goto-preview-definition",},
  i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "goto-preview-implementation",},
  r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "goto-preview-reference",},

  o = { "<cmd>BufferPin<CR>", "buf-pin"},
  O = { "<cmd>BufferCloseAllButPinned<CR>", "buf-close-except-pinned" },

  h = { "<cmd>BufferCloseBuffersLeft<CR>", "buf-close-left" },
  l = { "<cmd>BufferCloseBuffersRight<CR>", "buf-close-right" },

  w = { "<cmd>BufferWipeout<CR>", "buf-wipe" },
  k = { "<cmd>BufferClose<CR>", "buf-close",},
  K = { "<cmd>BufferCloseAllButCurrent<CR>", "buf-close-but-current" },

  p = { "<cmd>BufferPick<CR>", "buf-pick" },

}

local left_bracket_mappings = {
  name = "+Prev-Nav",
  c = { "&diff ? ']c' : '<cmd>Gitsigns prev_hunk<CR>'" ,		"prev-hunk" },
  b = { "<cmd>BufferPrevious<CR>", "buf-prev" },
  w = { "<C-w>p", "window-prev" },
  t = { '<cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>' ,		"prev-trouble" },
  d = {
    [[ <cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning", popup_opts = {border = "single"}})<CR> ]],
    'prev-diagnostic'
  },
  ['<space>'] = { 'meO<Esc>`e', "plug-line-above" },
}

local right_bracket_mappings = {
  name = "+Next-Nav",
  c = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" ,		"next-hunk" },
  t = { '<cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>' ,		"next-trouble" },
  w = { "<C-w>w", "window-next" },
  b = { "<cmd>BufferNext<CR>", "buf-next" },
  d = {
    [[ <cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning", popup_opts = {border = "single"}})<CR> ]],
    'prev-diagnostic'
  },
  ['<space>'] = { 'meo<Esc>`e', "plug-line-below" },
}

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    ["<cr>"] = "RET",
    ["<CR>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜ ", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}


local setup_opts = function (mode, prefix, buffer, isSilent, isNoremap, isNowait)
  return {
    mode = mode, -- NORMAL mode
    prefix = prefix,
    buffer = buffer, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = isSilent, -- use `silent` when creating keymaps
    noremap = isNoremap, -- use `noremap` when creating keymaps
    nowait = isNowait, -- use `nowait` when creating keymaps
  }
end

local ft_mappings = require'system-build.mode-action'.mappings

local leader_opts = setup_opts("n", "<leader>", nil, true, true, true)

local g_opts = setup_opts("n", "g", nil, true, true, true)
local g_vmode_opts = setup_opts("v", "g", nil, true, true, true)

local w_opts = setup_opts("n", "w", nil, true, true, true)
local b_opts = setup_opts("n", "b", nil, true, true, true)

local left_bracket_opts = setup_opts("n", "[", nil, true, true, true)
local right_bracket_opts = setup_opts("n", "]", nil, true, true, true)

local localleader_opts = setup_opts("n", "<localleader>", nil, true, true, true)
local ft_opts = setup_opts("n", ";", nil, true, true, true)

which_key.setup(setup)

which_key.register(leader_maps, leader_opts)
which_key.register(localleader_mappings, localleader_opts)
which_key.register(ft_mappings, ft_opts)
which_key.register(g_mappings, g_opts)
which_key.register(g_vmode_mappings, g_vmode_opts)

which_key.register(w_mappings, w_opts)
which_key.register(b_mappings, b_opts)

which_key.register(left_bracket_mappings, left_bracket_opts)
which_key.register(right_bracket_mappings, right_bracket_opts)
