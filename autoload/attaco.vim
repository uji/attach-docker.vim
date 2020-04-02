let s:save_cpo = &cpo
set cpo&vim

function! attaco#get_containers() abort
  let l:response = attaco#http#get('http://localhost/containers/json', {'all': 1})
  if l:response.status !=# 200
    echoerr "Could not get containers from docker api server"
  else
    echo response.content
  endif
endfunction

function! attaco#complete_containers(...) abort
  attaco#get_containers()
  return ['aaa', 'bbb']
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
