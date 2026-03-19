return {
  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        vim.keymap.set('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, { buffer = bufnr })

        vim.keymap.set('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, { buffer = bufnr })

        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr })
        vim.keymap.set("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { noremap = true })
      end
    },
  },
}
