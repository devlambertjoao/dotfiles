local scrollbar_status, scrollbar = pcall(require, "scrollbar")

if (not scrollbar_status) then return end

scrollbar.setup({
  -- handle = {
  --   color = colors.bg_highlight,
  -- },
  -- marks = {
  --   Search = { color = colors.orange },
  --   Error = { color = colors.error },
  --   Warn = { color = colors.warning },
  --   Info = { color = colors.info },
  --   Hint = { color = colors.hint },
  --   Misc = { color = colors.purple },
  -- }
})
