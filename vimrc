" Configuration file for vim
set runtimepath=~/.vim,/usr/share/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vimcurrent,/usr/share/vim/vimfiles/after,/usr/share/vim/addons/after,~/.vim/after
call pathogen#runtime_append_all_bundles() 
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

set paste
" Now we set some defaults for the editor
set expandtab  "expand tab to spaces
set smartindent		" always set autoindenting on
set linebreak		" Don't wrap words by default
"set textwidth=2		" Don't wrap lines by default
set tabstop=4		"number of spaces a <Tab> in the text stands for

set backup		" Don't keep a backup file
set backupdir=~/vimbackup
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set shiftwidth=4
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
set t_Co=16
set t_Sf=[3%dm
set t_Sb=[4%dm
endif

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype on
 filetype plugin indent on

endif " has ("autocmd")

" Some Debian-specific things
if has("autocmd")
  augroup filetype
    au BufRead reportbug.*		set ft=mail
    au BufRead reportbug-*		set ft=mail
  augroup END
endif

" Set paper size from /etc/papersize if available (Debian-specific)
if filereadable("/etc/papersize")
  try
    let s:shellbak = &shell
    let &shell="/bin/sh"
    let s:papersize = matchstr(system("cat /etc/papersize"), "\\p*")
    let &shell=s:shellbak
    if strlen(s:papersize)
      let &printoptions = "paper:" . s:papersize
    endif
  catch /^Vim\%((\a\+)\)\=:E145/
  endtry
endif

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

inoremap <Nul> <C-x><C-o>

map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

set cursorline

map <F2> :NERDTreeToggle<CR>
