-- Minimal Neovim 0.12 config: built-in vim.pack + vim.lsp, a few plugins.
-- Language servers/formatters are installed via the Brewfile, not Mason.

vim.g.mapleader = " "
vim.g.maplocalleader = " "

----------------------------------------------------------------------
-- Options
----------------------------------------------------------------------
local opt = vim.opt
opt.number = true
opt.relativenumber = false
opt.ruler = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.wrap = false
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ignorecase = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.undofile = true
opt.updatetime = 250
opt.clipboard = "unnamedplus"
opt.confirm = true

----------------------------------------------------------------------
-- Plugins (versions pinned in nvim-pack-lock.json, which is committed)
----------------------------------------------------------------------
vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Update treesitter parsers after nvim-treesitter changes",
  callback = function(event)
    if event.data.spec.name == "nvim-treesitter" and event.data.kind ~= "delete" then
      if not event.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.schedule(function() vim.cmd("TSUpdate") end)
    end
  end,
})

vim.pack.add({
  "https://github.com/folke/snacks.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/mrjones2014/smart-splits.nvim",
  "https://github.com/smart-splits-nvim/backend-tmux",
}, { confirm = false })

----------------------------------------------------------------------
-- Picker + file explorer
----------------------------------------------------------------------
require("snacks").setup({
  picker = {
    enabled = true,
    sources = {
      explorer = { hidden = true },
      files = { hidden = true },
    },
  },
  explorer = { enabled = true },
})

local map = vim.keymap.set

-- Enter clears search highlighting when it's showing; otherwise Enter behaves
-- normally (so quickfix/help jumps still work)
local function clear_search_or_enter()
  return vim.v.hlsearch == 1 and "<Cmd>nohlsearch<CR>" or "<CR>"
end
map("n", "<CR>", clear_search_or_enter, { expr = true, desc = "Clear search highlight" })
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "Toggle file explorer" })
map("n", "<leader>f", function() Snacks.picker.files() end, { desc = "Find files" })
map("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep project" })
map("n", "<leader>b", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>d", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>s", function() Snacks.picker.lsp_symbols() end, { desc = "Document symbols" })
map("n", "<leader>h", function() Snacks.picker.help() end, { desc = "Help" })

----------------------------------------------------------------------
-- Seamless nvim <-> tmux navigation (pairs with tmux.conf)
----------------------------------------------------------------------
local smart_splits = require("smart-splits")
-- The backend marks the pane with @pane-is-vim so tmux passes Ctrl-h/j/k/l through
smart_splits.setup({ mux = { backend = "smart-splits-backend-tmux" } })
map("n", "<C-h>", smart_splits.move_cursor_left, { desc = "Move left" })
map("n", "<C-j>", smart_splits.move_cursor_down, { desc = "Move down" })
map("n", "<C-k>", smart_splits.move_cursor_up, { desc = "Move up" })
map("n", "<C-l>", smart_splits.move_cursor_right, { desc = "Move right" })

----------------------------------------------------------------------
-- Treesitter (main branch: install parsers, enable highlighting per buffer)
----------------------------------------------------------------------
-- stylua: ignore
local treesitter_languages = {
  "bash", "go", "javascript", "json", "lua", "markdown", "markdown_inline",
  "python", "ruby", "rust", "terraform", "toml", "tsx", "typescript", "yaml",
}
require("nvim-treesitter").install(treesitter_languages)

vim.api.nvim_create_autocmd("FileType", {
  desc = "Start treesitter highlighting when a parser is available",
  callback = function(event)
    local started = pcall(vim.treesitter.start, event.buf)
    if started then
      vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

----------------------------------------------------------------------
-- LSP (configs from nvim-lspconfig; servers installed via Brewfile)
----------------------------------------------------------------------
vim.lsp.config("lua_ls", {
  settings = { Lua = { diagnostics = { globals = { "vim", "Snacks" } } } },
})
vim.lsp.enable({ "lua_ls", "gopls", "rust_analyzer", "ts_ls" })

vim.diagnostic.config({ virtual_text = true, severity_sort = true })

-- Built-in 0.12 defaults already map grn (rename), gra (code action),
-- grr (references), gri (implementation), K (hover), [d / ]d (diagnostics).
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

----------------------------------------------------------------------
-- Completion
----------------------------------------------------------------------
require("blink.cmp").setup({
  keymap = { preset = "default" },
  signature = { enabled = true },
})

----------------------------------------------------------------------
-- Formatting (format on save, falling back to the LSP formatter)
----------------------------------------------------------------------
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
  },
  default_format_opts = { lsp_format = "fallback" },
  format_on_save = { timeout_ms = 1000 },
})

----------------------------------------------------------------------
-- Git
----------------------------------------------------------------------
require("gitsigns").setup({})
