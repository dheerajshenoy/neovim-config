local M = {}

M.find_other_file = function ()
    local ft = vim.bo.filetype

    if ft ~= "c" and ft ~= "cpp" then
        print("Filetype doesn't support find-other-file")
        return
    end

    local basename = vim.fn.expand("%:t:r")
    local current_ext = vim.fn.expand("%:e")
    local dir = vim.fn.expand("%:p:h")

    local alt_ext = (current_ext == "h" or current_ext == "hpp") and
    { "cpp", "c" } or { "h", "hpp" }

    for _, ext in ipairs(alt_ext) do
        local alt_path = dir .. "/" .. basename .. "." .. ext
        if vim.fn.filereadable(alt_path) == 1 then
            vim.cmd("edit " .. alt_path)
            return
        end
    end
end

vim.api.nvim_create_user_command("FindOtherFile", M.find_other_file,
    {})

return M
