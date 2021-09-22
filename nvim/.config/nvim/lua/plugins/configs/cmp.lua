-- luasnip setup
local luasnip = require "luasnip"

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "vsnip" },
    { name = "path" },
    { name = "neorg" },
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        vsnip = "[VSnip]",
      })[entry.source.name]
      return vim_item
    end,
  },
}

-- define an chain complete list
local chain_complete_list = {
  default = {
    { complete_items = { "lsp", "snippet" } },
    { complete_items = { "path" }, triggered_only = { "/" } },
    { complete_items = { "buffers" } },
  },
  string = {
    { complete_items = { "path" }, triggered_only = { "/" } },
  },
  comment = {},
}

local on_attach = function()
  require("diagnostic").on_attach()
  -- passing in a table with on_attach function
  require("completion").on_attach {
    sorting = "alphabet",
    matching_strategy_list = { "exact", "fuzzy" },
    chain_complete_list = chain_complete_list,
  }
end
