scriptencoding utf-8

command! -nargs=? -range VoiceroidTalk :<line1>,<line2>call s:talk(<f-args>)

function! s:talk(...) range abort
  " if argument is given talk it.
  if a:0 > 0
    let text = a:1
  else
    let lines = getline(a:firstline, a:lastline)
    let lines = map(lines, 'trim(v:val)')
    let text = join(lines, get(g:, 'voiceroid_linebreak_replacer', "\n"))
    let text = trim(text)
  endif

  try
    let rc = voiceroid#talk(text)
    if rc != 0
      echohl WarningMsg
      echoerr 'voiceroid#talk failed with ' . rc
      echohl None
    endif
  catch /^voiceroid: /
    echohl ErrorMsg
    echo 'ERROR: ' . v:exception
    echohl None
  endtry
endfunction
