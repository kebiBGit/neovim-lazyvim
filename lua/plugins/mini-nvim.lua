vim.pack.add({
"https://github.com/nvim-mini/mini.nvim",
})

--mini.indentscope

init = function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end
require('mini.indentscope').setup(
{
  draw = {
    delay = 0,
    predicate = function(scope) return not scope.body.is_incomplete end,
    priority = 2,
  },
  mappings = {
    object_scope = 'ii',
    object_scope_with_border = 'ai',
    goto_top = '[i',
    goto_bottom = ']i',
  },
  options = {
    border = 'both',
    indent_at_cursor = true,
    n_lines = 10000,
    try_as_border = false,
  },
  -- symbol = "│",
  -- symbol = "⣿",
  -- symbol = "⢸",
  symbol = "⡇",
})

--mini.surround

require('mini.surround').setup({
  custom_surroundings = nil,
  highlight_duration = 500,
  mappings = {
    add = 'gsa', -- Add surrounding in Normal and Visual modes
    delete = 'gsd', -- Delete surrounding
    find = 'gsf', -- Find surrounding (to the right)
    find_left = 'gsF', -- Find surrounding (to the left)
    highlight = 'gsh', -- Highlight surrounding
    replace = 'gsr', -- Replace surrounding
  },
  n_lines = 20,
  respect_selection_type = false,
  search_method = 'cover',
  silent = false,
})

--mini.files

require("mini.files").setup({
  mappings = {
    close       = 'q',
    go_in       = 'l',
    go_in_plus  = '<CR>',
    go_out      = 'h',
    go_out_plus = 'H',
    mark_goto   = "'",
    mark_set    = 'm',
    reset       = '<BS>',
    reveal_cwd  = '@',
    show_help   = 'g?',
    synchronize = 's',
    trim_left   = '<',
    trim_right  = '>',
  },
  options = {
    permanent_delete = false,
    use_as_default_explorer = true,
  },
  windows = {
    max_number = math.huge,
    preview = true,
    width_focus = 50,
    width_nofocus = 15,
    width_preview = 50,
  },
})
local show_dotfiles = true
local filter_show = function(fs_entry) return true end
local filter_hide = function(fs_entry)
  return not vim.startswith(fs_entry.name, '.')
end
local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  local new_filter = show_dotfiles and filter_show or filter_hide
  MiniFiles.refresh({ content = { filter = new_filter } })
end
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    -- Tweak left-hand side of mapping to your liking
    vim.keymap.set('n', '<C-h>', toggle_dotfiles, { buffer = buf_id })
  end,
})

vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>")
