vim.pack.add({
  "https://github.com/mbbill/undotree",
  "https://github.com/nvim-lua/plenary.nvim"
})
-- enable persistent undo (required for undotree)
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undo"
-- make normal 'u' only affect current session (non-destructive)
-- ensure undodir exists
vim.fn.mkdir(vim.o.undodir, "p")
-- record the undo sequence at buffer read so we can detect
-- attempts to undo into older-session history without changing buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local ok, dt = pcall(vim.fn.undotree)
    vim.b.undotree_session_seq = (ok and dt and dt.seq_cur) or nil
  end,
})
-- safe 'u': optional mapping to prevent stepping into older history.
-- If you prefer not to remap 'u', remove this mapping; normal 'u' will
-- then be able to cross into older on-disk history.
vim.keymap.set('n', 'u', function()
  vim.cmd('undo')
  local ok2, after = pcall(vim.fn.undotree)
  local after_seq = ok2 and after and after.seq_cur or nil
  local session_seq = vim.b.undotree_session_seq
  if session_seq and after_seq and after_seq < session_seq then
    vim.cmd('redo')
    vim.notify(' Already at oldest change :) open Undotree (<leader>uu) to preview older edits.', vim.log.levels.INFO)
  end
end, { silent = true, desc = 'Safe undo (stop at session start)' })
vim.keymap.set('n', '<leader>uu', ':UndotreeToggle<CR>')
