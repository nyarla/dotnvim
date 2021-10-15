local exec = vim.cmd
local format = vim.fn.printf

local DOTNVIM = vim.fn.fnamemodify(vim.env.MYVIMRC, ":p:h")

function include(path)
  exec(format("source %s", DOTNVIM .. "/" .. path))
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
