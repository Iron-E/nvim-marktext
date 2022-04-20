vim.api.nvim_buf_create_user_command(0, 'Marktext', function(tbl) require('marktext').open(tbl.args) end, {complete = 'file', nargs = '?'})
vim.api.nvim_buf_create_user_command(0, 'MarktextMode', function() require('marktext').snippet_mode() end, {})
