-- init file tend to packadd basic plugins and load private plugin's config

-- if impatient was installed then use it speed up load plugins
local success, impatient = pcall(function() return require'impatient' end)
if success then
  impatient.enable_profile() 		-- view profiling data
end


-- if plugin manager isn't installed then install it
local plugin_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local git_path = 'https://github.com/wbthomason/packer.nvim'
-- local plugin_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
-- local git_path = 'https://github.com/savq/paq-nvim.git'


require'boostrap'.install(plugin_path, git_path)
require('boat').SetSail()
--require('load_module')
