local status, identline = pcall(require, "identline")
if (not status) then return end

identline.setup { 
  show_current_context = true,
  show_current_context_start = true,
}
