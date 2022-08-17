local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
  ensure_installed = { "bash", "c_sharp", "css", "dart", "dockerfile", "go", "html", "java",
    "javascript", "json", "lua", "python", "ruby", "rust", "scss", "typescript", "vim", "vue", "yaml" 
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
