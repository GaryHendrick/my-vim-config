" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
let python_highlight_all=1
syntax on

set nocompatible
set modeline
set background=dark
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set textwidth=110
set number
set encoding=utf-8
set paste
set path=$PWD/**

" enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

let g:pymode_run = 1
let g:pymode_run_bind = '<A>r'
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'
let g:SimpylFold_docstring_preview=1


" Python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' is os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Define the scheme to use based upon the VIM mode
" and set up the ability to switch between themes
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif
call togglebg#map("<F5>")


" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Valloric/YouCompleteMe'
Bundle 'othree/xml.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'

" Add all your pluins here (note older versions of Vundle used Bundle instead
" of Plugin)

 
" All of your plugins must be added before the following line call
call vundle#end() " required

" YouCompleteMe Configuration, invoked after vundle loading.  The fact is that this system will work with
" or without the ycm_confirm_extra_conf_globlist parameters, however you will continously be prompted to
" permit the ycm_extra_conf.py file to be loaded.  Read the following config parameters to learn a thing
" or two.
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
let g:ycm_extra_conf_globlist = ['~/catkin_ws/*']

" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
" flag extraneous whitespace
au BufRead,BufNewFile *.py,*pyw,*.c,*.h,*.cpp,*.hpp match BadWhitespace /\s\+$/


:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>
