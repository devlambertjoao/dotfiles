call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind.nvim'

" Theme
Plug 'folke/tokyonight.nvim'

" Dev Icons
Plug 'kyazdani42/nvim-web-devicons'

" Lualine
Plug 'nvim-lualine/lualine.nvim'

" Nvim Gps (Breadcrumbs for Lualine)
Plug 'SmiteshP/nvim-gps'

" Bufferline
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Nerdtree
Plug 'kyazdani42/nvim-tree.lua'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'

" Identline
Plug 'lukas-reineke/indent-blankline.nvim'

" Scrollbar
Plug 'petertriho/nvim-scrollbar'

" Hlslens Better Search
Plug 'kevinhwang91/nvim-hlslens'

" Comments
Plug 'tomtom/tcomment_vim'

" Auto pairs
Plug 'windwp/nvim-autopairs'

call plug#end()

" Editor Shortcuts
" New window on side -> nv
" New window on bottom -> nw
" Navigante in windows using Ctrl + HJKL

let mapleader = " "
nnoremap <leader>nv :wincmd v<CR>
nnoremap <leader>nw :wincmd S<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <Esc> :noh<CR>

" Editor Settings
set encoding=utf-8
set fileencodings=utf-8
set hidden
set nobackup
set nowritebackup
set noswapfile
set cmdheight=1
set updatetime=25
set shortmess+=c
set tabstop=2
set shiftwidth=2
set autoindent
set relativenumber
set nu
set nowrap
set pumheight=15
set ruler
filetype plugin on
syntax enable
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set clipboard=unnamedplus
set colorcolumn=100
set noshowmode
set background=dark
set cursorline
set termguicolors
set completeopt=menuone,noinsert,noselect
set signcolumn=yes:1

" Theme
set background=dark
colorscheme tokyonight

" Nvim Tree
nnoremap <silent> <C-b> :NvimTreeFindFileToggle<CR>

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>

" Bufferline
nnoremap <silent><C-o> :BufferLineCyclePrev<CR>
nnoremap <silent><C-]> :BufferLineCycleNext<CR>

nnoremap <silent>[b :BufferLineMovePrev<CR>
nnoremap <silent>]b :BufferLineMoveNext<CR>

nnoremap <silent><leader>1 <cmd>lua require("bufferline").go_to_buffer(1, true)<cr>
nnoremap <silent><leader>2 <cmd>lua require("bufferline").go_to_buffer(2, true)<cr>
nnoremap <silent><leader>3 <cmd>lua require("bufferline").go_to_buffer(3, true)<cr>
nnoremap <silent><leader>4 <cmd>lua require("bufferline").go_to_buffer(4, true)<cr>
nnoremap <silent><leader>5 <cmd>lua require("bufferline").go_to_buffer(5, true)<cr>
nnoremap <silent><leader>6 <cmd>lua require("bufferline").go_to_buffer(6, true)<cr>
nnoremap <silent><leader>7 <cmd>lua require("bufferline").go_to_buffer(7, true)<cr>
nnoremap <silent><leader>8 <cmd>lua require("bufferline").go_to_buffer(8, true)<cr>
nnoremap <silent><leader>9 <cmd>lua require("bufferline").go_to_buffer(9, true)<cr>

" Lsp Format on Save Eslint
autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll

lua << EOF

-- LspInstaller
        require('nvim-lsp-installer').setup {
                automatic_installation = false
        }

        -- Treesitter
        require'nvim-treesitter.configs'.setup {
                ensure_installed = { "bash", "c_sharp", "css", "dart", "dockerfile", "go", "html", "java",
                        "javascript", "json", "lua", "python", "ruby", "rust", "scss", "typescript", "vim", "vue",
                        "yaml"
                },
          highlight = {
            enable = true,
          },
                indent = {
                        enable = true
                }
        }

        -- Lsp
        local nvim_lsp = require('lspconfig')
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
        -- virtual_text = false,
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

        -- Cmp Settings
        cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-f>'] = cmp.mapping.scroll_docs(-4),
      ['<C-b>'] = cmp.mapping.scroll_docs(4),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
              feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
              cmp.complete()
            else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
          end, { "i", "s" }),
          ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<Plug>(vsnip-jump-prev)", "")
            end
          end, { "i", "s" }),
        }),
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "
            kind.menu = "    (" .. strings[2] .. ")"

            return kind
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
        }, {
          { name = 'buffer' },
        })
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


        -- Servers for LSP
        -- Check for install new servers:
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

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

        nvim_lsp.tsserver.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                init_options = {
                        usePlaceholders = true
                },
                filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
                root_dir = function() return vim.loop.cwd() end
        }

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

        nvim_lsp.cssls.setup {
          capabilities = capabilities,
                on_attach = on_attach,
        }

        nvim_lsp.angularls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                root_dir = root_pattern("angular.json"),
        }

        nvim_lsp.jsonls.setup {
                capabilities = capabilities,
        }

        local jdtls_version = '1.6.400.v20210924-0641'
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
        local workspace_dir = user_home .. 'Programs/workspace/' .. project_name

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
                '-javaagent:' .. user_home .. '.config/nvim/lombok.jar',
                -- '-Xbootclasspath/a:' .. user_home .. '.config/nvim/lombok.jar',
                        '--add-modules=ALL-SYSTEM',
                        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                '-jar', user_home .. 'Programs/jdtls/plugins/org.eclipse.equinox.launcher_' .. jdtls_version .. '.jar',
                '-configuration', user_home .. 'Programs/jdtls/config_linux',
                -- '-configuration', user_home .. 'Programs/jdtls/config_osx',
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

        nvim_lsp.omnisharp.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = {
                        'dotnet',
                        user_home .. 'Programs/omnisharp-net6.0/OmniSharp.dll',
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

        nvim_lsp.solargraph.setup {
                capabilities = capabilities,
                on_attach = on_attach,
        }

        -- Nvim Gps
        require("nvim-gps").setup { }
        local gps = require("nvim-gps")

        -- Lualine
        require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'tokyonight',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = false,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
                        lualine_c = {{ 'filename', file_status = false, path = 0 }, { gps.get_location, cond = gps.is_available }},
          lualine_x = {'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
        }

        -- Bufferline
        require('bufferline').setup {
                options = {
                        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "ordinal",
                        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
                        for e, n in pairs(diagnostics_dict) do
                          local sym = e == "error" and " "
                            or (e == "warning" and " " or "" )
                          s = s .. n .. sym
                        end
                        return s
        end,
                }
        }

        -- Autopairs
        require("nvim-autopairs").setup {}

        -- Nvim Tree
        require("nvim-tree").setup({
          sort_by = "case_sensitive",
          view = {
            adaptive_size = true,
            mappings = {
              list = {
                { key = "u", action = "dir_up" },
              },
            },
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = true,
          },
        })

        -- Identline
        require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = true,
        }

        -- Scrollbar
        local colors = require("tokyonight.colors").setup {}

        require('scrollbar').setup {
    handle = {
      color = colors.bg_highlight,
    },
    marks = {
      Search = { color = colors.orange },
      Error = { color = colors.error },
      Warn = { color = colors.warning },
      Info = { color = colors.info },
      Hint = { color = colors.hint },
      Misc = { color = colors.purple },
    }
        }

        -- Nvim Hlslens
        require('hlslens').setup {
    override_lens = function(render, posList, nearest, idx, relIdx)
      local sfw = vim.v.searchforward == 1
      local indicator, text, chunks
      local absRelIdx = math.abs(relIdx)
      if absRelIdx > 1 then
          indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and '▲' or '▼')
      elseif absRelIdx == 1 then
          indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
      else
          indicator = ''
      end

      local lnum, col = unpack(posList[idx])
      if nearest then
          local cnt = #posList
          if indicator ~= '' then
              text = ('[%s %d/%d]'):format(indicator, idx, cnt)
          else
              text = ('[%d/%d]'):format(idx, cnt)
          end
          chunks = {{' ', 'Ignore'}, {text, 'HlSearchLensNear'}}
      else
          text = ('[%s %d]'):format(indicator, idx)
          chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
      end
      render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
    end
        }

        local hlslens_opts = { noremap = true, silent = true }

        vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    hlslens_opts
        )
        vim.api.nvim_set_keymap('n', 'P',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    hlslens_opts
        )

        -- Hlslens into Scrollbar
        require("scrollbar.handlers.search").setup {}

        -- Tokyonight
        vim.g.tokyonight_style = "night"
        vim.g.tokyonight_italic_functions = true
        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
        vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
        vim.cmd[[colorscheme tokyonight]]

        -- Gitsings
        require('gitsigns').setup {
          current_line_blame = true
        }

        -- Diffview
        require("diffview").setup { }
        vim.keymap.set('n', '<leader>gs', '<cmd>DiffviewOpen<CR>', buf_opts)
        vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<CR>', buf_opts)
        vim.keymap.set('n', '<leader>gl', '<cmd>DiffviewFileHistory<CR>', buf_opts)
        vim.keymap.set('n', '<leader>gl.', '<cmd>DiffviewFileHistory %<CR>', buf_opts)
EOF
