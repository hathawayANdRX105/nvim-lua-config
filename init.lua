local impatient = require('impatient') 	-- speed up import module before import any other module 
impatient.enable_profile() 		-- view profiling data

require('load_module')
