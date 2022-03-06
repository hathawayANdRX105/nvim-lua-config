
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

	'config.alpha',
	'config.lualine',
	'config.bufferline',

	'config.quick-browse.telescope',
	'config.quick-browse.symbols-outline',
	'config.quick-browse.nvim-tree',
	'config.quick-browse.project',

	'config.nvim-cmp',
	'lsp.lsp-installer',
	'lsp.signature',
	'lsp.trouble',

	'system-build',

	'config.enhance-vision.neoscroll',
	'config.enhance-vision.indent',
	'config.enhance-vision.treesitter',
	'config.enhance-vision.renamer',
	-- 'config.enhance-vision.transparent',

	'config.git.gitsigns',
	'config.git.neogit',
	'config.git.diffview',
}


require('util').load_module(modules)
