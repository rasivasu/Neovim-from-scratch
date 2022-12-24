local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	use "numToStr/Comment.nvim" -- Easily comment stuff
	use "kyazdani42/nvim-web-devicons"
	use { 
    "kyazdani42/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons"
    }
  }
  use {
    'akinsho/bufferline.nvim', 
    tag = "v3.*", 
    requires = 'nvim-tree/nvim-web-devicons'
  }
	use "moll/vim-bbye"
	use "nvim-lualine/lualine.nvim"
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
	use "ahmedkhalf/project.nvim"
	use "lewis6991/impatient.nvim"
	use "lukas-reineke/indent-blankline.nvim"
	use "goolord/alpha-nvim"
	use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
	use "folke/which-key.nvim"
	use "JoosepAlviste/nvim-ts-context-commentstring"

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use "lunarvim/darkplus.nvim"
	use "sainnhe/everforest"
	use "folke/tokyonight.nvim"
	use "morhetz/gruvbox"
	use "NLKNguyen/papercolor-theme"


	-- Cmp 
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip" -- snippet completions

	-- Snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
	use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"} -- simple to use language server installer
	use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
	use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
	use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }

	-- Telescope
	use "nvim-telescope/telescope.nvim"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"	
	}

	-- Git
	use "lewis6991/gitsigns.nvim"

	-- Markdown
	use "iamcco/markdown-preview.nvim"
	use "masukomi/vim-markdown-folding"

	-- Move around
	--use "justinmk/vim-sneak"
	--use "unblevable/quick-scope"
	use "ggandor/lightspeed.nvim"


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
