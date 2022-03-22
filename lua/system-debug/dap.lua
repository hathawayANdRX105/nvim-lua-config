local dap = Check_status('dap')

vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})

-- local dap_configs = {
-- 	go = require('system-debug.config.go')
-- }
--
--
-- for dap_name, dap_config in pairs(dap_configs) do
-- 	dap.adapters[dap_name] = dap_config.adapters
-- 	dap.configurations[dap_name] = dap_config.configurations
-- end

dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/.code/vscode-go/dist/debugAdapter.js'};
}
dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = "${file}";
    dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
  },
}


--
-- dap key-mapping setting
vim.cmd[[nmap <silent> <localleader>dd :lua require('dap-go').debug_test()<CR>]]
local opt = { noremap=true, silent=true }
local keymap_list = {
  { mode='n', key = '<F8>' , map= "<cmd>lua require'dap'.step_over()<CR>"    , opt=opt },
  { mode='n', key = '<F7>' , map= "<cmd>lua require'dap'.step_into()<CR>"    , opt=opt },
  { mode='n', key = '<S-F8>' , map= "<cmd>lua require'dap'.step_out()<CR>"   , opt=opt },
  { mode='n', key = '<C-F8>' , map= "<cmd>lua require'dap'.toggle_breakpoint()<CR>"   , opt=opt },
  { mode='n', key = '<F9>' , map= "<cmd>lua require'dap'.continue()<CR>"   , opt=opt },
}

Load_keymap(keymap_list)
