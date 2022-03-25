return	{
  -- speed up startup
  'lewis6991/impatient.nvim', 			-- cache require module

  -- ui
  -- bufferline / nvim-tree / lualine need icon plugin
  'kyazdani42/nvim-web-devicons',
  'folke/which-key.nvim',			-- space which-key
  --  'akinsho/bufferline.nvim',			-- buffer line
  'nvim-lualine/lualine.nvim',			-- status line
  'goolord/alpha-nvim',			-- Startup screen

  -- colorscheme
  -- 'EdenEast/nightfox.nvim',
  'bluz71/vim-nightfly-guicolors',
  'folke/tokyonight.nvim',
  -- ({ 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*', }),
  "rebelot/kanagawa.nvim",
  { "catppuccin/nvim", as = "catppuccin" },


  -- quick brwose
  'nvim-lua/plenary.nvim',			                -- need
  'nvim-telescope/telescope.nvim',		          -- telescope switch
  'nvim-telescope/telescope-ui-select.nvim',   -- telescope ui
  'kyazdani42/nvim-tree.lua',                  -- Explorer
  'simrat39/symbols-outline.nvim',		          -- symbols outline
  "nvim-telescope/telescope-file-browser.nvim",-- telescope browser
  --  'yorickpeterse/nvim-window',

  -- text opertion
  { 'phaazon/hop.nvim', branch = 'v1'},	-- motion
  'Mephistophiles/surround.nvim',		-- surround
  'windwp/nvim-autopairs',			-- autopairs
  'numToStr/Comment.nvim',			-- comment
  'mizlan/iswap.nvim',				-- swap
  'abecodes/tabout.nvim',			-- tab out bracket
  'booperlv/nvim-gomove', 	 	 	-- move line/block
  'monaqa/dial.nvim', 	 	 	 	-- dial number/time/bool

  -- project manage
  "ahmedkhalf/project.nvim",				-- project switch
  --  { 'michaelb/sniprun', run = 'bash ./install.sh'}	-- snip run for py
  'skywind3000/asyncrun.vim',				-- code run
  'Shatur/neovim-session-manager',			-- session


  -- lsp
  -- Collection of configurations for the built-in LSP client
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer', 			-- lsp server installer
  "ray-x/lsp_signature.nvim", 				-- lsp signnature plugin
  "folke/trouble.nvim",				-- lsp quick-fix replace
  --  'jose-elias-alvarez/null-ls.nvim'

  -- completion
  'hrsh7th/nvim-cmp',	      -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp',		-- LSP source for nvim-cmp
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lua',
  'saadparwaiz1/cmp_luasnip',
  {'tzachar/cmp-tabnine', run='./install.sh'},
  --  'onsails/lspkind-nvim'

  -- terminal integration
  "akinsho/toggleterm.nvim",


  -- snippets
  "L3MON4D3/luaSnip",		-- snippet engine
  "rafamadriz/friendly-snippets",	-- a bunch of snippet to

  -- format
  'sbdchd/neoformat',


  -- enhance visual experience
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  'p00f/nvim-ts-rainbow',			-- rainbow brackets
  "SmiteshP/nvim-gps",         -- get location of cursor

  'RRethy/vim-illuminate',			-- lsp symbol highlight
  'xiyaowong/nvim-transparent',		-- transparent background
  'lukas-reineke/indent-blankline.nvim',	-- indent
  'filipdutescu/renamer.nvim',			-- lsp rename with popmenu
  'tversteeg/registers.nvim', 			-- pop show the context of register
  'kevinhwang91/nvim-bqf',	-- better quick-fix *** ft=qf
  'karb94/neoscroll.nvim',
  'romgrk/barbar.nvim',			-- buffer tab
  "beauwilliams/focus.nvim",			-- window focus
{ 'sunjon/shade.nvim',
    run = function ()
      require'shade'.setup({ overlay_opacity = 50, opacity_step = 1, })
    end
  },                              -- window shade

  -- git
  'lewis6991/gitsigns.nvim',			-- git sign
  'TimUntersberger/neogit',			-- magit integration using lua
  'sindrets/diffview.nvim',			-- diffview

  -- debug
  'mfussenegger/nvim-dap',				-- nvim dap integration
  'rcarriga/nvim-dap-ui',
  -- { 'leoluz/nvim-dap-go', ft='go'}


  -- jupyter ingegration
  --  {
  -- "ahmedkhalf/jupyter-nvim",
  -- run = ":UpdateRemotePlugins",
  -- config = function()
  -- require("jupyter-nvim").setup {
  -- your configuration comes here
  -- or leave it empty to  the default settings
  -- refer to the configuration section below
  -- }
  -- end
  -- }
  --  'hkupty/iron.nvim'

  -- note org
  { "nvim-neorg/neorg", opt=true },

  -- language envirment ** ft=go
{
    'ray-x/go.nvim',
    opt = true,
    run = function()
      require'config.go_env'.setup()
    end
  },

  -- fix
  'antoinemadec/FixCursorHold.nvim',

  -- enhance-ide
{  'max397574/better-escape.nvim', run = function() require("better_escape").setup() end },
{
    'lewis6991/spellsitter.nvim',
    run = function() require('spellsitter').setup{enable = true} end
  },

}


