-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install your plugins here
require('lazy').setup({
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
    "navarasu/onedark.nvim",
    "nvim-telescope/telescope.nvim",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
	    'williamboman/mason.nvim',
	    'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
	    'hrsh7th/nvim-cmp',
	    'hrsh7th/cmp-nvim-lsp',
	    'L3MON4D3/LuaSnip',
	}
    },
})

-- Require indiviual configuration files
require("plugin_configs/nvim_config")
require("plugin_configs/harpoon_config")
require("plugin_configs/telescope_config")
require("plugin_configs/lsp_config")
require("plugin_configs/tree_config")
require("plugin_configs/theme_config")
