vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set incsearch")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
--vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.scrolloff=10
vim.opt.hlsearch=true
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })  -- highlight for 200ms
  end,
})
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<leader>m", ":tabp<CR>")
vim.keymap.set("n", "<leader>n", ":tabn<CR>")
vim.keymap.set("n", "<leader>tab", ":tabnew<CR>")
vim.keymap.set("n", "<leader>cl", ":tabc<CR>")
vim.keymap.set("n", "<leader>term", ":tab term<CR>")
