local status, neoscroll = pcall(require, "neoscroll")
if (not status) then return end

neoscroll.setup {
  easing_function = "quadratic"
}

require('neoscroll.config').set_mappings({
  ['<C-u>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500', [['sine']]}},
  ['<C-d>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['sine']]}},
})
