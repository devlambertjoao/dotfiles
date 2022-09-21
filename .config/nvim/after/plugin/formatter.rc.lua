local status, formatter = pcall(require, "formatter")
if not status then
	return
end


local buf_opts = { noremap = true, silent = true }

vim.keymap.set("n", ";f", "<cmd>FormatWrite<CR>", buf_opts)

vim.api.nvim_exec(
	[[
  augroup FormatAutogroup
    autocmd!
    autocmd User FormatterPre lua print "This will print before formatting"
    autocmd User FormatterPost lua print "This will print after formatting"
  augroup END
]],
	false
)

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua
		},
		javascript = {
			require("formatter.filetypes.javascript").prettierd,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettierd,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettierd,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettierd,
		},
    html = {
			require("formatter.filetypes.html").prettierd,
    },
    css = {
      require("formatter.filetypes.css").prettierd,
    },
    scss = {
      require("formatter.filetypes.css").prettierd,
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat
    },
    python = {
      require("formatter.filetypes.python").docformatter
    },
    ruby = {
      require("formatter.filetypes.ruby").rubocop
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt
    },
		-- ["*"] = {
		-- 	require("formatter.filetypes.any").remove_trailing_whitespace,
		-- },
	},
})

