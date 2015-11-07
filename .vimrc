execute pathogen#infect()
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

" Custom
set background=dark
set noerrorbells
set visualbell
colorscheme solarized

"Powerline Fonts | Airline Configurations
"that bottom toolbar that shows up with all the stats
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1

"NeoComplcache Autocomplete functionality
let g:neocomplcache_enable_at_startup=1

function! s:DiffWithSaved() 
    let filetype=&ft 
    diffthis 
    vnew | r # | normal!  1Gdd 
    diffthis 
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype 
endfunction

highlight clear SignColumn

com! DiffSaved call s:DiffWithSaved() 

nnoremap <C-d> :DiffSaved

"PHP Documenator
inoremap <C-b> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-b> :call PhpDocSingle()<CR>
vnoremap <C-b> :call PhpDocRange()<CR>

"Allow for Visual mode to move blocks like a GUI
vnoremap <tab> >gv
vnoremap <S-tab> <gv

nnoremap <tab> >>
nnoremap <S-tab> <<
"ARROW KEY TAB NAVIGATION
nnoremap [1;6D :tabp
nnoremap [1;6C :tabn
"Open
nnoremap <C-o> :tabfind 
"Open new tab in current directory
nnoremap <C-t> :tabf %:p:h
"Comments | Best usage for <C-c> to start and then to end with <C-l>
"nnoremap <C-c> O/** *  */kA
"nnoremap <C-l> o*  
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
inoremap [1;6D :tabp
inoremap [1;6C :tabn
inoremap <C-o> :tabfind 
inoremap <C-t> :tabf %:p:h
inoremap <C-c> O/** *  */kA
inoremap <C-l> *  

"Trim Whitespaces from the end of lines
function! TrimWhiteSpace()
    normal mz
    :%s/\s\+$//e
    normal `z
:endfunction

autocmd BufWritePre *.{java,css,scss,php,js} :call TrimWhiteSpace()

"Change spacing according to filetype
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType coffeescript setlocal shiftwidth=2 tabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2

"Highlight White Spaces at the end of the line while you are typing
match WarningMsg /\s\+$/

"Split New Panels more like Sublime Text 2
set splitbelow
set splitright

"Automatic bracket settings
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>:let leavechar="]"<CR>i
:inoremap { {<CR><BS>}<ESC>ko

let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 3
