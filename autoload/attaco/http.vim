let s:save_cpo = &cpo
set cpo&vim

let s:V = vital#attaco#new()
let s:HTTP = s:V.import('Web.HTTP')

function! attaco#http#get(url, param) abort
	return s:HTTP.request(a:url, {
				\ 'unixSocket': '/var/run/docker.sock',
				\ 'param': a:param
				\ })
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
