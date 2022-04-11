
local opt = { noremap=true, silent=true }


local keymap_list = {
    -- setup leader
  { mode='n', key = '<space>'  , map= '<NOP>'              , opt=opt },
  { mode='n', key = '<F11>'  , map= ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>"              , opt=opt },
  { mode='n', key = '<C-n>', map = '<Down>', opt=opt },
  { mode='n', key = '<C-b>', map = '<Left>', opt=opt },

    -- localleader keymappings
  { mode='n', key = '<localleader>p', map = '"+p', opt=opt },
  { mode='v', key = '<localleader>p', map = '"+p', opt=opt },
  { mode='n', key = '<localleader>y', map = '"+y', opt=opt },
  { mode='v', key = '<localleader>y', map = '"+y', opt=opt },
  { mode='n', key = '<localleader>d', map = '"+d', opt=opt },
  { mode='v', key = '<localleader>d', map = '"+d', opt=opt },

    -- normal line oper
  { mode='n', key = '<C-j>', map = 'meO<Esc>`e', opt=opt },
  { mode='n', key = '<C-l>', map = 'V', opt=opt },
  { mode='n', key = '<C-a>', map = '<Esc>^', opt=opt },
  { mode='n', key = '<C-e>', map = '<Esc>$', opt=opt },

    -- await oper
  { mode='n', key = 'c4', map = 'c$', opt=opt },
  { mode='n', key = 'd4', map = 'd$', opt=opt },
  { mode='n', key = 'y4', map = 'y$', opt=opt },
  { mode='n', key = 'v4', map = 'v$', opt=opt },

    -- insert motion oper
  { mode='i', key = 'jj', map = '<esc>', opt=opt },
    { mode='i' , key = '<C-a>' , map = '<Esc>^i'  , opt=opt } ,
    { mode='i' , key = '<C-e>' , map = '<Esc>$a'  , opt=opt } ,
    { mode='i' , key = '<C-p>' , map = '<Up>'     , opt=opt } ,
    { mode='i' , key = '<C-n>' , map = '<Down>'   , opt=opt } ,
    { mode='i' , key = '<C-b>' , map = '<Left>'   , opt=opt } ,
    { mode='i' , key = '<C-f>' , map = '<Right>'  , opt=opt } ,
    { mode='i' , key = '<C-u>' , map = "<Esc>u`'" , opt=opt } ,

    -- insert motion using Meta key
  -- { mode = 'i' , key = '<M-a>'  , map = '<Esc>^i'     , opt = opt } ,
  -- { mode = 'i' , key = '<M-e>'  , map = '<End>'       , opt = opt } ,
  --
  -- { mode = 'i' , key = '<M-h>'  , map = '<Left>'      , opt = opt } ,
  -- { mode = 'i' , key = '<M-l>'  , map = '<Right>'     , opt = opt } ,
  -- { mode = 'i' , key = '<M-p>'  , map = '<Up>'        , opt = opt } ,
  -- { mode = 'i' , key = '<M-n>'  , map = '<Down>'      , opt = opt } ,
  --
  -- { mode = 'i' , key = '<M-f>'  , map = '<S-Right>'   , opt = opt } ,
  -- { mode = 'i' , key = '<M-b>'  , map = '<S-Left>'    , opt = opt } ,
  --
  -- { mode = 'i' , key = '<M-u>'  , map = "<Esc>u`'"    , opt = opt } ,
  -- { mode = 'i' , key = '<M-CR>' , map = '<Esc>$a<CR>' , opt = opt } ,

    -- { mode='i', key = '<C-CR>', map = '<Esc>$a<CR>', opt=opt },


    -- lsp show-hover & signature help
  { mode='n', key = 'K', map = '<cmd>lua vim.lsp.buf.hover()<CR>', opt=opt },
  { mode='n', key = '<M-;>', map = '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt=opt },
  { mode='i', key = '<M-;>', map = '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt=opt },

    -- dial 0
  { mode='n', key = "<M-a>", map = '<cmd>DialIncrement<CR>', opt=opt },
  { mode='n', key = "<M-d>", map = '<cmd>DialDecrement<CR>', opt=opt },
  { mode='v', key = "<M-a>", map = '<cmd>DialIncrement<CR>', opt=opt },
  { mode='v', key = "<M-d>", map = '<cmd>DialDecrement<CR>', opt=opt },


    -- dap debug keymappings
  { mode='n', key = '<F8>' , map= "<cmd>lua require'dap'.step_over()<CR>"    , opt=opt },
  { mode='n', key = '<F7>' , map= "<cmd>lua require'dap'.step_into()<CR>"    , opt=opt },
  { mode='n', key = '<S-F8>' , map= "<cmd>lua require'dap'.step_out()<CR>"   , opt=opt },
  { mode='n', key = '<C-F8>' , map= "<cmd>lua require'dap'.toggle_breakpoint()<CR>"   , opt=opt },
  { mode='n', key = '<F9>' , map= "<cmd>lua require'dap'.continue()<CR>"   , opt=opt },
}

return {
  setup = function ()
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ','
    -- vim load keymap bindings
    Load_keymap(keymap_list)
  end
}
