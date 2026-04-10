vim.pack.add({
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/sindrets/diffview.nvim" ,
 "https://github.com/akinsho/git-conflict.nvim",
})
require('git-conflict').setup()
require("gitsigns").setup({
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
})
--Gitsigns
vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", {})
vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", {})
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})

--Diffview

local diffview_open = false

vim.keymap.set("n", "<leader>gd", function()
    if diffview_open then
        vim.cmd("DiffviewClose")
        diffview_open = false
    else
        vim.cmd("DiffviewOpen")
        diffview_open = true
    end
end, {})

--git-conflict

vim.api.nvim_create_autocmd("User", {
  pattern = "GitConflictDetected",
  callback = function()
    local map = vim.keymap.set
    local opts = { buffer = true }

    map("n", "<leader>co", "<Plug>(git-conflict-ours)",          opts)
    map("n", "<leader>ct", "<Plug>(git-conflict-theirs)",        opts)
    map("n", "<leader>cb", "<Plug>(git-conflict-both)",          opts)
    map("n", "<leader>c0", "<Plug>(git-conflict-none)",          opts)
    map("n", "<leader>n",  "<Plug>(git-conflict-next-conflict)", opts)
    map("n", "<leader>p",  "<Plug>(git-conflict-prev-conflict)", opts)
  end,
})
