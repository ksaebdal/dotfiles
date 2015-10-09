set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Plugin dependencies
Bundle 'kana/vim-textobj-user'
Bundle 'MarcWeber/vim-addon-mw-utils'

" Plugins with dependencies
Bundle 'garbas/vim-snipmate'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Plugin bundles
Bundle 'honza/vim-snippets'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-powerline'
Bundle 'benmills/vim-golang-alternate'
Bundle 'dgryski/vim-godef'
Bundle 'airblade/vim-gitgutter'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim'}

" Language bundles
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'slim-template/vim-slim'
Bundle 'sunaku/vim-ruby-minitest'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'leafo/moonscript-vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'groenewege/vim-less'
Bundle 'yosssi/vim-gold'

" Color scheme
Bundle 'nanotech/jellybeans.vim'

filetype plugin indent on

let mapleader=","

color jellybeans

set number
set hidden
set cursorline
set modelines=0
set shiftwidth=2
set clipboard=unnamed,unnamedplus
set synmaxcol=256
set ttyscroll=3
set encoding=utf-8 termencoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set ignorecase
set smartcase
set lazyredraw
set splitright
set scrolloff=4
set sidescroll=1
set sidescrolloff=1
set noshowmode
set list listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set omnifunc=syntaxcomplete#Complete
set autoread
set cryptmethod=blowfish

" Vim annoyances
" http://blog.sanctum.geek.nz/vim-annoyances/
vnoremap u y
nnoremap U <C-r>
nnoremap Q <nop>
nnoremap K <nop>
nnoremap J mzJ`z
nnoremap Y y$
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

nnoremap <silent> <F5> :set paste!<CR>

set shortmess+=I
set virtualedit=block

" Disable cursor line in insert mode
au InsertEnter * set nocursorline
au InsertLeave * set cursorline nopaste

" Change the cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

autocmd FileType * if &completefunc != '' | let &omnifunc=&completefunc | endif

" Automatic formatting
function! <SID>StripTrailingSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre *.rb,*.js,*.coffee :call <SID>StripTrailingSpace()
autocmd BufWritePre *.scss,*.haml,*.slim,*.html,*.builder :call <SID>StripTrailingSpace()
autocmd BufWritePre *.txt,*.md,*.markdown :call <SID>StripTrailingSpace()
                
au BufNewFile * set noeol

" No show command
autocmd VimEnter * set nosc

" No show command
autocmd VimEnter * set nosc

" Use space for :
noremap <space> :

" Quick ESC
imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" format the entire file
nmap <leader>fef ggVG=

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
noremap <tab> <c-w>w
noremap <S-tab> <c-w>W

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Resize buffers
if bufwinnr(1)
  nmap ö <C-W><<C-W><
  nmap ä <C-W>><C-W>>
  nmap Ä <C-W>-<C-W>-
  nmap Ö <C-W>+<C-W>+
endif

" Warn when painting outside the borders
"if exists('+colorcolumn')
"  set textwidth=80
"  let &colorcolumn=join(range(81,512),",")
"endif

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>

let NERDTreeMapOpenInTab='\t'
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg', 'reports']

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" CtrlP
nnoremap <silent> t :CtrlP<cr>
nnoremap <silent><leader>t :CtrlP<cr>
nnoremap <silent><leader>r :CtrlPMRUFiles<cr>
nnoremap <silent><leader>b :CtrlPBuffer<cr>

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 6
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_user_command = {
  \ 'types': { 1: ['.git/', 'cd %s && git ls-files'] },
  \ 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
  \ }

" Ack
nmap <leader>a :Ack! 
set shellpipe=>

" Go programming
set rtp+=/usr/local/Cellar/go/1.3/libexec/misc/vim
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

au BufRead,BufNewFile *.go set filetype=go nolist noexpandtab syntax=go
au BufWritePre *.go silent Fmt
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd FileType go compiler go
autocmd FileType go autocmd BufWritePre <buffer> Fmt

let g:godef_split=0
let g:godef_same_file_in_same_window=1
let g:gofmt_command='goimports'

" Sass
au BufRead,BufNewFile *.scss set filetype=sass

" Slim
au BufRead,BufNewFile *.slim set filetype=slim


" Disable terminal restore and clear screen when leaving vim
set t_ti= t_te=
au VimLeave * :!clear
