local M = {}
function M.defaults()
  local opt = vim.opt
  opt.clipboard = "unnamedplus"
  opt.scrolloff = 15
  opt.wrap = false
  opt.cmdheight = 1
  opt.completeopt = { "menuone", "noselect" }
  opt.cul = true
  opt.expandtab = true
  opt.shiftwidth = 2
  opt.smartindent = true
  opt.fillchars = { eob = " " }
  opt.hidden = true
  opt.ignorecase = true
  opt.mouse = "a"
  opt.mousemodel = "popup"
  opt.number = true
  opt.numberwidth = 2
  opt.relativenumber = false
  opt.ruler = false
  do
  end
  (opt.shortmess):append "sI"
  opt.signcolumn = "yes"
  opt.splitbelow = true
  opt.splitright = true
  opt.tabstop = 2
  opt.termguicolors = true
  opt.timeoutlen = 400
  opt.undofile = true
  opt.updatetime = 250
  return nil
end

function M.disabled_builtins()
  local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
  }
  local g = vim.g
  for _, plugin in pairs(disabled_built_ins) do
    g[("loaded_" .. plugin)] = 1
  end
  return nil
end

function M.setup()
  M.defaults()
  M.disabled_builtins()
end

return M
