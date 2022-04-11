local M = {}

M.TreeTrigger = false
M.TreeToggle = function()
  if M.TreeTrigger then
    require'bufferline.state'.set_offset(0)
    require'nvim-tree'.toggle()
    M.TreeTrigger = false
  else
    require'bufferline.state'.set_offset(31, 'FileTree')
    require'nvim-tree'.toggle()
    M.TreeTrigger = true
  end
end

M.QfToggle = function()
  if vim.bo.filetype == "qf" then
    vim.cmd([[quit]])
  else
    vim.cmd([[copen 12]])
  end
end

M.TakeNote = function()
  vim.cmd[[set filetype=markdown]]
  vim.cmd[[set syntax=markdown]]

  vim.cmd[[MarkdownPreview]]

  vim.cmd[[set syntax=markdown.pandoc]]
end

return M
