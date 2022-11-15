runtime ./plug.vim
runtime ./coc.vim
lua require('neoscroll').setup()
"Astro Setup
lua require'lspconfig'.astro.setup{}
"toogle rainbow_active
"let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

""emmet js zen code
""eg. %h2#tagline.hero-text => <h2 id="tagline" className="hero-text"></h2>
""<Tab - ,>
"let g:user_emmet_leader_key='<Tab>'
"let g:user_emmet_settings = {
"			\  'javascript.jsx' : {
"				\      'extends' : 'jsx',
"				\  },
"				\}
""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""
" Trigger configuration
" let g:UltiSnipsExpandTrigger="<C-l>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"
set encoding=UTF-8
""set runtimepath^=~/.vim runtimepath+=~/.vim/after
""let &packpath = &runtimepath
""source ~/.vimrc
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
""colorscheme iceberg
""let g:tokyonight_style = "storm"
""colorscheme tokyonight
""colorscheme tokyonight
""colorscheme nightfox
""colorscheme atom
""set termguicolors
""colorscheme onedark
""colorscheme NeoSolarized
""hi ColorColumn ctermbg=1
""hi ColorColumn guibg=#1E1E1E
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
""set clipboard=unnamedplus   " using system clipboard
filetype plugin on
""set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
"" set spell                 " enable spell check (may need to download language package)
"" set noswapfile            " disable creating swap file
"" set backupdir=~/.cache/vim " Directory to store backup files.
"set re=1	    " force it to use an older regex engine to speed up syntax parsing.
set re=0		    " force it to use the new regex engine to speed up syntax parsing.
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
"" "Treat long lines as break lines (useful when moving around in them)
"" "se swap之后，同物理行上线直接跳
""nnoremap k gk
""nnoremap gk k
""nnoremap j gj
""nnoremap gj j
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
"
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

""hi ColorColumn ctermbg=DarkGrey guibg=lightgrey
let g:airline_powerline_fonts = 1
""set guifont=FiraCode\ Nerd\ Font\ Mono:h11
""set guifont=Fira\ Mono\ for\ Powerline:h11
set guifont=JetBrainsMono\ Nerd\ Font:h11
let g:neovide_remember_window_size = v:true
""let g:neovide_transparency=0.8
let g:neovide_cursor_antialiasing=v:true
"
"remove trailing on save
autocmd BufWritePre * :%s/\s\+$//e"

""https://getaround.tech/setting-up-vim-for-react/
""yarn add --dev eslint babel-eslint eslint-plugin-react
""eslint --init
""yarn add --dev prettier eslint-config-prettier eslint-plugin-prettier
" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" Disable quote concealing in JSON files
let g:vim_json_conceal=0
" More space
res +5

"Clang CPP autoformat
nnoremap <Leader>f :<C-u>ClangFormat<CR>

"python 3
"let g:python3_host_prog="/usr/local/bin/python3"
"
let g:loaded_perl_provider = 0

"Enable Astro tree-sitter
autocmd BufRead,BufEnter *.astro set filetype=astro
"
let g:astro_typescript = 'enable'
let g:astro_stylus = 'enable'


