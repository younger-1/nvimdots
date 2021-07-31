local global = require 'core.global'
local vim = vim

-- Create cache dir and subs dir
local createdir = function()
    local data_dir = {
        global.cache_dir .. 'backup', global.cache_dir .. 'session',
        global.cache_dir .. 'swap', global.cache_dir .. 'tags',
        global.cache_dir .. 'undo'
    }
    -- There only check once that If cache_dir exists
    -- Then I don't want to check subs dir exists
    if vim.fn.isdirectory(global.cache_dir) == 0 then
        os.execute("mkdir -p " .. global.cache_dir)
        for _, v in pairs(data_dir) do
            if vim.fn.isdirectory(v) == 0 then
                os.execute("mkdir -p " .. v)
            end
        end
    end
end

local disable_distribution_plugins = function()
    vim.g.loaded_gzip = 0
    vim.g.loaded_tar = 0
    vim.g.loaded_tarPlugin = 0
    vim.g.loaded_zip = 0
    vim.g.loaded_zipPlugin = 0
    vim.g.loaded_getscript = 0
    vim.g.loaded_getscriptPlugin = 0
    vim.g.loaded_vimball = 0
    vim.g.loaded_vimballPlugin = 0
    vim.g.loaded_matchit = 0
    vim.g.loaded_matchparen = 0
    vim.g.loaded_2html_plugin = 0
    vim.g.loaded_logiPat = 0
    vim.g.loaded_rrhelper = 0
    vim.g.loaded_netrw = 0
    vim.g.loaded_netrwPlugin = 0
    vim.g.loaded_netrwSettings = 0
    vim.g.loaded_netrwFileHandlers = 0
end

local leader_map = function()
    vim.g.mapleader = ","
    vim.api.nvim_set_keymap('n', ' ', '', {noremap = true})
    vim.api.nvim_set_keymap('x', ' ', '', {noremap = true})
end

local ultisnips_map = function()
    vim.g.UltiSnipsExpandTrigger = "<NUL>"
    vim.g.UltiSnipsJumpForwardTrigger = "<C-l>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<C-h>"
    vim.g.UltiSnipsEditSplit = "vertical"
end

local neovide_config = function()
    vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font:h12]]
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_no_idle = true
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_trail_length = 0.05
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_opacity = 200.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_speed = 20.0
    vim.g.neovide_cursor_vfx_particle_density = 5.0
end

local load_core = function()
    local pack = require('core.pack')
    createdir()
    disable_distribution_plugins()
    leader_map()

    pack.ensure_plugins()
    ultisnips_map()
    neovide_config()

    require('core.options')
    require('core.mapping')
    require('keymap')
    require('core.event')
    pack.load_compile()
end

load_core()
