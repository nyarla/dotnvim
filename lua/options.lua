local HOME = vim.env["HOME"]
local set = vim.opt
local cmd = vim.cmd

set.encoding = "utf-8"
set.fileencoding = "utf-8"

set.number = true
set.cursorline = true
set.ambiwidth = "double"
set.scl = "yes"

set.directory = HOME .. "/.cache/nvim/swap"
set.backupdir = HOME .. "/.cache/nvim/backup"

set.clipboard = "unnamed,unnamedplus"

set.mouse = "a"

set.expandtab = true
set.shiftwidth = 2
set.softtabstop = 2
set.autoindent = true

set.backspace = "indent,eol,start"
