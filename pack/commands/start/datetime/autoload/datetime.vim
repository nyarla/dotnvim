function! datetime#date()
  return strftime('%Y-%m-%d')
endfunction

function! datetime#datetime()
  return strftime('%Y-%m-%dT%H:%M:%S+09:00')
endfunction

function! datetime#weekday()
  return strftime('%a')
endfunction
