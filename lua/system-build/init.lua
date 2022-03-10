local yabs = Check_status('yabs')

local languages = {
	go = require'system-build.config.go',
	python = require'system-build.config.python',
	c = require'system-build.config.c',
}

yabs:setup({
  languages = languages,
  tasks = { -- Same values as `language.tasks`, but global
    build = {
      command = 'echo building project...',
      output = 'consolation',
    },
    run = {
      command = 'echo running project...',
      output = 'echo',
    },
    optional = {
      command = 'echo runs on condition',
      -- You can specify a condition which determines whether to enable a
      -- specific task
      -- It should be a function that returns boolean,
      -- not a boolean directly
      -- Here we use a helper from yabs that returns such function
      -- to check if the files exists
      condition = require('yabs.conditions').file_exists('filename.txt'),
    },
  },
  opts = { -- Same values as `language.opts`
    output_types = {
      quickfix = {
        open_on_run = 'always',
      },
    },
  },
})
