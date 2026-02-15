return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    require("mini.ai").setup()
    require("mini.surround").setup()
    require("mini.bufremove").setup()
    require("mini.move").setup()
    vim.keymap.set("n", "<leader>bd", require("mini.bufremove").delete)
  end
}
