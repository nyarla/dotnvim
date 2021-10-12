local autocmd = require("utils.autocmd")
local formats = {
  "*.c",
  "*.cc",
  "*.cpp",
  "*.css",
  "*.go",
  "*.h",
  "*.hh",
  "*.hpp",
  "*.html",
  "*.js",
  "*.json",
  "*.lua",
  "*.nix",
  "*.pl",
  "*.pm",
  "*.scss",
  "*.t",
  "*.ts",
  "*.xml",
  "*.yaml",
  "cpanfile"
}

local commands = {}
for _, format in ipairs(formats) do
  commands[#commands + 1] = {event = "BufWritePre", target = format, action = "Neoformat"}
end

autocmd("neoformat-auto-format", commands)

local g = vim.g
local luafmt = vim.fn["neoformat#formatters#lua#luafmt"]()
luafmt.args = {"--stdin", "-i 2"}

g.neoformat_lua_luafmt = luafmt
