function! exec#docker#get_containers() abort
  let l:response = exec#http#get('http://localhost/containers/json', {'all': 1})
  if l:response.status !=# 200
    echoerr "Could not get containers from docker api server"
    return []
  else
    return json_decode(response.content)
  endif
endfunction
