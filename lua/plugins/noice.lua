return {
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline_popup",
    },
    routes = {
      {
        filter = { event = "msg_show", kind = "shell_out" },
        view = "notify",
      },
      {
        filter = { event = "msg_show", kind = "shell_err" },
        view = "notify",
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#000000",
      },
    },
    }
}
}
