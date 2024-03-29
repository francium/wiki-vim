augroup MpvAudioWikiMappings
    autocmd!
    " echom "Setting up autocmd's"
    autocmd BufEnter */music/*.md,music/*.md nnoremap <buffer> <cr> :MpvPlayAudio<cr>
    " TODO: The BufLeave is running twice
    autocmd BufLeave */music/*.md,music/*.md silent! nunmap <buffer> <cr>
augroup END

command! WikiPush !wiki -c
command! WikiLog call s:OpenLog()

function! s:OpenLog()
  let l:filename = glob("~/wiki/logs/") . strftime("%Y-%m-%d") . ".md"

  if s:FileExists(l:filename)
    execute "edit " . l:filename
    return
  endif

  execute "edit " . l:filename

  " Trim newline from command output
  let l:title_date = system("date '+%A, %B %d %Y'")[:-2]

  call setline(1, "# " . l:title_date)
  execute "normal! A\n\n\n"
  execute "write"
endfunction

function! s:FileExists(filename)
  " doesn't check readability
  return empty(glob(a:filename)) ? 0 : 1
  return l:exists
endfunction
