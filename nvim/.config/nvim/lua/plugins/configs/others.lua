local M = {}

local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

M.indentline = function()
  require("indent_blankline").setup {
    char = "|",
    buftype_exclude = { "terminal" },
    cmd [[
      let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
      let g:indent_blankline_char_highlight_list = ['Function']
      let g:indent_blankline_space_char = ' '
      let g:indent_blankline_space_char_blankline = ' '
      let g:indent_blankline_enabled = v:false
    ]],
    map("n", "IL", ":IndentBlanklineToggle<CR>", opts),
  }
end

M.tty = function()
  require("toggleterm").setup {
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
    direction = "horizontal",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      border = "single",
      width = 180,
      height = 50,
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  }
end

M.orgmode = function()
  require("orgmode").setup {}
end

-- TODO: configure this more
M.neorg = function()
  require("neorg").setup {
    -- Tell Neorg what modules to load
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.norg.concealer"] = {}, -- Allows for use of icons
      ["core.norg.dirman"] = { -- Manage your directories with Neorg
        config = {
          workspaces = {
            my_workspace = "~/neorg",
          },
        },
      },
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
    },
  }
end

return M
