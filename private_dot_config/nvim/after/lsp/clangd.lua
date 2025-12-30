vim.lsp.inlay_hint.enable(false)
return {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
}
