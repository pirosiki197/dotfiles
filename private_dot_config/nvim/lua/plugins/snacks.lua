return {
  "folke/snacks.nvim",
  version = "*",
  priority = 1000,
  lazy = false,
  opts = {
    explorer = {
      replace_netrw = true,
      enabled = true,
    },
    indent = {},
    picker = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<c-n>",      function() Snacks.explorer.open() end,              desc = "Explorer" },
    { "<leader>gg", function() Snacks.lazygit() end,                    desc = "LazyGit" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,     desc = "Next Reference",     mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end,    desc = "Prev Reference",     mode = { "n", "t" } },
    { "<c-_>",      function() Snacks.terminal() end,                   desc = "Toggle Terminal",    mode = { "n", "t" } },
    -- find
    { "<c-p>",      function() Snacks.picker.files() end,               desc = "Find Files" },
    -- grep
    { "<leader>lg", function() Snacks.picker.grep() end,                desc = "Grep" },
    -- search
    { "<leader>sk", function() Snacks.picker.keymaps() end,             desc = "Keymaps" },
    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,     desc = "Goto Definition" },
    { "grr",        function() Snacks.picker.lsp_references() end,      nowait = true,               desc = "References" },
    { "gI",         function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gci",        function() Snacks.picker.lsp_incoming_calls() end,  desc = "Calls Incoming" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,         desc = "LSP Symbols" },
  }
}
