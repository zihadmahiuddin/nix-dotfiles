local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Web
  b.formatting.prettier,

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
