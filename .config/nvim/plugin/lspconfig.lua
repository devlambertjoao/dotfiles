local status, nvim_lsp = pcall(require, "lspconfig")

if (not status) then return end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local root_pattern = nvim_lsp.util.root_pattern

local user_home = os.getenv("HOME")

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local diag_opts = { noremap = true, silent = true }
  local buf_opts = { noremap = true, silent = true, buffer = bufnr }

  -- Code Navigation
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buf_opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf_opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf_opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, buf_opts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, buf_opts)
  vim.keymap.set('n', '<C-c>', vim.lsp.buf.code_action, buf_opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf_opts)

  -- Diagnostics
  vim.keymap.set('n', '<leader>dd', vim.diagnostic.goto_next, diag_opts)

  -- Formating
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", ";f", "<cmd>lua vim.lsp.buf.formatting()<CR>", diag_opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", ";f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", diag_opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
	      autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})
	      ]], false)
  end
end

-- Diagnostic Setup
vim.diagnostic.config({
  virtual_text = {
    -- prefix = '●',
    prefix = '*',
  },
  -- virtual_text = false,
  severity_sort = true,
  update_in_insert = true,
  float = {
    source = "always",
  },
})

-- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

------ LSP Servers
---- Custom Servers
-- Angular
local languageServerPath = user_home .. "/Programs/angularls"
local cmd = { "node", languageServerPath .. "/node_modules/@angular/language-server/index.js", "--stdio",
  "--tsProbeLocations",
  languageServerPath, "--ngProbeLocations", languageServerPath }

local angularls_options = {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "typescript", "html" },
  root_dir = root_pattern("angular.json"),
  cmd = cmd,
  on_new_config = function(new_config)
    new_config.cmd = cmd
  end,
}

local sumneko_lua_options = {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  }
}

---- Automatic Servers Installations
local mason_status, mason = pcall(require, "mason")
if (not mason_status) then return end

mason.setup({})

local mason_lsp_config_status, mason_lsp_config = pcall(require, "mason-lspconfig")
if (not mason_lsp_config_status) then return end

local lsp_server_list = {
  angularls = angularls_options,
  clangd = {}, -- C and C++
  omnisharp = {}, -- C#
  cssls = {}, -- CSS, SCSS, LESS
  eslint = {}, -- Eslint
  jsonls = {}, -- JSON
  jdtls = {}, -- Java
  tsserver = {}, -- Typescript
  sumneko_lua = sumneko_lua_options, -- Lua
  pyright = {}, -- Python
  solargraph = {}, -- Ruby
  rust_analyzer = {}, -- Rust
  sqlls = {}, -- SQL
  vuels = {}, -- VueJs
}

mason_lsp_config.setup({
  ensure_installed = lsp_server_list,
  automatic_installation = true
})

for server_name, server_options in pairs(lsp_server_list) do
  local default_server_options = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  default_server_options = vim.tbl_deep_extend("force", server_options, default_server_options)

  nvim_lsp[server_name].setup(default_server_options)
end
