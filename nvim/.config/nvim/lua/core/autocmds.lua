local cmd = vim.cmd

-- Set Colorscheme for every buffer
cmd [[ colorscheme gruvbox ]]

-- Don't show any numbers inside terminals
-- cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

-- Abbreviations nobody should be without.
-- These automagically fix typos for saving, quitting, or both.
cmd [[
  cnoreabbrev W! w!
  cnoreabbrev Q! q!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Qall qall
]]

-- Automatically trim whitespace
cmd [[
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritePre * %s/\n\+\%$//e
]]
