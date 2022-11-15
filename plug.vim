if has("nvim")
	let g:plug_home = stdpath('data') . '/plugged'
endif
if (has("termguicolors"))
  set termguicolors
endif

call plug#begin()
"Astro
Plug 'wuelnerdotexe/vim-astro'
Plug 'wavded/vim-stylus'
Plug 'neovim/nvim-lspconfig'
"Plug 'virchau13/tree-sitter-astro'
Plug 'wfxr/minimap.vim'
"Plug 'gorbit99/codewindow.nvim'
"Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'preservim/map.vim'nerdtree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'jcharum/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
"Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'dakai/embark-theme-vim', { 'as': 'embark', 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
"Terminal Integration
Plug 'nikvdp/neomux'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
"Plug 'psliwka/vim-smoothie'
Plug 'karb94/neoscroll.nvim'
Plug 'edkolev/tmuxline.vim'
"Js syntax highlighting
Plug 'pangloss/vim-javascript'
"Plug 'jonstoler/werewolf.vim'
"Plug 'tribela/vim-transparent'
"CPP env
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-syntastic/syntastic'
Plug 'rhysd/vim-clang-format'
"CPP env end
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"Jsx syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'
Plug 'xiyaowong/nvim-transparent'
"fcitx5 in neovim
"Plug 'tonyfettes/fcitx5.nvim'
"Plug 'gen740/SmoothCursor.nvim'
"Transparent
"Plug 'miyakogi/seiya.vim'
"Js syntax highlighting
"Plug 'yuezk/vim-js'
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
"Plug 'honza/vim-snippets'
""https://getaround.tech/setting-up-vim-for-react/
""Syntax Highlight
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
""Syntax Highlight
"Plug 'w0rp/ale'
"Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
"Plug 'mlaursen/vim-react-snippets'
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
			\ 'coc-clangd',
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
colorscheme embark
"set background=light
set background=dark
let g:embark_terminal_italics = 1

" let g:lightline = {
" \ 'colorscheme': 'embark',
" \ }
"colorscheme nightflylet
"g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

"Indent Line Plug Conf
let g:indentLine_color_term = 255
" GVim
let g:indentLine_color_gui = '#616a74'
let g:indentLine_char = '┆'

"Map Snippet trigger to shift+tab
let g:UltiSnipsExpandTrigger="<s-tab>"
"lightline
"set noshowmode
"enable airline tab
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#whitespace#skip_indent_check_ft =
  \  {'js': ['mixed-indent-file']}
"let g:airline#extensions#whitespace#mixed_indent_algo = 2
"let g:airline#extensions#c_like_langs=
			\ ['arduino', 'c', 'cpp', 'cuda', 'go', 'javascript', 'ld', 'php', 'js', 'jsx']
"silent! call airline#extensions#whitespace#disable()
let g:airline#extensions#whitespace#enabled = 0

"let g:werewolf_day_themes = ['embark']
"let g:werewolf_night_themes = ['gruvbox']
"let g:werewolf_day_start = 8
"let g:werewolf_day_end = 18

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++17 -stdlib=libc++'
"let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"markddown preview auto start
let g:mkdp_auto_start = 1
"nvim-transparent
"let g:transparent_enabled = v:true
