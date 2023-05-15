local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
  "bashls",
  "clangd",
  "kotlin_language_server",
  "rust_analyzer",
  "lua_ls",
  "tsserver",
  "tailwindcss",
  "rnix",
}

for _, lsp in ipairs(servers) do
  local server_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- https://github.com/simrat39/rust-tools.nvim/issues/183#issuecomment-1120232092
  if lsp == "rust_analyzer" then
    server_opts.settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        }
      }
    }

    local ok_rt, rust_tools = pcall(require, "rust-tools")
    if not ok_rt then
      print("rust-tools plugin not found, some features (e.g. inlay hints) will not be available.")
    else
      rust_tools.setup({
        server = server_opts,
      })
      -- We don't want to call lspconfig.rust_analyzer.setup() when using
      -- rust-tools. See
      -- * https://github.com/simrat39/rust-tools.nvim/issues/183
      -- * https://github.com/simrat39/rust-tools.nvim/issues/177
      goto continue
    end
  end

  lspconfig[lsp].setup(server_opts)

  ::continue::
end
