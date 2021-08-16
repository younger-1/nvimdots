local config = {}

function config.nvim_lsp() require('modules.completion.lspconfig') end

function config.saga()
    vim.api.nvim_command("autocmd CursorHold * Lspsaga show_line_diagnostics")
end

function config.autopairs()
    require('nvim-autopairs').setup({
        disable_filetype = {"TelescopePrompt"},
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        -- add bracket pairs after quote
        enable_afterquote = true,
        -- check bracket in same line
        enable_check_bracket_line = true,
        check_ts = true
    })
end

function config.coq() vim.g.coq_settings.clients.tabnine.enabled = true end

return config
