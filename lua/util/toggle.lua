TreeTrigger = false
function TreeToggle()
	if TreeTrigger then
		require'bufferline.state'.set_offset(0)
		require'nvim-tree'.toggle()
		TreeTrigger = false
	else
		require'bufferline.state'.set_offset(31, 'FileTree')
		require'nvim-tree'.toggle()
		TreeTrigger = true
	end
end
return { TreeToggle = TreeToggle}
