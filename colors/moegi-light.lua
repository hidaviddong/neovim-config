-- Moegi Light Theme for Neovim (Opaque Version)
-- Converted from the VSCode "Moegi Light" theme.
-- All transparent colors have been replaced with opaque equivalents.
-- https://github.com/moegi-design/vscode-theme/blob/main/themes/moegi-light-color-theme.json

vim.o.background = 'light'

local colors = {
  bg = '#ffffff',
  fg = '#333333',
  fg_dark = '#515151',
  fg_inactive = '#999999',
  fg_comment = '#a0a0a0', -- Original: #0000004f
  fg_link = '#af5d5d',   -- Original: #af5d5dcc

  red = '#c05386',
  red_alt = '#e38181',
  green = '#377961',
  green_alt = '#26966a',
  yellow = '#c7792b',
  blue = '#668f9a',
  purple = '#6b588e',
  cyan = '#528f77',
  orange = '#b5855c',

  line_highlight = '#f6f6f6',
  selection = '#d4e6e0', -- Approximated from #26966a3a on white
  ui_bg = '#f9f9fb',
  ui_border = '#e5e5e5', -- Original: #0000001a
}

local function set_hl(group, options)
  vim.api.nvim_set_hl(0, group, options)
end

local highlights = {
  Normal = { fg = colors.fg, bg = colors.bg },
  LineNr = { fg = '#aaaaaa', bg = colors.bg },
  CursorLineNr = { fg = '#444444', bg = colors.line_highlight, bold = true },
  Cursor = { fg = colors.bg, bg = colors.red_alt },
  CursorLine = { bg = colors.line_highlight },
  Visual = { bg = colors.selection },
  ColorColumn = { bg = colors.line_highlight },
  SignColumn = { bg = colors.bg },
  Folded = { fg = colors.fg_inactive, bg = colors.ui_border },
  VertSplit = { fg = colors.ui_border, bg = colors.bg },

  Comment = { fg = colors.fg_comment, italic = true },
  String = { fg = colors.green },
  Character = { fg = colors.green },
  Number = { fg = colors.yellow },
  Boolean = { fg = colors.yellow },
  Float = { fg = colors.yellow },
  Constant = { fg = colors.yellow },
  Keyword = { fg = colors.red },
  Statement = { fg = colors.red },
  Operator = { fg = colors.red },
  Function = { fg = colors.blue },
  Identifier = { fg = colors.purple },
  Type = { fg = colors.orange },
  PreProc = { fg = colors.blue },
  Special = { fg = colors.purple },
  Title = { fg = colors.blue, bold = true },
  Todo = { fg = colors.fg, bg = colors.yellow, bold = true },
  Error = { fg = colors.red_alt, bold = true },
  Underlined = { underline = true },

  Delimiter = { fg = colors.fg_dark },
  ['@punctuation.bracket'] = { fg = colors.fg_dark },
  ['@punctuation.delimiter'] = { fg = colors.fg_dark },

  LspInfo = { fg = '#7098d4' },
  LspWarning = { fg = '#e7d38f' },
  LspError = { fg = colors.red_alt },
  DiagnosticUnderlineInfo = { undercurl = true, sp = '#7098d4' },
  DiagnosticUnderlineWarn = { undercurl = true, sp = '#e7d38f' },
  DiagnosticUnderlineError = { undercurl = true, sp = colors.red_alt },

  Pmenu = { fg = colors.fg_dark, bg = colors.ui_bg },
  PmenuSel = { bg = colors.line_highlight, bold = true },
  PmenuSbar = { bg = colors.ui_border },
  PmenuThumb = { bg = colors.fg_inactive },

  StatusLine = { fg = '#444444', bg = colors.bg },
  StatusLineNC = { fg = colors.fg_inactive, bg = colors.ui_bg },

  TabLine = { fg = colors.fg_inactive, bg = colors.ui_bg },
  TabLineFill = { bg = colors.ui_bg },
  TabLineSel = { fg = colors.fg, bg = colors.bg, bold = true },

  DiffAdd = { bg = '#eaf3f0' }, -- Approximated from #26966a20 on white
  DiffChange = { bg = '#e2eaf6' }, -- Approximated from #7098d43f on white
  DiffDelete = { bg = '#faebeb' }, -- Approximated from #e3818120 on white
  DiffText = { bg = '#d4e6e0' }, -- Approximated from #26966a40 on white

  NvimTreeNormal = { fg = colors.fg, bg = colors.ui_bg },
  NvimTreeVertSplit = { fg = colors.ui_bg, bg = colors.ui_bg },
  TelescopeNormal = { bg = colors.ui_bg },
  TelescopeBorder = { fg = colors.ui_border, bg = colors.ui_bg },
  TelescopePromptNormal = { bg = colors.bg },
}

for group, settings in pairs(highlights) do
  set_hl(group, settings)
end

print("Moegi Light theme loaded! (Opaque Version)")
