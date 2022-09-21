local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

local keymap = vim.keymap

nvim_tree.setup({
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
    icons = {
      git_placement = "after",
    },
  },
  filters = {
    dotfiles = false,
  },
})

keymap.set('n', '<C-b>', ':NvimTreeFindFileToggle<CR>')
