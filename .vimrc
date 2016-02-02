set nocompatible


" Vundle :
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'airblade/vim-gitgutter'
Plugin 'joonty/vdebug'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sheerun/vim-polyglot'
Plugin 'bronson/vim-trailing-whitespace.git'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'jwalton512/vim-blade'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'Chiel92/vim-autoformat'

call vundle#end()
filetype plugin indent on
"================================================================ [ /vundle ]


" PhpCsFixer :
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_php_path = "php"
let g:php_cs_fixer_verbose = 0
"========================================================== [ /php-cs-fixer ]


" CtrlP :
map <c-p>b :CtrlPBuffer<cr>
map <c-p>f :CtrlP<cr>
map <c-p>m :CtrlPMRUFiles<cr>
map <c-p>p :CtrlPMixed<cr>
"================================================================ [ /ctrl-p ]


" Tagbar :
let g:tagbar_autofocus = 1
nmap à :TagbarToggle<CR>
"================================================================ [ /tagbar ]


" NERDTree :
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

map é :NERDTreeToggle<CR>
"============================================================== [ /nerdtree ]


" My Configuration :
autocmd FileType text setlocal textwidth=78
autocmd FileType php setlocal sw=4 st=4 ts=4
autocmd FileType apache setlocal ts=4 sw=4 sts=4 sr noet
autocmd FileType vim setlocal ts=2 sw=2
autocmd FileType html setlocal ts=2 sw=2
autocmd FileType javascript setlocal ts=2 sw=2
autocmd FileType css setlocal ts=2 sw=2
autocmd FileType scss setlocal ts=2 sw=2
autocmd FileType sass setlocal ts=2 sw=2
autocmd FileType json setlocal ts=2 sw=2

let mapleader=" "

set backspace=indent,eol,start
set backupdir=/home/urozavi/.vim/backup
set binary
set bomb
set colorcolumn=78
set complete-=k complete+=k
set copyindent
set dictionary-=/usr/share/dict/american-english dictionary+=/usr/share/dict/american-english
set directory=/home/urozavi/.vim/tmp
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8
set linebreak
set scrolloff=7
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2
set wrap
set hidden
set esckeys
set ff=unix
set background=light
set ruler
set showcmd
set incsearch

if has("vms")
  set nobackup
else
  set backup
  set undofile
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap / /\v
nnoremap :g/ :g/\v
nnoremap :g// :g//
vnoremap / /\v

map <leader>fw :FixWhitespace<cr>

highlight CursorLineNr ctermfg=black cterm=bold
highlight LineNr ctermfg=DarkGrey cterm=none
highlight Search ctermbg=black ctermfg=white
highlight MatchParen ctermbg=none cterm=bold
highlight SyntasticWarningSign ctermbg=none ctermfg=cyan
highlight SyntasticWarning ctermbg=none
highlight ColorColumn ctermbg=black

inoremap <down> <Esc>:m .+1<CR>==gi
inoremap <up> <Esc>:m .-2<CR>==gi
nnoremap <down> :m .+1<CR>==
nnoremap ; :noh<cr>
nnoremap <up> :m .-2<CR>==
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

function! GitBranch()
  let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
  if branch != ''
    return substitute(branch, '\n', '', 'g')
  end
  return ''
endfunction

set statusline=(%{GitBranch()})\ %f\ b%n\ %M%R%H%W%Y\ %v:%B\ %=%l/%L\ %P\|%p%%

nnoremap <leader>fhp :set filetype=html syntax=php<cr><esc>ggvG=
"====================================================== [ /my-configuration ]
