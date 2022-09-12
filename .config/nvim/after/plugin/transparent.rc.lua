local status, transparent = pcall(require, "nvim-transparent")
if (not status) then return end

transparent.setup {
  enable = true,
}

