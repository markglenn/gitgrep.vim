let g:gitgrepprg = "git\\ grep\\ -H\\ -n\\ --no-color"

function! GitGrep(args)
  let grepprg_backup = &grepprg
  exec "set grepprg=" . g:gitgrepprg
  execute "silent! grep " . a:args
  botright copen
  let &grepprg = grepprg_backup
  exec "redraw!"
endfunction

command! -nargs=* -complete=file GitGrep call GitGrep(<q-args>)
