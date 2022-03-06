local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
end
--
-- Have packer use a popup window
local util = require("util")
local packer = util.check_status("packer")
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

	-- ui
	-- bufferline / nvim-tree / lualine need icon plugin
	use 'kyazdani42/nvim-web-devicons'
	use 'folke/which-key.nvim'			-- space which-key
	use 'akinsho/bufferline.nvim'			-- buffer line
	use 'nvim-lualine/lualine.nvim'			-- status line
	use 'goolord/alpha-nvim'			-- Startup screen

	-- colorscheme
	--use 'EdenEast/nightfox.nvim'
	--use 'bluz71/vim-nightfly-guicolors'
	use 'folke/tokyonight.nvim'

	-- quick brwose
	use 'nvim-lua/plenary.nvim'			-- need
	use 'nvim-telescope/telescope.nvim'		-- telescope switch
	use 'kyazdani42/nvim-tree.lua'			-- Explorer
	use 'simrat39/symbols-outline.nvim'		-- symbols outline
	use "nvim-telescope/telescope-file-browser.nvim"-- telescope browser

	-- text opertion
	use { 'phaazon/hop.nvim', branch = 'v1'}	-- motion
	use 'Mephistophiles/surround.nvim'		-- surround
	use 'windwp/nvim-autopairs'			-- autopairs
	use 'numToStr/Comment.nvim'			-- comment
	use 'mizlan/iswap.nvim'				-- swap

	-- project manage
	use "ahmedkhalf/project.nvim"			-- project switch
	use 'pianocomposer321/yabs.nvim'		-- code run

	-- lsp
	-- Collection of configurations for the built-in LSP client
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer' 			-- lsp server installer
	use "ray-x/lsp_signature.nvim" 				-- lsp signnature plugin
	use "folke/trouble.nvim"				-- lsp quick-fix replace

	-- completion
	use 'hrsh7th/nvim-cmp'		-- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp'		-- LSP source for nvim-cmp
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lua'
	use 'saadparwaiz1/cmp_luasnip'



	-- snippets
	use "L3MON4D3/luaSnip"		-- snippet engine
	use "rafamadriz/friendly-snippets"	-- a bunch of snippet to use

	-- enhance visual experience
	use 'karb94/neoscroll.nvim'
	use {  'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'RRethy/vim-illuminate'			-- lsp symbol highlight
	use 'lukas-reineke/indent-blankline.nvim'	-- indent
	use 'xiyaowong/nvim-transparent'		-- transparent background
	use 'filipdutescu/renamer.nvim'			-- lsp rename with popmenu

	-- git
	use 'lewis6991/gitsigns.nvim'			-- git sign
	use 'TimUntersberger/neogit'			-- magit integration using lua
	use 'sindrets/diffview.nvim'			-- diffview

	-- debug
	use 'mfussenegger/nvim-dap'				-- nvim dap integration
	use 'rcarriga/nvim-dap-ui'

	if packer_bootstrap then
	  packer.sync()
	end
end)

