syntax enable
syntax on
" solarized if installed
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" Tabs
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set fileformat=unix
set number

let mapleader = ","

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

nmap <leader>w :%s/\s\+$//<CR>

set nocompatible "makes vim more compatible with vi ie. certain keybindings and options are set to resemble vi
set ls=2 "show a status line even when only one window is shown
set ruler "show line number on status line 
set history=50 "set edit history to 50
"allows backspace to delete over indents and lines
set backspace=indent,eol,start
set bg=light "sets background to light color if available
set backup "enable backups
set backupdir=~/.backup "put backups in ~/.backup directory
set directory=~/.vimswap "put swp files in ~/.vimswap directory
