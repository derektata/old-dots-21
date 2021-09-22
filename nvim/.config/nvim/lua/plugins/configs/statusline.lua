local gl = require "galaxyline"
local condition = require "galaxyline.condition"
local gls = gl.section

local colors = {
  bg = "#282828",
  fg = "#FBF1C7",
  gray1 = "#3C3836",
  gray2 = "#504945",
  gray3 = "#665C54",
  red1 = "#CC241D",
  red2 = "#FB4934",
  orange1 = "#D65D0E",
  orange2 = "#FE8019",
  yellow1 = "#D79921",
  yellow2 = "#FABD2F",
  green1 = "#98971A",
  green2 = "#B8BB26",
  aqua1 = "#689D6A",
  aqua2 = "#8EC07C",
  blue1 = "#458588",
  blue2 = "#83A598",
  purple1 = "#B16286",
  purple2 = "#D3869B",
}

gls.left[1] = {
  Block = {
    provider = function()
      return "▊ "
    end,
    highlight = { colors.fg, colors.bg },
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.red2,
        i = colors.green2,
        v = colors.yellow2,
        [""] = colors.yellow2,
        V = colors.yellow2,
        c = colors.blue2,
        no = colors.red2,
        s = colors.orange2,
        S = colors.orange2,
        [""] = colors.orange2,
        ic = colors.blue1,
        R = colors.purple1,
        Rv = colors.purple1,
        cv = colors.red2,
        ce = colors.red2,
        r = colors.aqua1,
        rm = colors.aqua1,
        ["r?"] = colors.aqua1,
        ["!"] = colors.red2,
        t = colors.red2,
      }
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
      return " "
    end,
    highlight = { colors.red2, colors.bg, "bold" },
  },
}

gls.left[3] = {
  LeftArrow = {
    provider = function()
      return ""
    end,
    separator_highlight = { "NONE", colors.fg },
    highlight = { colors.fg, colors.bg },
    separator = " ",
  },
}

gls.left[4] = {
  GitIcon = {
    provider = function()
      return ""
    end,
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = { "NONE", colors.fg },
    highlight = { colors.bg, colors.fg, "bold" },
  },
}

gls.left[5] = {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    highlight = { colors.bg, colors.fg, "bold" },
    separator_highlight = { "NONE", colors.fg },
    separator = " ",
  },
}

gls.left[6] = {
  RightArrow = {
    provider = function()
      return ""
    end,
    separator_highlight = { "NONE", colors.gray2 },
    highlight = { colors.fg, colors.gray2 },
    separator = " ",
  },
}

gls.left[8] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.gray2 },
  },
}

gls.left[9] = {
  FileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.gray2, "bold" },
  },
}

gls.left[10] = {
  RightArrow2 = {
    provider = function()
      return ""
    end,
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.gray2, colors.bg },
    separator = " ",
  },
}

gls.left[11] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = " ",
    highlight = { colors.red2, colors.bg },
  },
}

gls.left[12] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = " ",
    highlight = { colors.orange2, colors.bg },
  },
}

gls.left[13] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = " ",
    highlight = { colors.blue2, colors.bg },
  },
}

gls.left[14] = {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = { colors.yellow2, colors.bg },
  },
}

--[[ gls.right[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = '  ',
    highlight = {colors.aqua2,colors.bg,'bold'}
  }
} ]]

gls.right[1] = {
  lsp_status = {
    provider = function()
      local clients = vim.lsp.get_active_clients()
      if next(clients) ~= nil then
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return " " .. "  " .. " " .. vim.bo.filetype
          end
        end
        return ""
      else
        return ""
      end
    end,
    highlight = { colors.aqua2, colors.bg, "bold" },
  },
}

gls.right[2] = {
  FileEncode = {
    provider = "FileEncode",
    condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.green2, colors.bg, "bold" },
  },
}

gls.right[3] = {
  FileFormat = {
    provider = "FileFormat",
    condition = condition.hide_in_width,
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.green2, colors.bg, "bold" },
  },
}

gls.right[4] = {
  PerCent = {
    provider = "LinePercent",
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.fg, colors.bg, "bold" },
  },
}
