-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlights text when yanking",
    group = vim.api.nvim_create_augroup("mygroup", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- LSP Attach
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        vim.keymap.set("n", "gd", function ()
            vim.lsp.buf.definition()
        end, { desc = "Goto definition" })
    end
})

-- Auto-remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Auto remove trailing whitespace on save",
    pattern = "*",
    callback = function()
        local save = vim.fn.winsaveview()
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.winrestview(save)
    end,
})

-- No automatic comment insertion
vim.api.nvim_create_autocmd("FileType", {
    desc="No automatic comment insertion",
    pattern = "*",
    callback = function ()
        vim.opt_local.formatoptions:remove({"r", "o"})
    end,
})
