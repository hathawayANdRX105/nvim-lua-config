local M = {}

M.auto_modules = {
	'common.ui',
	'common.default',
	'common.keymappings',
	'config.which-key',

	'lsp',
  'config.ui',
  'config.edit-operation',
  'config.enhance-vision',
  'config.quick-browse',

  'system-build',

  'config.session',
	'config.nvim-cmp',
  'config.toggleterm',

  'config.git',
  -- 'system-debug',
}

M.lazy_modules = {
}

return M
