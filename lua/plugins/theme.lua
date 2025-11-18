return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    name = "onedark",
    priority = 1000,
        config = function()
            require("onedark").setup({
                style = "deep",
                transparent = true,
                lualine = {
                    transparent = true, -- lualine center bar transparency
                },
            })
      require("onedark").load()
    end
  }
}
