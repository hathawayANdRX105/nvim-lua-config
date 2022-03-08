-- set option
function Load_global_set(config)
	for key, value in pairs(config) do
		vim.g[key]=value
	end
end

-- set option
function Load_set(config)
	for key, value in pairs(config) do
		vim.o[key]=value
	end
end

-- load keymappings with lua list
-- key={mode='n', key='<leader>ff', map=':Files', opt={noremap=true, silent=true}}
function Load_keymap(keymap_list)
	local keymap = vim.api.nvim_set_keymap

	for i = 1, #keymap_list do
		local key = keymap_list[i]
		keymap(key['mode'], key['key'], key['map'], key['opt'])
	end
end


-- load require module files
function Load_module(modules)
	for i = 1, #modules do
		require(modules[i])
	end
end

-- load cmd
function Load_cmd(cmds)
	for i = 1, #cmds do
		vim.cmd(cmds[i])
	end
end

-- check loading modules status

function Check_status(module_name)
	local status_ok, module = pcall(require, module_name)
	if not status_ok then
	  return
	else
	  return module
	end
end



