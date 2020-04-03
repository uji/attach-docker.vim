let s:save_cpo = &cpo
set cpo&vim

function! exec#get_containers() abort
  let l:response = exec#http#get('http://localhost/containers/json', {'all': 1})
  if l:response.status !=# 200
    echoerr "Could not get containers from docker api server"
    return []
  else
    let l:containers = json_decode(response.content)
    let l:container_names = []
    for container in l:containers
      echo container.Names[0][1:]
      call add(container_names, container.Names[0][1:])
    endfor
    return l:container_names
  endif
endfunction

function! exec#complete_containers(...) abort
  return exec#get_containers()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
