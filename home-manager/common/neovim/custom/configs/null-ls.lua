local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Web
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettierd.with({
    filetypes = {
      "html",
      "markdown",
      "css",
      "yaml",
    },
  }),

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

  -- Rust
  b.formatting.rustfmt,

  -- TOML
  b.formatting.taplo,

  -- Kotlin
  b.diagnostics.ktlint,
  b.formatting.ktlint,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
