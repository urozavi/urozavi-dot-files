" Default Configuration :
"
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2015 Mar 24
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif
"============================================= [ /end-default-configuration ]


" Vundle :
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/syntastic'
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'tpope/vim-markdown'
Plugin 'tyru/open-browser.vim'
Plugin 'dsawardekar/wordpress.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'kshenoy/vim-signature'
Plugin 'airblade/vim-gitgutter'
Plugin 'joonty/vdebug'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'othree/yajs.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sheerun/vim-polyglot'
Plugin 'bronson/vim-trailing-whitespace.git'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'Shougo/vimproc.vim'
Plugin 'm2mdas/phpcomplete-extended'
Plugin 'm2mdas/phpcomplete-extended-laravel'
Plugin 'jwalton512/vim-blade'
Plugin 'KabbAmine/zeavim.vim'

call vundle#end()
filetype plugin indent on
"================================================================ [ /vundle ]


" Wordpress.vim
let g:syntastic_wordpress_checkers = ['phpcs']
let g:syntastic_wordpress_phpcs_standard = "psr2"
let g:syntastic_wordpress_phpcs_standard_file = "phpcs.xml"
"========================================================= [ /wordpress.vim ]


" PhpcompleteExtended :
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:phpcomplete_index_composer_command = 'composer'
"================================================== [ /phpcomplete-extended ]


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


" Syntastic :
highlight SyntasticErrorSign ctermbg=none ctermfg=red
highlight SyntasticStyleError ctermbg=none
highlight SyntasticStyleWarning ctermbg=none
highlight SyntasticStyleWarningSign ctermbg=none ctermfg=yellow
highlight ColorColumn ctermbg=darkyellow

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy5'
let g:syntastic_php_phpcs_args = '--standard=PSR2'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_warning_symbol='⚠'
"============================================================= [ /syntastic ]


" Ultisnips :
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="œ"
"============================================================= [ /ultisnips ]


" SuperTab :
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabDefaultCompletionType = "context"
"============================================================= [ /super-tab ]


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
autocmd FileType php setlocal sw=4 st=4 ts=4
autocmd FileType apache setlocal ts=4 sw=4 sts=4 sr noet

let mapleader=" "

nnoremap ; :noh<cr>

set backup
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

inoremap <down> <Esc>:m .+1<CR>==gi
inoremap <up> <Esc>:m .-2<CR>==gi
nnoremap <down> :m .+1<CR>==
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
"====================================================== [ /my-configuration ]
