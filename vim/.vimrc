set nocompatible	"better safe then sorry, but not neccesary
filetype plugin indent on

set showcmd		"show what is typed as command
set showmode		"show mode

set encoding=utf-8      "Set default encoding
set wrap        	 "wrap long lines to fit in the window
set cursorline		"highlight current line
set scrolloff=5		"always keep 5 lines above and below cursor

inoremap jk <Esc>	"remap escape key

set backspace=indent,eol,start	 "make backspace work like in most other programs in Insert mode

set laststatus=2	  "always display status line
set number      	 "Show line numbers

set noerrorbells	 "No beeps
set visualbell  	 "Flash screen on error

set autoindent
set shiftwidth=3	"instead of 8 character tab
set softtabstop=3

set incsearch		"search as characters are entered
set hlsearch		"highlight matches

set mouse=a		"enable mouse support

"netrw file explorer, instead plugin nerdtree
":Sexplore - open in horizontal split
":Vexplore - open in vertical split -> Preferred!
"
let g:netrw_liststyle = 3  "preferred view in netrw
let g:netrw_banner = 0	   "remove banner in netrw
let g:netrw_winsize = 25   "set to 25% width of page
let g:netrw_browse_split = 2  "open file in a new vertical split
let g:netrw_altv = 1 

"launcg netrw when enter vim, using VimEnter autocommand
"augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
"augroup END

"set color scheme dracula (from package)
packadd! dracula
syntax on    		 "enable syntax highlighting
color dracula


