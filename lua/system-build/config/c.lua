return{
      default_task = 'build_and_run',
      tasks = {
        build = {
          command = 'gcc main.c -o main',
          output = 'quickfix', -- Where to show output of the
          opts = { -- Options for output (currently, there's only
            open_on_run = 'always',
          },
        },
        run = { -- You can specify as many tasks as you want per
          -- filetype
          command = './main',
          output = 'quickfix',
        },
        build_and_run = { -- Setting the type to lua means the command
          command = function()
            require('yabs'):run_task('build', {
              on_exit = function(Job, exit_code)
                if exit_code == 0 then
                  require('yabs').languages.c:run_task('run')
                end
              end,
            })
          end,
          type = 'lua',
        },
      },
    }
