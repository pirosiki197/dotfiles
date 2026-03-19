return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup({
        options = {
          close_command = function() require("mini.bufremove").delete() end,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
        }
      })
      vim.keymap.set("n", "<A-.>", "<cmd>BufferLineMoveNext<CR>")
      vim.keymap.set("n", "<A-,>", "<cmd>BufferLineMovePrev<CR>")
      vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
        }
      })
    end,
  },
}
