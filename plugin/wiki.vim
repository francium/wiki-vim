augroup MpvAudioWikiMappings
    autocmd!
    " echom "Setting up autocmd's"
    autocmd BufEnter */music/*.md,music/*.md nnoremap <buffer> <cr> :MpvPlayAudio<cr>
    " TODO: The BufLeave is running twice
    autocmd BufLeave */music/*.md,music/*.md silent! nunmap <buffer> <cr>
augroup END

command! WikiPush !wiki -c
