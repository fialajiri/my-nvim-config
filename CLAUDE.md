# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal Neovim configuration using lazy.nvim for plugin management. Targets Neovim 0.10+.

## Architecture

```
init.lua                    -- Entry point: loads config/lazy.lua then config/keymaps.lua
lua/
  config/
    lazy.lua                -- lazy.nvim bootstrap (auto-clones, calls lazy.setup("plugins"))
    keymaps.lua             -- Global keymaps (splits, tabs, escape)
  vim-options.lua           -- Editor settings, diagnostics config, autocommands
  plugins/                  -- Each file returns a lazy.nvim plugin spec (auto-discovered)
```

All plugins are in `lua/plugins/` as individual files. lazy.nvim auto-discovers them — no manual registration needed. Adding a new plugin means creating a new file that returns a spec table.

## Key Design Decisions

- **LSP keymaps** are buffer-local via `LspAttach` autocmd in `lsp-config.lua`, not global
- **typescript-tools.nvim** is used instead of `ts_ls` for TypeScript — keymaps are buffer-local via `on_attach`
- **Formatting** is handled by conform.nvim (not LSP); **linting** by none-ls (eslint); these don't overlap
- **vim.lsp.config / vim.lsp.enable** (new Neovim 0.10 API) is used instead of the old `lspconfig.server.setup()` pattern
- **Capabilities** are set globally via `vim.lsp.config("*", ...)` rather than per-server
- **Leader key** is `<Space>`, keymap groups: `a` (AI/Claude), `s` (search), `t` (toggle), `g` (git), `h` (hunks), `x` (trouble)

## When Editing Plugin Configs

- Each plugin file must return a valid lazy.nvim spec table (or array of tables)
- Use lazy-loading triggers (`event`, `ft`, `cmd`, `keys`) — don't load everything at startup
- Plugin-specific keymaps should be buffer-local where possible (use `on_attach` or `LspAttach`)
- Wrap `require()` calls in functions when used in keymaps to avoid load-order issues
- Indentation: tabs (not spaces) throughout all Lua files
