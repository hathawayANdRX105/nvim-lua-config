return{
  go = {
    adapter = function ()
    end,
    configuration = {
      {
        type = 'go',
        name = 'Debug',
        request = 'launch',
        showLog = false,
        program = "${file}",
        dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
      },
    }
  }
}
    
    -- adapter = {
    --   type = 'executable';
    --   command = 'node';
    --   args = {os.getenv('HOME') .. '/.code/vscode-go/dist/debugAdapter.js'};
    -- },
