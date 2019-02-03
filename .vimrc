call plug#begin('~/.vim/plugged')
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'
Plug 'palantir/tslint'
Plug 'isruslan/vim-es6'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'ajh17/vimcompletesme'
call plug#end()

syntax enable
filetype plugin indent on

"From Francis. Thanks Francis!
set nu
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set ruler
set cm=blowfish
set tabpagemax=50

set smarttab
set smartindent

set colorcolumn=80

syntax on

set background=dark
set noerrorbells

"FZF
set rtp+=/usr/local/opt/fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~35%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"SiverSearch
let g:ackprg = 'ag --nogroup --nocolor --column'

"NeoComplcache Autocomplete functionality
let g:neocomplcache_enable_at_startup = 1

"JSX Syntax for normal .js files
let g:jsx_ext_required = 1

highlight clear SignColumn

nnoremap <tab> >>
nnoremap <S-tab> <<
vnoremap <tab> >gv
vnoremap <S-tab> <gv
"ARROW KEY TAB NAVIGATION
nnoremap [1;6D :tabp
nnoremap [1;6C :tabn
"Open
nnoremap <C-o> :tabfind 
"Open new tab in current directory
nnoremap <C-t> :tabf %:p:h
"Comments | Best usage for <C-c> to start and then to end with <C-l>
nnoremap <C-c> O/** *  */kA
nnoremap <C-l> o*  
nnoremap ç i<!--  -->hhhi
"Other
"Get the current file name and directory
nnoremap <C-?> :echo bufname("%")
nnoremap <C-p> :!php -nl %
"Keymapping for Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Insert mode
inoremap <C-d> :DiffSaved
inoremap <C-o> :tabfind 
"inoremap <C-t> :tabf %:p:h
inoremap <C-c> O/** *  */kA
inoremap <C-l> *  
"Firefox VimTab Navigation
nnoremap <C-S-tab> :tabprevious
nnoremap <C-tab> :tabnext
inoremap <C-S-tab> <Esc>:tabprevious
inoremap <C-tab> <Esc>:tabnext

"Map Space to the leader
map <Space> <leader>

"Open and Close NerdTree
nmap <leader>q :NERDTreeToggle<CR>

"autocmd BufWritePre *.{java,css,scss,php,js} :call TrimWhiteSpace()

"Highlight White Spaces at the end of the line while you are typing
match WarningMsg /\s\+$/

"Split New Panels more like Sublime Text 2
set splitbelow
set splitright

"Automatic bracket settings
"autocmd FileType javascript,php,java,scss,sass,css :inoremap ( ()<Esc>i
"autocmd FileType javascript,php,java,scss,sass,css :inoremap [ []<Esc>:let leavechar="]"<CR>i
"autocmd FileType php,java,scss,sass,css :inoremap { {<CR><BS>}<ESC>ko

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Lightline
let g:lightline = {
\ 'colorscheme': 'powerline',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
