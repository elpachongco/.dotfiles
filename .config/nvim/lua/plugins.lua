-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'tpope/vim-sleuth'}
  use { "ellisonleao/gruvbox.nvim", priority = 1000 }
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use { 'img-paste-devs/img-paste.vim'}

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"

  use {
      "lewis6991/hover.nvim",
      config = function()
          require("hover").setup {
              init = function()
                  -- Require providers
                  require("hover.providers.lsp")
                  -- require('hover.providers.gh')
                  -- require('hover.providers.gh_user')
                  -- require('hover.providers.jira')
                  -- require('hover.providers.man')
                  -- require('hover.providers.dictionary')
              end,
              preview_opts = {
                  border = nil
              },
              -- Whether the contents of a currently open hover window should be moved
              -- to a :h preview-window when pressing the hover keymap.
              preview_window = false,
              title = true
          }

          -- Setup keymaps
          -- vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
          -- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
      end
  }

    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
      use { 'nvim-treesitter/nvim-treesitter',
        run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
        end
      }

  use("nvim-treesitter/nvim-treesitter-context");

  use {
    'hrsh7th/nvim-cmp',
    config = function ()
      require'cmp'.setup {
      snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body)
        end
      },

      sources = {
        { name = 'luasnip' },
        -- more sources
      },
    }
    end
  }
  use { 'saadparwaiz1/cmp_luasnip' }

  use {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require"telescope".load_extension("frecency")
  end,
  requires = {"kkharji/sqlite.lua"}
  }

  use { 'nvim-treesitter/nvim-treesitter-refactor' }
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
end)
