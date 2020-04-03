let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

if exists('g:loaded_attach_docker')
  finish
endif

let g:loaded_attach_docker = 1

if has("nvim")
  let s:term_cmd = ':sp|:term'
else
  let s:term_cmd = ':to :term'
endif

exe 'command!' '-nargs=+' '-complete=customlist,exec#complete_containers'
      \ get(g:, 'docker_exec_command', 'ExecContainer')
      \ s:term_cmd 'docker' 'exec' '-it' '<f-args>'
      \ get(g:, 'docker_shell', 'bash')

let &cpo = s:save_cpo
unlet s:save_cpo
