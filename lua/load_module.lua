require('util')

local modules = {
	'util',
	'plugins',
	'config.icons',
	'common.ui',
	'common.default',
	'common.keymappings',
	'config.which-key',

	'config.edit-operation.hop',
	'config.edit-operation.surround',
	'config.edit-operation.iswap',
	'config.edit-operation.comment',
	'config.edit-operation.auto-pairs',

	'config.ui.alpha',
	'config.ui.lualine',
	'config.ui.barbar',
--	'config.ui.bufferline',

	'config.session',
	'config.quick-browse.telescope',
	'config.quick-browse.symbols-outline',
	'config.quick-browse.nvim-tree',
	'config.quick-browse.project',

	'config.nvim-cmp',

	'lsp',
	-- 'system-debug',
	'system-build',

	'config.enhance-vision.neoscroll',
	'config.enhance-vision.indent',
	'config.enhance-vision.treesitter',
	'config.enhance-vision.renamer',
	'config.enhance-vision.bqf',

	'config.toggleterm',

	'config.git.gitsigns',
	'config.git.neogit',
	'config.git.diffview',
	-- 'config.iron',

	'config.neorg',

}


Load_module(modules)

-- function NeorgLazyLoad()
-- 	vim.cmd[[:PackerLoad neorg]]
-- end
-- vim.cmd[[au filetype ]]
