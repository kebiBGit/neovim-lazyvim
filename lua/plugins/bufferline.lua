vim.pack.add({
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})
require("bufferline").setup({
	options = {
		-- Appearance options go here
		themable = true,
    indicator = {
      icon = "▋", -- The character to use as indicator
      style = "icon" -- Can be "icon", "underline", or "none"
    },
		mode = "buffers",
		modified_icon = "●",
		buffer_close_icon = "󰅖",
		separator_style = "thin",
		offsets = {
			{
				filetype = "neo-tree",
				text = "Neotree File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
	highlights = {
		buffer_selected = {
			fg = "#1856ff",
			bold = true,
		},
	},
})
vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>", { noremap = true, silent = true })
