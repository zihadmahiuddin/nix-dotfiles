local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  { "lambdalisue/suda.vim" },
  { "simrat39/rust-tools.nvim" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "mbbill/undotree" },
  { "folke/neodev.nvim" },
  { "wakatime/vim-wakatime", lazy = false },

  {
    "theRealCarneiro/hyprland-vim-syntax",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "hypr",
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
  {
    "andweeb/presence.nvim",
    lazy = false,
    config = function()
      require("presence").setup({
        auto_update = true,
        buttons = false,
        workspace_text = "Working on a project",
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({})
    end,
  },

  { import = "custom.configs.crates" },
  { import = "custom.configs.telescope" },
  { import = "custom.configs.toggleterm" },

  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    config = function()
      require("custom.configs.null-ls")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    opts = {
      hide = {
        virtual_text = false,
        signs = false,
        underline = false,
      },
    },
  },
  {
    "folke/noice.nvim",
    dependencies = { "rcarriga/nvim-notify" },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
  },
}

return plugins
