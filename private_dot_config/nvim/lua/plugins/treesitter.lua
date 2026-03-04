return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true
    end,
    config = function()
      local keymap = vim.keymap.set;

      local select = function(s)
        require("nvim-treesitter-textobjects.select").select_textobject(s, "textobjects")
      end
      keymap({ "x", "o" }, "af", function() select("@function.outer") end)
      keymap({ "x", "o" }, "if", function() select("@function.inner") end)
      keymap({ "x", "o" }, "ir", function() select("@assignment.rhs") end)
    end,
  },
}
