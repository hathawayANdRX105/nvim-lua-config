local M = {}
require'util.load_fn'


M.SetupGear = function(module)
    if type(module) == 'table' then
     module.setup()
    end
end
-- load require module files
M.Load = function(modules)
	for i = 1, #modules do
		local module = require(modules[i])
    M.SetupGear(module)
	end
end

-- M.LoadedHooks = {}
--
-- M.DragHook = function(gear, config)
--   -- check out the gear whether had been loaded
--   local success , _ = pcall(function ()
--     return M.LoadedHooks[gear]
--   end)
--   if success then return end
--
--
--   vim.cmd("packadd! "..gear)
--   if config ~= nil then
--   M.SetupGear(config)
--   end
--
--   M.LoadedHooks[gear] = true
-- end
--
-- M.SetBait = function(ft, gear, config)
--   local hook = {}
--   table.insert(hook, "VimEnter ")
--   table.insert(hook, "*."..ft.." ")
--   table.insert(hook, ":lua require'boat'.SetBait('")
--   table.insert(hook, gear)
--   table.insert(hook, "', '")
--   table.insert(hook, config)
--   table.insert(hook, "')")
--   return table.concat(hook)
-- end
--
-- M.SetHook = function ()
--   local lazy_hook = {}
--   local hooks = {
--     { ft="go", gear="go.nvim", config="config.go_env" },
--     { ft="norg", gear="neorg", config="config.neorg" },
--   }
--
--   table.insert(lazy_hook, "augroup lazy_hook ")
--   table.insert(lazy_hook, "au!")
--   for i = 1, #hooks do
--     local ft = hooks[i]['ft']
--     local gear = hooks[i]['gear']
--     local config = hooks[i]['config']
--     table.insert(lazy_hook, M.SetBait(ft, gear, config))
--   end
--
--   table.insert(lazy_hook, "augroup END")
--
--   local augroup = table.concat(lazy_hook, "\n")
--   vim.cmd(augroup)
-- end

M.SetSail = function()
  -- vim.cmd[[packadd paq-nvim]]
  vim.cmd[[packadd packer.nvim]]

  -- local paq = require'paq'
  -- local plugins = require'plugins'

  -- paq(plugins)
  --paq.install()

  require"plugins"

  local gears = require'common.modules'.auto_modules
  M.Load(gears)
end

return M
