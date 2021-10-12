local nmap = require("utils.keymap").nmap
local vmap = require("utils.keymap").vmap
local autocmd = require("utils.autocmd")

local g = vim.g

g.netrw_nogx = 1
g.openbrowser_default_search = "duckduckgo"

nmap("gx", "<Plug>(openbrowser-smart-search)")
vmap("gx", "<Plug>(openbrowser-smart-search)")

autocmd(
  "openbrowser-markdown-fix",
  {
    {event = "BufRead,BufNewFile", target = "*.md", action = "map! gz <Nop>"}
  }
)
