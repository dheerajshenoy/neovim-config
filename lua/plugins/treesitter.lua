return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "python",
                "cmake",
                "make",
                "bash",
                "gitignore",
                "rust",
                "luadoc",
                "html",
                "css",
                "latex",
                "desktop",
                "json",
            },

            sync_install = false,
            auto_install = true,
            ignore_install = {},
            indent = {
                enable = true
            },
            highlight = {
                enable = true,

                disable = {},
                additional_vim_regex_highlighting = false,
            },
        }

    end
}

