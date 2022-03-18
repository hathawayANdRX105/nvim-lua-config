local treesitter = Check_status('nvim-treesitter.configs')

treesitter.setup {
	 ensure_installed = { "go", "python", "lua", "norg", "vim", "markdown", "c", "cpp", },
	 sync_install = false,
	 ignore_install = { "javascript" },
	 highlight = {
		 -- `false` will disable the whole extension
		 enable = true,

		 -- list of language that will be disabled
		 disable = { "css" },

		 -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		 -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		 -- Using this option may slow down your editor, and you may see some duplicate highlights.
		 -- Instead of true it can also be a list of languages
		 additional_vim_regex_highlighting = true,
	 },
	incremental_selection = {
		 enable = true,
		 keymaps = {
			 init_selection = '<CR>',
			 node_incremental = '<CR>',
			 node_decremental = '<BS>',
			 scope_incremental = '<TAB>',
		 }
	 },
	 autopairs = { enable = true },
	 indent = { enable = true },
	 rainbow = {
		 enable = true,
		 disable = { "css", },
		 -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		 extended_mode = true,
		 max_file_lines = nil, -- Do not enable for files with more than n lines, int
		 -- colors = {}, -- table of hex strings
		 -- termcolors = {} -- table of colour name strings
	  }
}
