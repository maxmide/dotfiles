require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua", "go", "python", "php"},

    --Install parsers synchronously (only applied to `ensure _installed`)
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
