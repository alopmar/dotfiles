filetype off
set nocompatible
filetype plugin indent on
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
syntax on
set wrap
set ruler
set number
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< 
syntax enable
set background=dark
colorscheme solarized

"{{{Vundle settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'edsono/vim-matchit'
Bundle 'ervandew/supertab'
Bundle "Townk/vim-autoclose"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-ragtag"
Bundle "tpope/vim-surround"
Bundle "kevinw/pyflakes-vim"
Bundle "applescript.vim"
Bundle "derekwyatt/vim-scala"
Bundle "scrooloose/nerdcommenter"
Bundle "sjl/gundo.vim"
"}}}

"{{{ Gundo settings
nmap <leader>U :GundoToggle<cr>
let g:gundo_preview_bottom = 1
let g:gundo_preview_height = 10
let g:gundo_width = 30
"}}}

set laststatus=2
let g:syntastic_python_checkers=['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F

function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call HandleURI()<CR>

cmap w!! w !sudo tee > /dev/null %

match Todo /\s\+$/

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python,puppet autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
