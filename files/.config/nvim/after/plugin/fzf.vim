" FZF
let $FZF_DEFAULT_COMMAND="ag -g '' --path-to-ignore ~/.config/nvim/ignore"
let $FZF_DEFAULT_OPTS="--height 20% --ansi --layout=reverse --preview-window 'right:60%' --preview 'bat --color=always --style='changes' --theme='DarkNeon' {}'"

map <c-p> :FZF<cr>

" if has('nvim')
"   function! FloatingFZF()
"     let buf = nvim_create_buf(v:false, v:true)
"
"    " here be dragoons
"     let height = &lines
"     let width = float2nr(&columns - (&columns * 2 / 10))
"     let col = float2nr((&columns - width) / 2)
"     let col_offset = &columns / 10
"     let opts = {
"           \ 'relative': 'editor',
"           \ 'row': 1,
"           \ 'col': col + col_offset,
"           \ 'width': width * 2 / 1,
"           \ 'height': float2nr(height / 0.5)
"           \ }
"
"     let win = nvim_open_win(buf, v:true, opts)
"     call setwinvar(win, '&winhl', 'NormalFloat:TabLine')
"
"   " this is to remove all line numbers and so on from the window
"     " setlocal
"     "       \ buftype=nofile
"     "       \ nobuflisted
"     "       \ bufhidden=hide
"     "       \ nonumber
"     "       \ norelativenumber
"     "       \ signcolumn=no
"   endfunction
"
"   let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" else
"   let g:fzf_layout = { 'window': 'enew' }
" endif

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let winheight = winheight(0)
  " let winwidth = winwidth(0)
  let winwidth = winwidth(0) + winwidth(0)

  let width = float2nr(winwidth-(winwidth*2/10))

  let opts = {
        \ 'relative': 'editor',
        \ 'row': &lines - 3,
        \ 'col': float2nr((winwidth-width)/2),
        \ 'width': width,
        \ 'height': &lines - 3
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
