set termguicolors
set encoding=UTF-8
set hid                     " fix airline slow
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
"set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
""set clipboard=unnamedplus   " using system clipboard
filetype plugin on
""set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set re=1		    " force it to use an older regex engine to speed up syntax parsing.
let mapleader = "\<space>"  "change leader key to space
"Space + w to :w command
noremap <Leader>w :w<CR>
"Space + q to :q command
noremap <Leader>q :q<CR>
"Space + n to Toggle NerdTree
noremap <silent> <Leader>n :NERDTreeToggle <Enter>
"Space i to insert
nmap <Leader>i i

""Turn off direction key
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
""Remove trailing
autocmd FileType dart,vim,c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
"To display the status line always
:set laststatus=2
" 关闭自动折叠
set foldmethod=manual
set foldlevel=100
"disable softtabstop
set softtabstop=0 noexpandtab
set shiftwidth=2
"remove trailing on save
"autocmd BufWritePre * :%s/\s\+$//e"

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'psliwka/vim-smoothie'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
call plug#end()

let NERDTreeShowHidden=1
colorscheme gruvbox
set background=light
"Indent Line Plug Conf
let g:indentLine_color_term = 255
" GVim
let g:indentLine_color_gui = '#CCCCD6'
let g:indentLine_char = '┆'

let g:airline#extensions#tabline#enabled = 1
