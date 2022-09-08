local scrollbar_status, scrollbar = pcall(require, "scrollbar")

if (not scrollbar_status) then return end

-- colors.setup {
--   Error = "#db4b4b",
--   Warning = "#e0af68",
--   Information = "#0db9d7",
--   Hint = "#10B981"
-- }

scrollbar.setup({
  --handle = {
  --  color = '#0c0b28',
  --},
  marks = {
    Search = { color = '#f98e1d', text = { '=' } },
    Error = { color = '#db4b4b', text = { '=' } },
    Warn = { color = '#e0af68', text = { '=' } },
    Info = { color = '#0db9d7', text = { '=' } },
    Hint = { color = '#10b981', text = { '=' } },
    Misc = { color = '#f8f8f8', text = { '=' } },
  }
})
