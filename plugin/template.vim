let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

if exists('g:loaded_template')
  finish
endif

let g:loaded_template = 1

" command! Template call template#template()

let &cpo = s:save_cpo
unlet s:save_cpo
