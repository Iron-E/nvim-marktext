" SUMMARY: Open a file with Marktext.
" ARGS: The name of the file to open, or the current file by default.
function! marktext#open(...) abort
	call luaeval('require("marktext").open(_A)', get(a:000, 0, v:null))
endfunction

" SUMMARY: Enter `snippet_mode` for Marktext.
function! marktext#snippet_mode() abort
	lua require('marktext').snippet_mode()
endfunction

" SUMMARY: Enter `table_mode` for appending, removing, or inserting columns in a table.
function! marktext#table_mode() abort
	lua require('marktext').table_mode()
endfunction
