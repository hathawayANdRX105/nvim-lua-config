-- set option
function load_global_set(config)
	for key, value in pairs(config) do
		vim.g[key]=value
	end
end

-- set option
function load_set(config)
	for key, value in pairs(config) do
		vim.o[key]=value
	end
end

-- load keymappings with lua list
-- key={mode='n', key='<leader>ff', map=':Files', opt={noremap=true, silent=true}}
function load_keymap(keymap_list)
	local keymap = vim.api.nvim_set_keymap

	for i = 1, #keymap_list do
		key = keymap_list[i]
		keymap(key['mode'], key['key'], key['map'], key['opt'])
	end
end


-- load require module files
function load_module(modules)
	for i = 1, #modules do
		require(modules[i])
	end
end


-- check loading modules status

function check_status(module_name)
	local status_ok, module = pcall(require, module_name)
	if not status_ok then
	  return
	else
	  return module
	end
end


return {
	check_status = check_status,
	load_module  = load_module,
	load_keymap  = load_keymap,
	load_global_set = load_global_set,
	load_set 	 = load_set,
}
