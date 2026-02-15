vim.lsp.enable({
  "clangd",
  "gopls",
  "hls",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "yamlls",
  "zls",
})

Snacks.keymap.set("n", "<leader>k",
  function() vim.lsp.buf.hover({ border = "single" }) end,
  { lsp = { method = "textDocument/hover" }, desc = "Show hover documentation" })

Snacks.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
  lsp = { method = "textDocument/codeAction" },
  desc = "Code Action",
})

local lsp_group = vim.api.nvim_create_augroup("my.lsp", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local buf = args.buf

    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = buf })
    end

    if client:supports_method("textDocument/documentHighlight") then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = lsp_group,
        buffer = buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        group = lsp_group,
        buffer = buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
