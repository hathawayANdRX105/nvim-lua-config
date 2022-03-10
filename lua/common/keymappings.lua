vim.g.mapleader = ' '
vim.g.maplocalleader = ','

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
	{ mode='n', key = '[<space>', map = 'meO<Esc>`e', opt=opt },
	{ mode='n', key = ']<space>', map = 'meo<Esc>`e', opt=opt },

	-- await oper
	{ mode='n', key = 'c4', map = 'c$', opt=opt },
	{ mode='n', key = 'd4', map = 'd$', opt=opt },
	{ mode='n', key = 'y4', map = 'y$', opt=opt },
	{ mode='n', key = 'v4', map = 'v$', opt=opt },

	-- insert motion oper
	{ mode='i', key = 'jj', map = '<esc>', opt=opt },
	{ mode='i', key = '<C-a>', map = '<Esc>^i', opt=opt },
	{ mode='i', key = '<C-e>', map = '<Esc>$a', opt=opt },
	{ mode='i', key = '<C-p>', map = '<Up>', opt=opt },
	{ mode='i', key = '<C-n>', map = '<Down>', opt=opt },
	{ mode='i', key = '<C-b>', map = '<Esc>i', opt=opt },
	{ mode='i', key = '<C-f>', map = '<Esc><Right>a', opt=opt },
	{ mode='i', key = '<C-u>', map = "<Esc>u`'", opt=opt },
	{ mode='i', key = '<M-f>', map = '<S-Right>', opt=opt },
	{ mode='i', key = '<M-b>', map = '<S-Left>', opt=opt },

	{ mode='i', key = '<C-CR>', map = '<Esc>$a<CR>', opt=opt },

	-- renamer
	{ mode='i', key = '<F2>', 	map = '<cmd>lua require("renamer").rename({empty=true})<cr>', opt=opt },
	{ mode='n', key = '<F2>', 	map = '<cmd>lua require("renamer").rename({empty=true})<cr>', opt=opt },
	{ mode='v', key = '<leader>lr', map = '<cmd>lua require("renamer").rename({empty=true})<cr>', opt=opt },
	-- { mode='n', key = '<leader>lr', map = '<cmd>lua require("renamer").rename()<cr>', opt=opt }, -- this add in which-key mapping

}

-- vim load keymap bindings
Load_keymap(keymap_list)
