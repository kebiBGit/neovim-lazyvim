vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop=2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.g.mapleader = " "
vim.g.background = "dark"

vim.opt.swapfile = false

-- Navigate vim panes better
--vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.scrolloff=10
vim.opt.incsearch = true
vim.opt.hlsearch=true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.o.autoindent = true
vim.opt.termguicolors = true
vim.opt.linebreak = true
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })  -- highlight for 200ms
  end,
})
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>m", ":tabp<CR>")
vim.keymap.set("n", "<leader>n", ":tabn<CR>")
vim.keymap.set("n", "<leader>tab", ":tabnew<CR>")
vim.keymap.set("n", "<leader>cl", ":tabc<CR>")
vim.keymap.set("n", "<leader>term", ":tab term<CR>")

