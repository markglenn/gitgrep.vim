let g:gitgrepprg = "git\\ --no-pager\\ grep\\ -H\\ -n\\ --no-color"

function! GitGrep(args)
  let grepprg = &grepprg
  let grepformat = &grepformat

  try
    let &grepformat = '%f:%l:%m'
    exe "set grepprg=" . g:gitgrepprg

    exe "silent! grep! " . shellescape(a:args)
    botright copen
    execute "redraw!"
  finally
    let &grepprg = grepprg
    let &grepformat = grepformat
  endtry
endfunction

command! -nargs=* -complete=file GitGrep call GitGrep(<q-args>)
