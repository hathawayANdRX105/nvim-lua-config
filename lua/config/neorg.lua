local neorg = Check_status('neorg')

neorg.setup{
	load = {
		['core.defaults'] = {},
		['core.norg.dirman'] = {
			config = {
				workspaces = {
					work = "$HOME/projects/work",
					home = "$HOME/projects/home",
				}
			}
		},
		['core.norg.concealer'] = {},
	}
}

