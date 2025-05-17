local M = {}

M.setup = function ()

end

M.capture = function ()
    local buf = vim.api.nvim_create_buf(false, true)

    local width = 50
    local height = 10
    local ui = vim.api.nvim_list_uis()[1]

    local opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = (ui.height - height) / 2,
        col = (ui.width - width) / 2,
        border = "rounded"
    }

    local win = vim.api.nvim_open_win(buf, true, opts)
    vim.bo.filetype = "markdown"
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
        "<!-- Capture Buffer ->",
        "<!-- Cancel :q or <Esc> ; Confirm :w or :wq -->",
        "",
        "",
    })
    vim.api.nvim_win_set_cursor(win, {3, 0})
end

M.capture()
-- vim.api.nvim_create_user_command("Capture", M.capture, {})

return M
