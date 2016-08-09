" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set modeline
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
set number

let g:pymode_run = 1
let g:pymode_run_bind = '<A>r'
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'

color happy_hacking
