local util = require('util')

vim.opt.list = true
-- vim.opt.listchars:append("space:┈")
vim.opt.listchars:append("eol:↵")

-- do not show indent in those filetype list
vim.g.indent_blankline_filetype_exclude = { 'NvimTree', 'alpha', 'Outline', 'packer', }

local indent_blankline = util.check_status("indent_blankline")
indent_blankline.setup {
    --space_char_blankline = "┈",
    show_current_context = true,
    show_current_context_start = true,
}
