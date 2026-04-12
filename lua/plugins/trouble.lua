vim.pack.add({
	"https://github.com/folke/trouble.nvim",
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,

	float = {
		border = "rounded",
		source = true,
		focusable = false,
	},
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})

-- Trouble setup
require("trouble").setup({
	focus = true,
	auto_close = true,
	auto_preview = true,

	modes = {
		diagnostics = {
			mode = "diagnostics",
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.4,
			},
		},

		symbols = {
			mode = "lsp_document_symbols",
			focus = false,
		},
	},
})
-- Keymaps

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>")
vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>")

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local enabled = vim.diagnostic.is_enabled()
	vim.diagnostic.enable(not enabled)
	print("Diagnostics " .. (enabled and "disabled" or "enabled"))
end, { desc = "Toggle diagnostics" })

vim.keymap.set("n", "<leader>td", "<cmd>DiagnosticToggle<CR>", { desc = "Toggle diagnostics" })
vim.keymap.set("n", "<leader>qd", "<cmd>lua vim.fn.setqflist({})<CR>", { desc = "Delete Quickfix" })
vim.keymap.set("n", "<leader>qn", "<cmd>cn<CR>", { desc = "Next" })
vim.keymap.set("n", "<leader>qp", "<cmd>cp<CR>", { desc = "Previous" })
