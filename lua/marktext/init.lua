return
{
	open = function(file)
		if not file or file == '' then
			file = vim.fn.expand '%'
		end

		os.execute('marktext '..file..' &')
	end,
	snippet_mode = require 'marktext/snippet_mode',
}
