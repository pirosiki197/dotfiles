return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  opts = {
    keymap = { preset = "enter" },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      }
    },
  },
}
