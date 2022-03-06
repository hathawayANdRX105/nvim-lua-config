require("util")
local autopairs = check_status("nvim-autopairs")

autopairs.setup({
	check_ts = true, 
})


-- If you want insert `(` after select function or method item
local cmp_autopairs = check_status('nvim-autopairs.completion.cmp')
local cmp = check_status('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
