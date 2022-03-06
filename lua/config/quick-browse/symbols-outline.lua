local util = require('util')
local icons = require('config.icons')
local symbols = {
		File 		= { icon = icons.documents.File, 	hl = "TSURI" },

		Package 	= { icon = icons.ui.Package, 		hl = "TSNamespace" },

		module		= { icon = icons.kind.Module, 		hl = "TSNamespace" },
		Namespace 	= { icon = icons.kind.Namespace, 	hl = "TSNamespace" },
		Class 		= { icon = icons.kind.Class, 		hl = "TSType" },
		Method 		= { icon = icons.kind.Method, 		hl = "TSMethod" },
		Property 	= { icon = icons.kind.Property, 	hl = "TSMethod" },
		Field 		= { icon = icons.kind.Field, 		hl = "TSField" },
		Constructor 	= { icon = icons.kind.Constructor, 	hl = "TSConstructor" },
		Enum 		= { icon = icons.kind.Enum, 		hl = "TSType" },
		Interface 	= { icon = icons.kind.Interface, 	hl = "TSType" },
		Function 	= { icon = icons.kind.Function, 	hl = "TSFunction" },
		Variable 	= { icon = icons.kind.Variable, 	hl = "TSConstant" },
		Constant 	= { icon = icons.kind.Constant, 	hl = "TSConstant" },
		Key 		= { icon = icons.kind.KeyWord, 		hl = "TSType" },
		Null 		= { icon = icons.kind.Null, 		hl = "TSType" },
		EnumMember	= { icon = icons.kind.EnumMember, 	hl = "TSField" },
		Struct 		= { icon = icons.kind.Struct, 		hl = "TSType" },
		Event 		= { icon = icons.kind.Event, 		hl = "TSType" },
		Operator 	= { icon = icons.kind.Operator, 	hl = "TSOperator" },
		TypeParameter 	= { icon = icons.kind.TypeParameter, 	hl = "TSParameter" },

		String 		= { icon = icons.type.String, 		hl = "TSString" },
		Number 		= { icon = icons.type.Number, 		hl = "TSNumber" },
		Boolean 	= { icon = icons.type.Boolean, 		hl = "TSBoolean" },
		Array 		= { icon = icons.type.Array, 		hl = "TSConstant" },
		Object 		= { icon = icons.type.Object, 		hl = "TSType" },
	    }

local global_setup = {
	symbols_outline = {
	    highlight_hovered_item = true,
	    show_guides = true,
	    auto_preview = true,
	    position = 'right',
	    relative_width = true,
	    width = 25,
	    auto_close = false,
	    show_numbers = false,
	    show_relative_numbers = false,
	    show_symbol_details = true,
	    preview_bg_highlight = 'Pmenu',
	    keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = {"<Esc>", "q"},
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
	    },
	    lsp_blacklist = {},
	    symbol_blacklist = {},
	    symbols = symbols,
	}
}

util.load_global_set(global_setup)
