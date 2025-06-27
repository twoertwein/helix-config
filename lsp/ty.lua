return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { "ty.toml", "pyproject.toml", ".git" },
  on_attach = function(client, bufnr)
    -- show type annotations
    vim.lsp.inlay_hint.enable(true, {  bufnr })
    -- automatically trigger completions (on every key press - might be slow!)
    local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
    client.server_capabilities.completionProvider.triggerCharacters = chars
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end,
}
