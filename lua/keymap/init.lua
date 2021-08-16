local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args
require('keymap.config')

local plug_map = {
    -- Bufferline
    ["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
    ["n|<A-j>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
    ["n|<A-k>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
    ["n|<A-S-j>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
    ["n|<A-S-k>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
    ["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap(),
    ["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap(),
    -- Packer
    ["n|<leader>ps"] = map_cr("PackerSync"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pu"] = map_cr("PackerUpdate"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pi"] = map_cr("PackerInstall"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pc"] = map_cr("PackerCompile"):with_silent():with_noremap()
        :with_nowait(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent()
        :with_nowait(),
    ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent()
        :with_nowait(),
    ["n|g["] = map_cr('Lspsaga diagnostic_jump_next'):with_noremap()
        :with_silent(),
    ["n|g]"] = map_cr('Lspsaga diagnostic_jump_prev'):with_noremap()
        :with_silent(),
    ["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|<leader>ca"] = map_cr("Lspsaga code_action"):with_noremap()
        :with_silent(),
    ["v|<leader>ca"] = map_cu("Lspsaga range_code_action"):with_noremap()
        :with_silent(),
    ["n|gd"] = map_cmd('<cmd>lua vim.lsp.buf.definition()<CR>'):with_noremap()
        :with_silent(),
    ["n|gD"] = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap()
        :with_silent(),
    ["n|gs"] = map_cr('Lspsaga signature_help'):with_noremap():with_silent(),
    ["n|gr"] = map_cr('Lspsaga rename'):with_noremap():with_silent(),
    ["n|gh"] = map_cr('Lspsaga lsp_finder'):with_noremap():with_silent(),
    ["n|<A-d>"] = map_cu('Lspsaga open_floaterm'):with_noremap():with_silent(),
    ["t|<A-d>"] = map_cu([[<C-\><C-n>:Lspsaga close_floaterm<CR>]]):with_noremap()
        :with_silent(),
    ["n|<Leader>g"] = map_cu("Lspsaga open_floaterm gitui"):with_noremap()
        :with_silent(),
    -- Plugin trouble
    ["n|gt"] = map_cr('TroubleToggle'):with_noremap():with_silent(),
    ["n|gR"] = map_cr('TroubleToggle lsp_references'):with_noremap()
        :with_silent(),
    ["n|<leader>cd"] = map_cr('TroubleToggle lsp_document_diagnostics'):with_noremap()
        :with_silent(),
    ["n|<leader>cw"] = map_cr('TroubleToggle lsp_workspace_diagnostics'):with_noremap()
        :with_silent(),
    ["n|<leader>cq"] = map_cr('TroubleToggle quickfix'):with_noremap()
        :with_silent(),
    ["n|<leader>cl"] = map_cr('TroubleToggle loclist'):with_noremap()
        :with_silent(),
    -- Plugin nvim-tree
    ["n|<C-n>"] = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    ["n|<Leader>nf"] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
    ["n|<Leader>nr"] = map_cr('NvimTreeRefresh'):with_noremap():with_silent(),
    -- Plugin Telescope
    ["n|<Leader>fp"] = map_cu('Telescope project'):with_noremap():with_silent(),
    ["n|<Leader>fe"] = map_cu('DashboardFindHistory'):with_noremap()
        :with_silent(),
    ["n|<Leader>fr"] = map_cu('Telescope frecency'):with_noremap():with_silent(),
    ["n|<Leader>ff"] = map_cu('DashboardFindFile'):with_noremap():with_silent(),
    ["n|<Leader>sc"] = map_cu('DashboardChangeColorscheme'):with_noremap()
        :with_silent(),
    ["n|<Leader>fw"] = map_cu('DashboardFindWord'):with_noremap():with_silent(),
    ["n|<Leader>fn"] = map_cu('DashboardNewFile'):with_noremap():with_silent(),
    ["n|<Leader>fb"] = map_cu('Telescope file_browser'):with_noremap()
        :with_silent(),
    ["n|<Leader>fg"] = map_cu('Telescope live_grep'):with_noremap()
        :with_silent(),
    -- Plugin accelerate-jk
    ["n|j"] = map_cmd("v:lua.enhance_jk_move('j')"):with_silent():with_expr(),
    ["n|k"] = map_cmd("v:lua.enhance_jk_move('k')"):with_silent():with_expr(),
    -- Plugin vim-eft
    ["n|f"] = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"] = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["n|t"] = map_cmd("v:lua.enhance_ft_move('t')"):with_expr(),
    ["n|T"] = map_cmd("v:lua.enhance_ft_move('T')"):with_expr(),
    ["n|;"] = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    -- Plugin Easymotion
    ["n|<leader>j"] = map_cmd("v:lua.enhance_move('lnj')"):with_expr(),
    ["n|<leader>k"] = map_cmd("v:lua.enhance_move('lnk')"):with_expr(),
    ["n|<leader>f"] = map_cmd("v:lua.enhance_move('lnf')"):with_expr(),
    ["n|<leader>w"] = map_cmd("v:lua.enhance_move('lnw')"):with_expr(),
    ["|<leader>f"] = map_cmd("v:lua.enhance_move('lf')"):with_expr(),
    ["|<leader>w"] = map_cmd("v:lua.enhance_move('lw')"):with_expr(),
    -- Plugin EasyAlign
    ["n|ga"] = map_cmd("v:lua.enhance_align('nga')"):with_expr(),
    ["x|ga"] = map_cmd("v:lua.enhance_align('xga')"):with_expr(),
    -- Plugin ZenMode
    ["n|<leader><leader>z"] = map_cr('ZenMode'):with_noremap():with_silent(),
    -- Plugin Twilight
    ["n|<leader><leader>t"] = map_cr('Twilight'):with_noremap():with_silent(),
    -- Plugin SymbolOutline
    ["n|<A-t>"] = map_cr('SymbolsOutline'):with_noremap():with_silent(),
    -- Plugin split-term
    ["n|<F5>"] = map_cr('Term'):with_noremap():with_silent(),
    ["n|<C-w>t"] = map_cr('Term'):with_noremap():with_silent(),
    ["n|<C-w>T"] = map_cr('VTerm'):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<F12>"] = map_cr('MarkdownPreviewToggle'):with_noremap():with_silent(),
    -- Plugin auto_session
    ["n|<leader>ss"] = map_cu('SaveSession'):with_noremap():with_silent(),
    ["n|<leader>sr"] = map_cu('RestoreSession'):with_noremap():with_silent(),
    ["n|<leader>sd"] = map_cu('DeleteSession'):with_noremap():with_silent(),
    -- Plugin SnipRun
    ["v|r"] = map_cr('SnipRun'):with_noremap():with_silent()
};

bind.nvim_load_mapping(plug_map)
