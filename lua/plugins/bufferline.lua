return
    {'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require('bufferline').setup({
                options = {
                    -- Appearance options go here
                    indicator = {
                        style = "underline",
                    },
                    mode = "tabs",
                    modified_icon = "●",
                    buffer_close_icon = '󰅖',
                    separator_style = "slope",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Neotree File Explorer",
                            text_align = "center",
                            separator = true
                        }
                    },

                }
            })
            vim.cmd([[
  hi BufferLineIndicatorSelected guifg=#ff79c6 gui=underline
  hi BufferLineSeparatorSelected guifg=#ff79c6
]])
            vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>",{ noremap = true, silent = true })
        end
    }
