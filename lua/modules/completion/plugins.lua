local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
    opt = true,
    event = 'BufRead',
    config = conf.nvim_lsp
}
completion['kabouzeid/nvim-lspinstall'] = {
    opt = true,
    cmd = {'LspInstall', 'LspUninstall'}
}
completion['glepnir/lspsaga.nvim'] = {opt = true, config = conf.saga}
completion['windwp/nvim-autopairs'] = {
    opt = true,
    event = 'InsertCharPre',
    config = conf.autopairs
}
completion['ms-jpq/coq_nvim'] = {
    opt = true,
    branch = 'coq',
    config = conf.coq,
    cmd = {'COQnow', 'COQdeps'},
    requires = {'ms-jpq/coq.artifacts', branch = 'artifacts'}
}

return completion
