local scrollbar_status, scrollbar = pcall(require, "scrollbar")
local colors_status, colors = pcall(require, "tokyonight.colors")

if (not scrollbar_status or not colors_status) then return end

scrollbar.setup({
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
})

