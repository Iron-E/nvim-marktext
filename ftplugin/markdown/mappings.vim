" Mappings for this plugin.
if !hasmapto('<leader>t')
	nmap <leader>t <Cmd>call marktext#snippet_mode()<CR>
endif

if !hasmapto('<leader>T')
	nmap <leader>T <Cmd>call marktext#table_mode()<CR>
endif
