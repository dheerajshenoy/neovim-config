-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        require("telescope").setup({
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        })

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>fs", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})

        vim.keymap.set("n", "<leader>hh", builtin.help_tags, {})

    end
}
