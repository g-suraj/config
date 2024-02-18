-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'chriskempson/base16-vim',
        config = function()
            vim.cmd([[
                set t_Co=256
                set background=dark
                set termguicolors " Disables the green line problem in CMDER
                let base16colorspace=256
                colorscheme base16-ocean
       ]])
        end
    }, {"RRethy/base16-nvim", config = function() end},
    {"neoclide/coc.nvim", lazy = false, build = "npm ci"},
    {"junegunn/fzf", name = "fzf", lazy = false, build = "./install --all"},
    {"junegunn/fzf.vim", lazy = false}, {
        "L3MON4D3/LuaSnip",
        name = "ls",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {"rafamadriz/friendly-snippets"}
    }, {'nvim-lualine/lualine.nvim'}, {
        'alexghergh/nvim-tmux-navigation',
        config = function()

            local nvim_tmux_nav = require('nvim-tmux-navigation')

            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }

            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>",
                           nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

        end
    }, {"tpope/vim-commentary"}, {"jiangmiao/auto-pairs"}, {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "lua", "vim", "vimdoc", "javascript", "html", "python",
                },
                sync_install = false,
                highlight = {enable = true},
                indent = {enable = true}
            })
        end
    }, {"lukas-reineke/indent-blankline.nvim", main = "ibl"}

})

require("lualine").setup {options = {theme = "base16"}}
require("ibl").setup()
require("coc")

-- Key remappings
local keyset = vim.keymap.set
require("luasnip.loaders.from_vscode").lazy_load()
keyset({"i"}, "<C-q>", function() require("luasnip").expand() end,
       {silent = true})
keyset({"i"}, "jk", "<Esc>")
keyset({"i"}, "kj", "<Esc>")
keyset({"i"}, "kj", "<Esc>")

-- options/settings
vim.opt.undofile = true
vim.opt.undodir = "undodir"
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.encoding="utf-8"
vim.opt.updatetime=300
vim.cmd([[
highlight ExtraWhitespace ctermbg=red guibg=#bf616a
match ExtraWhitespace /\s\+$/
]])
