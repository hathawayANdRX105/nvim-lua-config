require'util.load_fn'

local global_config = {
  vim_markdown_folding_style_pythonic = 1,
  vim_markdown_override_foldtext = 0,
  vim_markdown_folding_level = 6,
  vim_markdown_toc_autofit = 1,
  vim_markdown_math = 1,
  vim_markdown_autowrite = 1,
  vim_markdown_new_list_item_indent = 2,

  -- preview settings
  mkdp_auto_close = 0,
}

Load_global_set(global_config)

local augroup = {}
table.insert(augroup, "augroup markdown_mode")
table.insert(augroup, "au!")
table.insert(augroup, "au filetype markdown nnoremap ;f :TableFormat<cr>")
table.insert(augroup, "au filetype markdown nnoremap <M-Left> :HeaderDecrease<cr>")
table.insert(augroup, "au filetype markdown nnoremap <M-Right> :HeaderIncrease<cr>")
table.insert(augroup, "au filetype markdown nnoremap ;T :Toch<cr>")
table.insert(augroup, "au filetype markdown nnoremap ;r :TakeNode<cr>")
-- table.insert(augroup, "au! BufNewFile,BufFilePre,BufRead *.md set syntax=markdown.pandoc")
table.insert(augroup, "augroup END")

local autocmd = table.concat(augroup, '\n')
vim.cmd(autocmd)

-- markdown preview action
vim.cmd[[command! TakeNote execute"lua require'util.toggle'.TakeNote()"]]
