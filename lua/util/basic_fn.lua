
function IsType(obj, check_type)
	return type(obj) == check_type
end

-- make sure input variable's type is table
function TableSize(table)
	if IsType(table, 'table') then
		local size = 0
		for _, _ in pairs(table) do
			size = size + 1
		end
		return size
	end

	return 0
end

function QfToggle()
	if vim.bo.filetype == "qf" then
		vim.cmd([[cclose]])
	else
		vim.cmd([[copen 12]])
	end
end

-- vim.cmd[[command! Toggle execute ':lua QfToggle()']]

