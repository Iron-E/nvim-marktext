" Open the marktext editor

if !exists(':Marktext')
	command! -nargs=? -complete=file Marktext silent call marktext#open(<q-args>)
endif

if !exists(':MarktextMode')
	command! MarktextMode call marktext#snippet_mode()
endif

if !exists(':TableMode')
	command! TableMode call marktext#table_mode()
endif
