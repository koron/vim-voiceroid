scriptencoding utf-8

"let g:voiceroid_vrx_path = ''
"let g:voiceroid_vrx_who = ''

function! s:getVrxPath()
  let vrxpath = get(g:, 'voiceroid_vrx_path', '')
  if vrxpath == ''
    return ''
  endif
  if !executable(vrxpath)
    return ''
  endif
  return vrxpath
endfunction

function! s:getVrxWho()
  let vrxwho = get(g:, 'voiceroid_vrx_who', '')
  if vrxwho == ''
    return ''
  endif
  return vrxwho . '>'
endfunction

function! voiceroid#talk(text)
  let vrxpath = s:getVrxPath()
  if vrxpath == ''
    throw 'voiceroid: vrx.exe (民安★TALK) not found'
  endif
  if strlen(a:text) == 0
    throw 'voiceroid: need more texts to talk'
  endif
  " TODO: seprate text into chunks which length is under 8000
  let text = s:getVrxWho() . a:text
  let escaped_text = substitute(text, '"', '""', 'g')
  call system(vrxpath . ' "' . escaped_text . '"')
  return v:shell_error
endfunction
