syntax enable
syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

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
