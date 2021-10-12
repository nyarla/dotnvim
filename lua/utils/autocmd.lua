local format = require("utils.format")
local exec = require("utils.exec")

local function autocmd(name, cmds)
    local executable = ""

    for _, cmd in ipairs(cmds) do
        executable = executable .. format("autocmd %s %s %s\n", cmd.event, cmd.target, cmd.action)
    end

    exec(format([[
augroup %s
  autocmd!
  %s
augroup END
]], name, executable))
end

return autocmd
