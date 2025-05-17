return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function ()

        local ls = require("luasnip")

        ls.setup({
            -- keep_roots = true,
            -- link_roots = true,
            -- link_children = true,
            -- exit_roots = false,
            update_events = "TextChanged,TextChangedI",
            delete_check_events = "TextChanged",
            enable_autosnippets = true,
        })


        vim.keymap.set({"i"}, "<C-L>", function ()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, {silent = true})

        vim.keymap.set({"i", "s"}, "<C-J>", function()
            if ls.locally_jumpable(1) then
                ls.jump(1)
            end
        end, {silent = true})

        vim.keymap.set({"i", "s"}, "<C-K>", function()
            if ls.locally_jumpable(-1) then
                ls.jump(-1)
            end
        end, {silent = true})

        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true})

        require("luasnip.loaders.from_vscode").lazy_load()

    end
}
