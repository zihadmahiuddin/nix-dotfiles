local function fuzzy_search_current_buf()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  local telescope_themes = require("telescope.themes")
  local dropdown = telescope_themes.get_dropdown({
    winblend = 10,
    previewer = false,
  })
  require("telescope.builtin").current_buffer_fuzzy_find(dropdown)
end

local function telescope_builtin(builtin)
  -- Helper function to make a wrapper around telescope builtin
  -- this allows the usage of this function in lazy.nvim's keys section
  return function()
    require("telescope.builtin")[builtin]()
  end
end
--
---@type NvPluginSpec[]
return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          -- Enable telescope-ui-select extension
          pcall(require("telescope").load_extension, "ui-select")
        end,
      },
    },
    lazy = false,
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
    },
    keys = {
      -- See `:help telescope.builtin`
      { "<leader>?", telescope_builtin("oldfiles"), desc = "[?] Find recently opened files" },
      { "<leader><space>", telescope_builtin("buffers"), desc = "[ ] Find existing buffers" },
      { "<leader>sf", telescope_builtin("find_files"), desc = "[S]earch [F]iles" },
      { "<leader>sh", telescope_builtin("help_tags"), desc = "[S]earch [H]elp" },
      { "<leader>sw", telescope_builtin("grep_string"), desc = "[S]earch current [W]ord" },
      { "<leader>sg", telescope_builtin("live_grep"), desc = "[S]earch by [G]rep" },
      { "<leader>sd", telescope_builtin("diagnostics"), desc = "[S]earch [D]iagnostics" },
      { "<leader>sk", telescope_builtin("keymaps"), desc = "[S]earch [K]eymaps" },

      { "<leader>/", fuzzy_search_current_buf, desc = "[/] Fuzzily search in current buffer" },
    },
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
    config = function()
      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
}
