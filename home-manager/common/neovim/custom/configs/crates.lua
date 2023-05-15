local function crates_function(fn_name)
  -- Helper function to make a wrapper around crates' functions
  -- this allows the usage of this function in lazy.nvim's keys section
  return function()
    require("crates")[fn_name]()
  end
end
--
---@type NvPluginSpec[]
return {
  {
    "saecki/crates.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      opts.null_ls = {
        enabled = true,
        name = "crates.nvim,",
      }

      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
    event = "BufEnter Cargo.toml",
    keys = {
      { "<leader>to", crates_function("show_popup"), desc = "Show popup" },
      { "<leader>tr", crates_function("reload"), desc = "Reload" },
      { "<leader>tv", crates_function("show_versions_popup"), desc = "Show Versions" },
      { "<leader>tf", crates_function("show_features_popup"), desc = "Show Features" },
      { "<leader>td", crates_function("show_dependencies_popup"), desc = "Show Dependencies Popup" },
      { "<leader>tu", crates_function("update_crate"), desc = "Update Crate" },
      { "<leader>ta", crates_function("update_all_crates"), desc = "Update All Crates" },
      {
        "<leader>tU",
        function()
          require("crates").upgrade_crate()
        end,
        desc = "Upgrade Crate",
      },
      {
        "<leader>tA",
        function()
          require("crates").upgrade_all_crates(true)
        end,
        desc = "Upgrade All Crates",
      },
      { "<leader>tH", crates_function("open_homepage"), desc = "Open Homepage" },
      { "<leader>tR", crates_function("open_repository"), desc = "Open Repository" },
      { "<leader>tD", crates_function("open_documentation"), desc = "Open Documentation" },
      { "<leader>tC", crates_function("open_crates_io"), desc = "Open Crate.io" },
    },
  },
}
