return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")
            local themes = require("telescope.themes")

            -- keep track of hidden toggle
            local show_hidden = false

            local function find_files_toggle_hidden()
                show_hidden = not show_hidden
                builtin.find_files({ hidden = show_hidden })
            end

            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-h>"] = function(prompt_bufnr)
                                actions.close(prompt_bufnr)
                                find_files_toggle_hidden()
                            end,
                        },
                        n = {
                            ["<C-h>"] = function(prompt_bufnr)
                                actions.close(prompt_bufnr)
                                find_files_toggle_hidden()
                            end,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        themes.get_dropdown({}),
                    },
                },
            })

            -- Keymaps
            vim.keymap.set("n", "<C-f>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>fb', function()
                builtin.buffers()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
            end, { desc = 'Telescope buffers' })

            telescope.load_extension("ui-select")
        end,
    },
}

