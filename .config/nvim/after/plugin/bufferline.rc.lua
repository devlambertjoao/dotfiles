local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local keymap = vim.keymap

bufferline.setup({
  options = {
    mode = "buffers",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        -- local sym = e == "error" and " "
        --    or (e == "warning" and " " or "")
        local sym = e == "error" and "e"
            or (e == "warning" and "w")
            or (e == "hint" and "h")
            or (e == "info" and "i")
        s = s .. n .. sym
      end

      return s
    end,
  }
})

keymap.set('n', '<C-left>', ':BufferLineCyclePrev<CR>')
keymap.set('n', '<C-right>', ':BufferLineCycleNext<CR>')

keymap.set('n', '<leader>1', '<cmd>lua require("bufferline").go_to_buffer(1, true)<CR>')
keymap.set('n', '<leader>2', '<cmd>lua require("bufferline").go_to_buffer(2, true)<CR>')
keymap.set('n', '<leader>3', '<cmd>lua require("bufferline").go_to_buffer(3, true)<CR>')
keymap.set('n', '<leader>4', '<cmd>lua require("bufferline").go_to_buffer(4, true)<CR>')
keymap.set('n', '<leader>5', '<cmd>lua require("bufferline").go_to_buffer(5, true)<CR>')
keymap.set('n', '<leader>6', '<cmd>lua require("bufferline").go_to_buffer(6, true)<CR>')
keymap.set('n', '<leader>7', '<cmd>lua require("bufferline").go_to_buffer(7, true)<CR>')
keymap.set('n', '<leader>8', '<cmd>lua require("bufferline").go_to_buffer(8, true)<CR>')
keymap.set('n', '<leader>9', '<cmd>lua require("bufferline").go_to_buffer(9, true)<CR>')
