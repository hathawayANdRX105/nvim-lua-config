local default_config = {
	number = true,
	termguicolors = true,

	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,

	encoding = "utf-8",
	textwidth = 80,

}

local default_settings = {
	"hi NeogitNotificationInfo guifg=#80ff95",
  "hi NeogitNotificationWarning guifg=#fff454",

	"hi def NeogitDiffAddHighlight guibg=#404040 guifg=#859900",
	"hi def NeogitDiffDeleteHighlight guibg=#404040 guifg=#dc322f",
	"hi def NeogitDiffContextHighlight guibg=#333333 guifg=#b2b2b2",
	"hi def NeogitHunkHeader guifg=#cccccc guibg=#404040",
	"hi def NeogitHunkHeaderHighlight guifg=#cccccc guibg=#4d4d4d",

	"set mouse+=a",

	"filetype indent on",
	"set autoindent",
	"set expandtab",
	"syntax on",
	"set showmatch",

	"set wrap",
  "set list",
	-- "set listchars=trail:.",

	"set hlsearch",
  "set ignorecase", -- 忽略大小写


  "set noswapfile",
	"set nobackup",
	"set noundofile",
}


return {
  setup = function ()
    Load_set(default_config)
    Load_cmd(default_settings)
  end
}
