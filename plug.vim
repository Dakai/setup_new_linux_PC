if has("nvim")
	let g:plug_home = stdpath('data') . '/plugged'
endif

set termguicolors
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
"Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'dakai/embark-theme-vim', { 'as': 'embark', 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
Plug 'mileszs/ack.vim'
Plug 'psliwka/vim-smoothie'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
"Terminal Integration
Plug 'nikvdp/neomux'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
"Plug 'pangloss/vim-javascript'
"Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
"Plug 'SirVer/ultisnips'
"Plug 'mlaursen/vim-react-snippets'
"Plug 'elzr/vim-json'
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'dart-lang/dart-vim-plugin'
" Plug 'skywind3000/asyncrun.vim'
"Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
"Plug 'hankchiutw/flutter-reload.vim'
"Plug 'mattn/emmet-vim'
"Plug 'leafgarland/typescript-vim'
"Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
""Highlighting queries in gql template strings
""Plug 'jparise/vim-graphql'
"Plug 'wesQ3/vim-windowswap'
""Plug 'flazz/vim-colorschemes'
"Plug 'mhinz/neovim-remote'
"Plug 'tribela/vim-transparent'
"Plug 'yuezk/vim-js'
"Plug 'maxmellon/vim-jsx-pretty'
"Plug 'honza/vim-snippets'
""https://getaround.tech/setting-up-vim-for-react/
""Syntax Highlight
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
""Syntax Highlight
"Plug 'w0rp/ale'
"Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
"Plug 'mlaursen/vim-react-snippets'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"Plug 'overcache/NeoSolarized'
"Plug 'joshdick/onedark.vim'
"Plug 'cocopon/iceberg.vim'
"Plug 'EdenEast/nightfox.nvim'
"Plug 'itchyny/lightline.vim'
"Plug 'bluz71/vim-nightfly-guicolors'
call plug#end()
"let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" coc config
let g:coc_global_extensions = [
			\	'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-styled-components',
			\ 'coc-json',
			"\ 'coc-emmet',
			"\ 'coc-css',
			"\ 'coc-flutter-tools'
			\ ]
" coc-prettier setup
"command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
" sync open file with NERDTree
" Check if NERDTree is open or active
"function! IsNERDTreeOpen()
"	 return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction
"" Call NERDTreeFind iff NERDTree is active, current window contains a
"" modifiable
"" " file, and we're not in vimdiff
"function! SyncTree()
"	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"		NERDTreeFind
"		wincmd p
"	endif
"endfunction
"" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

"colorscheme dracula
"color nightfox
"color iceberg
"colorscheme onedark
"colorscheme gruvbox
"set background=light
set background=dark
colorscheme embark
let g:embark_terminal_italics = 1

" let g:lightline = {
" \ 'colorscheme': 'embark',
" \ }
"colorscheme nightflylet
"g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

"Indent Line Plug Conf
let g:indentLine_color_term = 255
" GVim
let g:indentLine_color_gui = '#CCCCD6'
let g:indentLine_char = '┆'

"Map Snippet trigger to shift+tab
let g:UltiSnipsExpandTrigger="<s-tab>"
"lightline
"set noshowmode
"enable airline tab
let g:airline#extensions#tabline#enabled = 1
