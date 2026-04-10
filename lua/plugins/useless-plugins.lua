vim.pack.add({
  "https://github.com/eandrju/cellular-automaton.nvim",
  "https://github.com/tamton-aquib/duck.nvim",
  "https://github.com/AndrewRadev/discotheque.vim",
})
-- duck
vim.keymap.set('n', '<leader>fdf', function() require("duck").hatch("🖕",20) end, {})
vim.keymap.set('n', '<leader>fdc', function() require("duck").hatch("🤡",20) end, {})
vim.keymap.set('n', '<leader>fdk', function() require("duck").cook_all() end, {})

-- cellular
vim.keymap.set("n", "<leader>fcs", "<cmd>CellularAutomaton scramble<CR>")
vim.keymap.set("n", "<leader>fcr", "<cmd>CellularAutomaton make_it_rain<CR>")
