vim.o.statusline = "%#StatusLineMode#"
.. " %{%v:lua.MyMode()%} "
.. "%#StatusLineFile#"
.. "%q %t %m %r%="
.. "%#StatusLinePos#"
.. " %p%% "

local fg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
local bg = vim.api.nvim_get_hl(0, { name = "Function" }).fg

vim.api.nvim_set_hl(0, "StatusLineMode", {
    bg = bg,
    fg = fg,
})

vim.api.nvim_set_hl(0, "StatusLineFile", {
    fg = bg,
})

function _G.MyMode ()
    local modes = {
        n = "N",
        i = "I",
        v = "V",
        V = "VL",
        ["\22"] = "VB",
        c = "C",
        s = "S"
    }
    local mode = vim.fn.mode()
    return modes[mode] or mode
end

function _G.GitBranch ()
    return git.get_branch()
end
