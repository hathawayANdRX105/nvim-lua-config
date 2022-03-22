local function install(path, git_path)
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system {
      'git',
      'clone',
      '--depth=1',
      git_path,
      path
    }
  end
end

return { install = install }
