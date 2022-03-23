-- import Method:Check_status
require("util.load_fn")
-- Have packer use a popup window
local packer = Check_status("packer")
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = "rounded" }
    end,
  },
}

-- auto load plugin.lua when something chanaged
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- speed up startup
	use 'lewis6991/impatient.nvim' 			-- cache require module

	-- ui
	-- bufferline / nvim-tree / lualine need icon plugin
	use 'kyazdani42/nvim-web-devicons'
	use 'folke/which-key.nvim'			-- space which-key
	-- use 'akinsho/bufferline.nvim'			-- buffer line
	use 'nvim-lualine/lualine.nvim'			-- status line
	use 'goolord/alpha-nvim'			-- Startup screen

	-- colorscheme
	--use 'EdenEast/nightfox.nvim'
	-- use 'bluz71/vim-nightfly-guicolors'
	use 'folke/tokyonight.nvim'
	-- use({ 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*', })
	-- use "rebelot/kanagawa.nvim"
	 use({ "catppuccin/nvim", as = "catppuccin" })
  -- use 'shaunsingh/moonlight.nvim'
  --use 'yashguptaz/calvera-dark.nvim'


	-- quick brwose
	use 'nvim-lua/plenary.nvim'			                -- need
	use 'nvim-telescope/telescope.nvim'		          -- telescope switch
	use 'nvim-telescope/telescope-ui-select.nvim'   -- telescope ui
	use 'kyazdani42/nvim-tree.lua'                  -- Explorer
	use 'simrat39/symbols-outline.nvim'		          -- symbols outline
	use "nvim-telescope/telescope-file-browser.nvim"-- telescope browser
  use 'ten3roberts/window-picker.nvim'            -- window-picker
  use 'rmagatti/goto-preview'                     -- look up definitions & implements

	-- text opertion
	use { 'phaazon/hop.nvim', branch = 'v1'}	      -- motion
	use 'Mephistophiles/surround.nvim'		          -- surround
	use 'windwp/nvim-autopairs'			                -- autopairs
	use 'numToStr/Comment.nvim'			                -- comment
	use 'mizlan/iswap.nvim'				                  -- swap
	use 'abecodes/tabout.nvim'			                -- tab out bracket
	use 'booperlv/nvim-gomove' 	 	 	                -- move line/block
	use 'monaqa/dial.nvim' 	 	 	 	                  -- dial number/time/bool

	-- project manage
	use "ahmedkhalf/project.nvim"				-- project switch
	-- use { 'michaelb/sniprun', run = 'bash ./install.sh'}	-- snip run for py
	use 'skywind3000/asyncrun.vim'				-- code run
	use 'Shatur/neovim-session-manager'			-- session


	-- lsp
	-- Collection of configurations for the built-in LSP client
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer' 			-- lsp server installer
	use "ray-x/lsp_signature.nvim" 				-- lsp signnature plugin
	use "folke/trouble.nvim"				-- lsp quick-fix replace
  use {  'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu', }
  -- use { 'tami5/lspsaga.nvim', branch = 'nvim6.0' }-- maintained fork for lspsaga
	-- use 'jose-elias-alvarez/null-ls.nvim'

	-- completion
	use 'hrsh7th/nvim-cmp'	      -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp'		-- LSP source for nvim-cmp
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lua'
	use 'saadparwaiz1/cmp_luasnip'
	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
	-- use 'onsails/lspkind-nvim'

	-- terminal integration
	use "akinsho/toggleterm.nvim"


	-- snippets
	use "L3MON4D3/luaSnip"		-- snippet engine
	use "rafamadriz/friendly-snippets"	-- a bunch of snippet to use

	-- format
	--use 'sbdchd/neoformat'

	-- enhance visual experience
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'p00f/nvim-ts-rainbow'			-- rainbow brackets
  use "SmiteshP/nvim-gps"         -- get location of cursor

	use 'RRethy/vim-illuminate'			-- lsp symbol highlight
  use 'xiyaowong/nvim-transparent'		-- transparent background
	use 'lukas-reineke/indent-blankline.nvim'	-- indent
	use 'filipdutescu/renamer.nvim'			-- lsp rename with popmenu
	use "tversteeg/registers.nvim" 			-- pop show the context of register
	use 'kevinhwang91/nvim-bqf'					-- better quick-fix
  use 'karb94/neoscroll.nvim'
  use 'romgrk/barbar.nvim'			-- buffer tab
	use "beauwilliams/focus.nvim"			-- window focus
  -- use { 'sunjon/shade.nvim',
  --   config = function ()
  --     require'shade'.setup({ overlay_opacity = 50, opacity_step = 1, })
  --   end
  -- }                              -- window shade

	-- git
	use 'lewis6991/gitsigns.nvim'			-- git sign
	use 'TimUntersberger/neogit'			-- magit integration using lua
	use 'sindrets/diffview.nvim'			-- diffview

	-- debug
	--use 'mfussenegger/nvim-dap'				-- nvim dap integration
	--use 'rcarriga/nvim-dap-ui'
	-- use{ 'leoluz/nvim-dap-go', ft='go'}


	-- jupyter ingegration
	-- use {
	  -- "ahmedkhalf/jupyter-nvim",
	  -- run = ":UpdateRemotePlugins",
	  -- config = function()
	    -- require("jupyter-nvim").setup {
	      -- your configuration comes here
	      -- or leave it empty to use the default settings
	      -- refer to the configuration section below
	    -- }
	  -- end
	-- }
	-- use 'hkupty/iron.nvim'

	-- note org
	use {
    "nvim-neorg/neorg",
    ft='norg',
    after='nvim-treesitter' ,
    config = function()
      require'config.neorg'
    end
  }

  -- language envirment
  use { 'ray-x/go.nvim',
        ft='go' ,
        config = function()
          require'config.go_env'.setup()
        end }

	-- fix
	use 'antoinemadec/FixCursorHold.nvim'

  -- enhance-ide
  use{  'max397574/better-escape.nvim', config = function() require("better_escape").setup() end }
  use {
    'lewis6991/spellsitter.nvim',
    config = function() require('spellsitter').setup{enable = true} end
  }

end)

