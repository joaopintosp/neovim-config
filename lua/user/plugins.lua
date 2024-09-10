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
  -- use "windwp/nvim-autopairs" -- Auto-pairs - completion of () {} "" ...
  use "akinsho/bufferline.nvim" -- Buffer line (displays tabs)
  use "moll/vim-bbye"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  --use "lunarvim/darkplus.nvim"
  --solarized theme
  --  use {
  --    'maxmx03/solarized.nvim',
  --    config = function()
  --      vim.o.background = 'dark'
  --      ---@type solarized
  --      local solarized = require('solarized')
  --      vim.o.termguicolors = true
  --      vim.o.background = 'dark'
  --      solarized.setup({})
  --      vim.cmd.colorscheme 'solarized'
  --    end
  --  }
  --use "sainnhe/gruvbox-material"
  --use "EdenEast/nightfox.nvim"
  use "sainnhe/everforest"

  -- cmp plugins
  -- use "hrsh7th/nvim-cmp" -- The completion plugin
  --  use "hrsh7th/cmp-buffer" -- buffer completions
  --  use "hrsh7th/cmp-path" -- path completions
  --  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  --  use "micangl/cmp-vimtex"
  --  use "hrsh7th/cmp-omni"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  require("luasnip.loaders.from_vscode").lazy_load()
  --use "SirVer/ultisnips"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Nvim-Tree 
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"

  -- Status bar for neovim
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  --Toggle term
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  -- Dressing (improves LSP code actions and stuff)
  use "stevearc/dressing.nvim"

  -- LSP 
  use "williamboman/mason.nvim" -- Mason
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"

  -- Vimtex
  use "lervag/vimtex"
  use { 'neoclide/coc.nvim', branch = 'release' }
  use {"shortcuts/no-neck-pain.nvim", tag = "*" }

  -- WhichKey - Show available keymaps
  use "folke/which-key.nvim"

  -- Indentation Lines
  use "lukas-reineke/indent-blankline.nvim"
    require("ibl").setup()

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
