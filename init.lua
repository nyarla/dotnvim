local exec = vim.cmd
local format = vim.fn.printf

function include(path)
  exec(format("source %s", vim.env.HOME .. "/local/dotnvim/" .. path))
end

require("options")
require("filetype")
require("mapping")
include("vim/colorscheme.vim")

require("plugins.open-browser")
require("plugins.neoformat")
require("plugins.nvim-treesitter")
require("plugins.lsp")
require("plugins.nvim-tree")
