" Copyright (C) 2013-2018  Christopher J. Howard
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

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/vinarise.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/a.vim'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
call plug#end()

" Use UTF-8 encoding
set encoding=utf-8

" Disable backup files
set nobackup
set nowritebackup
set noswapfile

" Configure indentation
filetype indent off
set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent
set nosmartindent

" Configure navigation
set ruler
set scrolloff=5
set history=256
set undolevels=1024
set wildmenu
set number

" Line wrap
set wrap
nnoremap j gj
nnoremap k gk

" Disable alerts
set noerrorbells
set visualbell
set t_vb=

" Disable escape keys
set noesckeys

" Autocorrect :W -> :w
command! W w

" Toggle NERDTree and Tagbar
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>

" Quick tab navigation
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" Set colortheme
set t_Co=256
let base16colorspace=256
color base16-google-dark

" GVim
set guioptions-=m " Remove menu bar
set guioptions-=T " Remove toolbar
set guioptions-=r " Remove right-hand scroll bar
set guioptions-=L " Remove left-hand scroll bar
