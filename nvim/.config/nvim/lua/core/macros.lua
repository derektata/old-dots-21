local macro = vim.api.nvim_set_keymap

-- Add quotes to a line
-- macro("n", "<Leader>q", 'I"<Esc>A"<Esc>$', {})

-- Add single quotes to a word (Must be on the beginning of the word)
-- macro("n", "<Leader>Q", "i'<Esc>ea'<Esc>", {})

-- Add double quotes to a word (Must be on the beginning of the word)
-- macro("n", "<Leader>QQ", 'i"<Esc>ea"<Esc>', {})

-- Add a dash to the beginning of the line
macro("n", "<Leader>D", "I- <Esc>$", {})

-- Add comma at end of line
macro("n", "<Leader>,", "A,<Esc>", {})
