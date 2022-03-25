local M = {}

M.flag = false;


M.SwitchMark = function()
  local mark = "mark "
  if M.flag then
    mark = mark.."5"
  else
    mark = mark.."6"
  end

  vim.api.nvim_exec(mark, false)
  M.flag = not M.flag
end

M.GotoLastBuffer = function()
  local mark_goto = "normal `"
  if M.flag then
    mark_goto = mark_goto.."5"
  else
    mark_goto = mark_goto.."6"
  end

  vim.api.nvim_exec(mark_goto, false)
end

M.setup = function ()
  vim.cmd[[au BufLeave * execute"lua require'util.last_file'.SwitchMark()"]]
  vim.cmd[[command! GotoLastBuffer execute"lua require'util.last_file'.GotoLastBuffer()"]]
end

return M
