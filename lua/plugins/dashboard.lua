vim.pack.add({
  "https://github.com/nvimdev/dashboard-nvim",
})
local logo = [[
              ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗          Z
              ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      Z    
              ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   z       
              ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ z         
              ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║           
              ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝           
]]
logo = string.rep("\n", 5) .. logo .. "\n\n"

local options = {
  theme = 'doom',
  config = {
    header = (function()
      local h = vim.split(logo, "\n")
      local cwd = vim.fn.getcwd()
      table.insert(h, "  Current directory: " .. cwd)
      table.insert(h, "")
      return h
    end)(),
    center = {
      { action = function() require('telescope.builtin').find_files() end,             desc = " Find File",       icon = "󰱼 ", key = "f" },
      { action = "ene | startinsert",                                                  desc = " New File",        icon = "󱪝 ", key = "n" },
      { action = function() require('telescope.builtin').oldfiles() end,               desc = " Recent Files",    icon = " ", key = "r" },
      { action = function() require('telescope.builtin').live_grep() end,              desc = " Grep Text",       icon = " ", key = "g" },
      { action = "AutoSession search",                                                 desc = " Session Restore", icon = "󰙰 ", key = "s" },
      { action = function() vim.api.nvim_input("<cmd>qa<cr>") end,                     desc = " Quit",            icon = " ", key = "q" },
    },
    footer = function()
      local opt_path = vim.fn.stdpath("data") .. "/site/pack/*/opt/*"
      local total = #vim.fn.globpath(opt_path, "", 0, 1)
      return {
        "⚡ Loaded " .. total .. " plugins in " .. string.format("%.2f", vim.g.startup_time or 0) .. "ms"
      }
    end,
  }
}

require('dashboard').setup(options)

for _, button in ipairs(options.config.center) do
  button.desc = button.desc .. string.rep(" ", math.max(0, 40 - #button.desc))
  button.key_format = "  %s"
end

