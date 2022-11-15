local status, telescope = pcall(require, "telescope")
if not status then
	return
end

telescope.setup({ defaults = { file_ignore_patterns = { "node_modules", "target", "bin", "obj" } } })

local keymap = vim.keymap

keymap.set("n", "<C-p>", ":Telescope find_files<CR>")
keymap.set("n", "<C-f>", ":Telescope live_grep<CR>")
keymap.set("n", ";da", ":Telescope diagnostics<CR>")
