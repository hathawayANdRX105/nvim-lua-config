return {
      default_task = 'run',
      tasks = {
        build = {
          command = 'go build ./',
	  -- Where to show output of the
          -- command. Can be `buffer`,
          -- `consolation`, `echo`,
          -- `quickfix`, `terminal`, or `none`
          output = 'quickfix',
          opts = { -- Options for output (currently, there's only
            -- `open_on_run`, which defines the behavior
            -- for the quickfix list opening) (can be
            -- `never`, `always`, or `auto`, the default)
            open_on_run = 'always',
          },
        },
        run = { -- You can specify as many tasks as you want per
          -- filetype
          command = 'go run ./main.go',
          output = 'quickfix',
	  opts = { open_on_run = 'auto', }
        },
        build_and_run = { -- Setting the type to lua means the command
          -- is a lua function
          command = function()
            -- The following api can be used to run a task when a
            -- previous one finishes
            -- WARNING: this api is experimental and subject to
            -- changes
            require('yabs'):run_task('build', {
              -- Job here is a plenary.job object that represents
              -- the finished task, read more about it here:
              -- https://github.com/nvim-lua/plenary.nvim#plenaryjob
              on_exit = function(Job, exit_code)
                -- The parameters `Job` and `exit_code` are optional,
                -- you can omit extra arguments or
                -- skip some of them using _ for the name
                if exit_code == 0 then
                  require('yabs').languages.go:run_task('run')
                end
              end,
            })
          end,
          type = 'lua',
        },
      },
    }
