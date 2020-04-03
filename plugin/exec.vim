let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

if exists('g:loaded_attach_docker')
  finish
endif

let g:loaded_attach_docker = 1

if has("nvim")
  command! -nargs=1 -complete=customlist,exec#complete_containers ExecContainer :sp|:term docker attach <f-args>
else
  command! -nargs=1 -complete=customlist,exec#complete_containers ExecContainer :to term docker attach <f-args>
endif

let &cpo = s:save_cpo
unlet s:save_cpo
