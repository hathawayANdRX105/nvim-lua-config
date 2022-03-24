local dap_success, dap = pcall(require, 'dap')
local dapui_success, dapui = pcall(require, 'dapui')

if dap_success then
  local config = require'system-debug.config'
  dap.adapters.go = config.go.adapter
  dap.configurations.go = config.go.configuration

  vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
end

if dapui_success then
  dapui.setup()
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

-- dap key-mapping setting can be found in keymappings.lua
