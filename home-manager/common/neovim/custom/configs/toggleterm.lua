local lazygit = nil

local function _lazygit_toggle()
  if lazygit ~= nil then
    lazygit:toggle()
  end
end

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      insert_mappings = true,
      terminal_mappings = true,
    })
    local Terminal = require("toggleterm.terminal").Terminal
    lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
    })
  end,
  keys = {
    { "<leader>lg", _lazygit_toggle, desc = "[/] Fuzzily search in current buffer" },
  },
}
