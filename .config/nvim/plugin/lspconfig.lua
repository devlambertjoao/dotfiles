local status, nvim_lsp =  pcall(require, "lspconfig")

if (not status) then return end

local protocol = require('vim.lsp.protocol')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local cmp = require'cmp'
local root_pattern = nvim_lsp.util.root_pattern

local user_home = '/home/lambert'
-- local user_home = '/Users/lambert/'
local java_home = user_home .. 'Programs/jdk-17.0.4/'
-- local java_home = user_home .. 'Programs/jdk-17.jdk/Contents/Home'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  
  local buf_opts = { noremap=true, silent=true, buffer=bufnr }
  local diag_opts = { noremap=true, silent=true }
  local silent_opts = { silent=true }
  
  -- Code Navigation
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buf_opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf_opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf_opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, buf_opts)
  vim.keymap.set('n', 'rn', vim.lsp.buf.rename, buf_opts)
  vim.keymap.set('n', 'C', vim.lsp.buf.code_action, buf_opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf_opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, buf_opts)
  
  -- Code Formating
  vim.keymap.set('n', 'gf', vim.lsp.buf.formatting, buf_opts)
  
  -- Diagnostics
  vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, diag_opts)
  vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, diag_opts)
  vim.keymap.set('n', '<leader>do', vim.diagnostic.goto_next, diag_opts)
  vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', diag_opts)
end

-- Diagnostic Setup
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  severity_sort = true,
  float = {
    source = "always",
  },
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

---- Servers for LSP
-- Check for install new servers:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Eslint
nvim_lsp.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
    },
    codeActionOnSave = {
      enable = true,
      mode = "all"
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    packageManager = "npm",
    quiet = false,
    rulesCustomizations = {},
    run = "onSave",
    useESLintClass = false,
    validate = "on",
    workingDirectory = {
      mode = "location"
    }
  }
}

-- Typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    usePlaceholders = true
  },
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = function() return vim.loop.cwd() end
}

-- HTML
nvim_lsp.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
                  css = true,
                  javascript = true
          }
  },
  settings = {},
}

-- CSS, SCSS, LESS
nvim_lsp.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Angular
nvim_lsp.angularls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = root_pattern("angular.json"),
}

-- JSON 
nvim_lsp.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Java
local jdtls_version = '1.6.400.v20210924-0641'
local jdtls_jar = user_home .. 'Programs/jdtls/plugins/org.eclipse.equinox.launcher_' .. jdtls_version .. '.jar';
local jdtls_configuration = user_home .. 'Programs/jdtls/config_osx' -- config_linux 

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = user_home .. 'Programs/workspace/' .. project_name

local lombok = user_home .. 'Programs/lombok.jar'

nvim_lsp.jdtls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = root_pattern(".git", "pom.xml"),
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-Xmx2G',
    '-javaagent:' .. lombok,
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jdtls_jar,
    '-configuration', jdtls_configuration ,
    '-data', workspace_dir,
  },
  settings = {
    java = {
      completion = {},
      configuration = {
        checkProjectSettingsExclusions = false,
        runtimes = {
          name = 'JavaSE-17',
          path = java_home
        }
      },
      format = {
        settings = {
          profile = "GoogleStyle",
          url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
        },
      },
      implementationsCodeLens = {
        enabled = false,
      },
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      showBuildStatusOnStart = {
        enabled = true,
      },
      signatureHelp = {
        enabled = true,
      },
    }
  }
}

-- .NET, C#
local omnisharp_dll = user_home .. 'Programs/omnisharp-net6.0/OmniSharp.dll' 

nvim_lsp.omnisharp.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    'dotnet',
    omnisharp_dll,
    '--languageserver',
    '--hostPID',
    tostring(vim.fn.getpid())
  },
  enable_editorconfig_support = true,
  enable_ms_build_load_projects_on_demand = true,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = false,
  sdk_include_prereleases = true,
  analyze_open_documents_only = false,
}

-- Ruby, Ruby on Rails
nvim_lsp.solargraph.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

