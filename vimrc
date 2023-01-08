
syntax on

set noerrorbells
set tabstop=3 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
"set nowrap
set smartcase
set incsearch

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

let mapleader=","
let maplocalleader=","
inoremap <leader>, <C-x><C-o>
nnoremap <leader>, :MerlinLocate <ENTER>

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'vim-syntastic/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'davidhalter/jedi-vim'
call plug#end()

colorscheme gruvbox
set background=dark

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_quiet_messages = { "type": "style", "!level":"error" }

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
