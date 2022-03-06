vim.opt.completeopt = {"menu", "menuone", "noselect"} -- setting vim values

return {
  filetypes = { "go", "gomod" },
  settings = {
    gopls = {
      buildFlags =  {"-tags=integration"},
    }
  },
  completeUnimported = true,
  analyses = {unusedparams = true},
  staticcheck = true,
}
