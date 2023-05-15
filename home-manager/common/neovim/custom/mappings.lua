---@type MappingsTable
local M = {}

M.general = {
  i = {
    -- ESC alias for insert mode
    ["jk"] = { "<ESC>" },
    ["jj"] = { "<ESC>" },
  },
  n = {
    ["<leader>k"] = { "<cmd> Telescope keymaps<CR>", "Open keymaps in Telescope" },
  },
  v = {
    -- Based on https://github.com/amix/vimrc#visual-mode-mappings
    ["*"] = { ":call VisualSelection('f')<CR>", "Search forward for selection" },
    ["#"] = { ":call VisualSelection('b')<CR>", "Search backward for selection" },

    ["<leader>r"] = { ":call VisualSelection('replace')<CR>", "Find and replace selection" },

    ["$1"] = { "<esc>`>a)<esc>`<i(<esc>", "Surround selection with ()" },
    ["$2"] = { "<esc>`>a}<esc>`<i{<esc>", "Surround selection with {}" },
    ["$3"] = { "<esc>`>a]<esc>`<i[<esc>", "Surround selection with []" },
    ["$$"] = { '<esc>`>a"<esc>`<i"<esc>', 'Surround selection with "' },
    ["$q"] = { "<esc>`>a'<esc>`<i'<esc>", "Surround selection with '" },
    ["$e"] = { "<esc>`>a`<esc>`<i`<esc>", "Surround selection with `" },
  },
}

-- https://github.com/amix/vimrc/blob/fd050b6d0356cdd5883dedd1995c7dbf68842adb/vimrcs/basic.vim#L277
M.alt_to_move_lines = {
  n = {
    ["<M-j>"] = { "mz:m+<CR>`z", "Move line down" },
    ["<M-k>"] = { "mz:m-2<CR>`z", "Move line up" },
  },
  v = {
    ["<M-j>"] = { ":m'>+<CR>`<my`>mzgv`yo`z", "Move line down" },
    ["<M-k>"] = { ":m'<-2<CR>`>my`<mzgv`yo`z", "Move line up" },
  },
}

-- " https://www.reddit.com/r/neovim/comments/3fricd/comment/ctrru3b/?utm_source=share&utm_medium=web2x&context=3
M.clipboard_yank = {
  n = {
    -- Copy to clipboard
    ["<leader>y"] = { '"+y', "Yank to clipboard" },
    ["<leader>Y"] = { '"+yg_', "Yank to clipboard..." },

    -- Paste from clipboard
    ["<leader>p"] = { '"+p', "Paste from clipboard" },
    ["<leader>P"] = { '"+P', "Paste from clipboard" },
  },
  v = {
    -- Copy to clipboard
    ["<leader>y"] = { '"+y', "Yank to clipboard" },

    -- Paste from clipboard
    ["<leader>p"] = { '"+p', "Paste from clipboard" },
    ["<leader>P"] = { '"+P', "Paste from clipboard" },
  },
}

M.undotree = {
  n = {
    ["<leader>u"] = { "<cmd>:UndotreeToggle<CR>", "Toggle Undotree" },
  },
}

return M
