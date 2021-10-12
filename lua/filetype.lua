local autocmd = require("utils.autocmd")
local format = require("utils.format")
local exec = require("utils.exec")

-- file relation
local relations = {
  {file = "*.ps1", type = "powershell"},
  {file = "cpanfile", type = "perl"}
}

local relation_cmds = {}

for _, relation in ipairs(relations) do
  relation_cmds[#relation_cmds + 1] = {
    event = "BufRead,BufNewFile",
    target = relation.file,
    action = format("set ft=%s", relation.type)
  }
end

autocmd("filetype-relation", relation_cmds)

-- lazyload
local lazyloads = {
  "css",
  "go",
  "markdown",
  "typescript"
}

local lazyload_cmds = {}

for _, name in ipairs(lazyloads) do
  lazyload_cmds[#lazyload_cmds + 1] = {
    event = "FileType",
    target = lazyload,
    action = format("lua lazyload('%s')", name)
  }
end

autocmd("filetype-lazyload", lazyload_cmds)

-- global
function lazyload(name)
  exec(format("packadd! %s", name))
end

-- filetype configuration
local g = vim.g

g.vim_markdown_folding_disabled = 1
g.vim_markdown_no_default_key_mapping = 1
