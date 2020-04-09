let s:save_cpo = &cpo
set cpo&vim

function! exec#select_containers(lead) abort
  let l:container_names = []
  let l:containers = exec#docker#get_containers()
  for container in l:containers
    if stridx(container.Names[0][1:], a:lead) != -1
      call add(container_names, container.Names[0][1:])
    endif
  endfor
  return l:container_names
endfunction

function! exec#complete_containers(lead, cmdline, curpos) abort
  return exec#select_containers(a:lead)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
