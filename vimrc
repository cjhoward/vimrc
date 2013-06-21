" Copyright (C) 2013  Chris Howard
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
" 
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
" 
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.

" No compatibility with vi
set nocompatible

" Find directories
let g:vim_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ') . "/vim"
let g:bundle_path = g:vim_path . "/bundle"

" Pathogen
filetype off
exe "source" . g:bundle_path . "/pathogen/autoload/pathogen.vim"
call pathogen#infect(g:bundle_path . "/{}")
call pathogen#helptags()
filetype plugin indent on

" Use UTF-8 encoding
set encoding=utf-8

" Disable backup files
set nobackup
set nowritebackup
set noswapfile

" Enable autoreload
set autoread
autocmd! bufwritepost .vimrc source ~/.vimrc

" Configure tabs
set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Configure navigation
set ruler
set scrolloff=5
set history=256
set undolevels=1024
set wildmenu
set nonumber

" Disable alerts
set noerrorbells
set visualbell
set t_vb=

" Set colors
syntax on
set hlsearch
colorscheme dog-day

" Set font
if has('gui_running')
	set guifont=Inconsolata:h14
endif

" Sets cursorline and cursorcolumn for the active window
augroup ActiveWindowCrosshair
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline nocursorcolumn
	autocmd WinLeave * setlocal nocursorline nocursorcolumn
augroup END

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable escape keys
set noesckeys

" Quick tab navigation
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" Switch window and maximize
map ,w :wincmd w <bar> wincmd <bar><CR>

" Opens a complementary C++ file
function! OpenComplement()
	if expand("%:e") == "cpp"
		exe "vsplit" fnameescape(expand("%:p:r:s?src?include?").".hpp")
	elseif expand("%:e") == "hpp"
		exe "vsplit" fnameescape(expand("%:p:r:s?include?src?").".cpp")
		wincmd x
	endif
endfunction

nmap ,o :call OpenComplement()<CR>
