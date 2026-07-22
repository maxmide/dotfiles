-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings
vim.opt.number = true         -- show line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.tabstop = 4           -- tab width
vim.opt.shiftwidth = 4        -- indent width
vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.smartindent = true
vim.opt.wrap = false          -- no line wrapping
vim.opt.ignorecase = true     -- case insensitive search
vim.opt.smartcase = true      -- unless capital letters used
vim.opt.termguicolors = true  -- better colors
vim.opt.cursorline = true

-- Escape clear search highlight
vim.keymap.set("n", "<Esc>", function()
  vim.cmd("nohlsearch")
  return "<Esc>"
end, { expr = true, silent = true })

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on") 

vim.opt.signcolumn     = "yes"     -- always show sign column (no layout shift)
vim.opt.updatetime     = 150       -- faster CursorHold / gitsigns refresh
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.clipboard      = "unnamedplus"  -- sync with system clipboard

vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.winbar = nil

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- tree-sitter
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate'
    },

    -- Colorscheme
    {
      "navarasu/onedark.nvim",
      priority = 1000,
      config = function()
        require('onedark').setup {
          style = 'cool',
          transparent = true,
        }
        require('onedark').load()
      end
    },

    -- Auto-close brackets, quotes, etc.
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require("nvim-autopairs").setup({
          check_ts = false,  -- no treesitter needed
        })
      end
    },

    -- File explorer
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      cmd = "Neotree",
      keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
      },
      opts = {
        close_if_last_window = true,
        window = {
          width = 30,
        },
        filesystem = {
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
        },
      },
    },

    -- Fuzzy finder
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = { "nvim-lua/plenary.nvim" },
      cmd = "Telescope",
      keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      },
      config = function()
        require("telescope").setup({
          defaults = {
            preview = {
              treesitter = false,
            },
          },
        })
      end,
    },

    -- status line
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("lualine").setup({
          options = {
            theme                = "onedark",
            globalstatus         = true,      -- single statusline for all windows
            --section_separators   = "",        -- clean flat look
            --component_separators = "|",
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { { "filename", path = 1 } },  -- relative path
            lualine_x = { "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
          },
        })
      end,
    },

  },
})

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'rust', 'javascript', 'zig', 'lua', 'go', 'cpp' }
