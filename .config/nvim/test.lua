servers = {
  "asd",
  "abc",
}

for _, server in pairs(servers) do
  nvim_lsp.server.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

