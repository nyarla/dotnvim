local configurator = require("nvim-treesitter.configs")

configurator.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  }
}
