vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{
		src = "https://github.com/Saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"pyright",
		"clangd",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	signature = {
		enabled = true,
		window = { border = "rounded" },
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			window = { border = "rounded" },
		},
		menu = {
			border = "rounded",
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
	keymap = {
		preset = "default",
		["<C-k>"] = false,
		["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
	},
})

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "Hover" })

vim.keymap.set("n", "<leader>fa", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format" })

-- "gri" is mapped to |vim.lsp.buf.implementation()|
-- "grn" is mapped to |vim.lsp.buf.rename()|
-- "grr" is mapped to |vim.lsp.buf.references()|
-- "grt" is mapped to |vim.lsp.buf.type_definition()|
-- "grx" is mapped to |vim.lsp.codelens.run()|
-- "gO" is mapped to |vim.lsp.buf.document_symbol()|
-- CTRL-S (Insert mode) is mapped to |vim.lsp.buf.signature_help()|
