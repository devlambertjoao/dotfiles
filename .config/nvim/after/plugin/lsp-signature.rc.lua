local status, lsp_signature = pcall(require, "lsp_signature")
if (not status) then return end

lsp_signature.setup({
  bind = true,
  hint_prefix = "#",
  max_height = 12,
  max_width = 60,
  floating_window = false,
  handler_opts = {
    border = "none"
  },
})
