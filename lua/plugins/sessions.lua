vim.pack.add({
  "https://github.com/rmagatti/auto-session",
})
require("auto-session").setup({
  auto_restore = false,
  -- The following are already the default values, no need to provide them if these are already the settings you want.
  session_lens = {
    picker = "telescope", -- "telescope"|"snacks"|"fzf"|"select"|nil Pickers are detected automatically but you can also manually choose one. Falls back to vim.ui.select
    load_on_setup = true,
    -- mappings = {
      --   Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
      --   delete_session = { "n", "<C-d>" },
      --   alternate_session = { "n", "<C-s>" },
      --   copy_session = { "n", "<leader>" },
      -- },
      opts = {
        bypass_save_filetypes = { "alpha", "dashboard", "snacks_dashboard" }, -- or whatever dashboard you use
      },
      picker_opts = {
        border = true,
        layout_config = {
          width = 0.8, -- Can set width and height as percent of window
          height = 0.5,
        },
      },
    },
  })
  vim.keymap.set( "n", "<leader>wr", "<cmd>AutoSession search<CR>" )
  vim.keymap.set( "n", "<leader>ws", "<cmd>AutoSession save<CR>" )
  vim.keymap.set( "n", "<leader>wa", "<cmd>AutoSession toggle<CR>" )
  vim.keymap.set( "n", "<leader>ww", "<cmd>AutoSession deletePicker<CR>" )
