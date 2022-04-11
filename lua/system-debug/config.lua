return{
  go = {
    adapter = {
      type = 'executable',
      command = 'node',
      args = {os.getenv('HOME') .. '/.code/vscode-go/dist/debugAdapter.js'},
    },
    configuration = {
    {
        type = 'go',
        name = 'Debug',
        request = 'launch',
        program = "${file}",
        showLog = false,
        dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
      },
    {
        type = "go",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
        showLog = false,
        dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
      },
      -- works with go.mod packages and sub packages 
    {
        type = "go",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
        showLog = false,
        dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
      }
    }
  }
}
