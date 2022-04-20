" SUMMARY: Open a file with Marktext.
" ARGS: The name of the file to open, or the current file by default.
function! marktext#open(...) abort
	call luaeval('require("marktext").open(_A)', get(a:000, 0, v:null))
endfunction

" SUMMARY: Enter `snippet_mode` for Marktext.
function! marktext#snippet_mode() abort
	lua require('marktext').snippet_mode()
endfunction
