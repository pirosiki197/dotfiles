vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.scrolloff = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.wrap = false

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.history = 1000
vim.opt.undolevels = 1000
vim.opt.undofile = true

vim.o.wildmenu = true
vim.o.updatetime = 300

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })

vim.keymap.set("n", "<leader>/", "<cmd>noh<CR>", { desc = "Clear search highlights" })

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
