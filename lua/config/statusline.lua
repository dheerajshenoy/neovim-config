vim.o.statusline = "%#StatusLineMode#"
.. " %{%v:lua.MyMode()%} "
.. "%#StatusLineFile#"
.. "%q %t %m %r%="
.. "%#StatusLineFileType#"
.. " %{%v:lua.GetFileType()%} "
.. "%#StatusLinePos#"
.. " %p%% "

local color_normal = vim.api.nvim_get_hl(0, { name = "Normal" })
local color_func = vim.api.nvim_get_hl(0, { name = "Function" })
local color_visual = vim.api.nvim_get_hl(0, { name = "Visual" })

vim.api.nvim_set_hl(0, "StatusLineMode", {
    bg = color_func.fg,
    fg = color_normal.bg,
})

vim.api.nvim_set_hl(0, "StatusLineFileType", {
    fg = color_normal.fg,
    bg = color_visual.bg,
})

vim.api.nvim_set_hl(0, "StatusLineFile", {
    fg = color_func.fg,
    bg = color_visual.fg
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

function _G.GetFileType ()
    return vim.bo.filetype
end
