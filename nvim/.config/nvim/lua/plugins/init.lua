local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  cmd "packadd packer.nvim"
  print "\n\n Successfully installed Packer! \n\n Now run `:PackerSync` to install the plugins"
end
cmd "autocmd BufWritePost plugins.lua PackerCompile"

-----------------------------

local packer = require "packer"
local use = packer.use

return packer.startup(function()
  -- Packer can manage itself
  use { "wbthomason/packer.nvim" }

  -- Gruvbox
  use {
    "npxbr/gruvbox.nvim",
    requires = {
      "rktjmp/lush.nvim",
    },
  }

  -- Galaxy Line
  use {
    "glepnir/galaxyline.nvim",
    branch = "main",
    config = function()
      require "plugins.configs.statusline"
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "kabouzeid/nvim-lspinstall",
      "onsails/lspkind-nvim",
      "glepnir/lspsaga.nvim",
    },
    config = function()
      require "plugins.configs.lsp"
    end,
  }

  -- Diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }

  -- Completion
  use { "nvim-lua/completion-nvim" }

  -- Cmp
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require "plugins.configs.cmp"
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  }

  use {
    "nvim-treesitter/playground",
    after = "nvim-treesitter",
  }

  use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
  }

  -- Nvim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- Plenary
  use { "nvim-lua/plenary.nvim" }

  -- Popup
  use { "nvim-lua/popup.nvim" }

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }

  -- Indent Blankline
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.configs.others").indentline()
    end,
  }

  -- Comments
  use { "b3nj5m1n/kommentary" }

  -- Vim Surround
  use { "tpope/vim-surround" }

  -- Neorg / Org Mode
  use {
    "nvim-neorg/neorg",
    config = function()
      require("plugins.configs.others").neorg()
    end,
    requires = "nvim-lua/plenary.nvim",
  }

  -- Vim motions
  use {
    "phaazon/hop.nvim",
    as = "hop",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  }

  ---- EXTRAS ----

  -- Terminal Wrapper
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins.configs.others").tty()
    end,
  }

  -- Glow (Markdown Preview)
  use {
    "npxbr/glow.nvim",
    run = "GlowInstall",
  }

  -- Toggle wrap like in VS Code
  use {
    "derektata/wrap-toggle.nvim",
    config = function()
      require("wrap-toggle").setup()
    end,
  }

  -- Table Mode
  use { "dhruvasagar/vim-table-mode" }

  -- Firefox Integration
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }

end)
