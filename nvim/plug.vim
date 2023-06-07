if has("nvim")
	let g:plug_home = stdpath('data') . '/plugged'
endif
if (has("termguicolors"))
  set termguicolors
endif

call plug#begin()
Plug 'lukas-reineke/indent-blankline.nvim' " Show indent guide lines
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do':'yarn install --frozen-lockfile'}
Plug 'dakai/embark-theme-vim', { 'as': 'embark', 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " vim Airline dependencies
Plug 'nikvdp/neomux' " tmux Integration
"Plug 'edkolev/tmuxline.vim' " tmux Integration
Plug 'ap/vim-css-color' " Color name highlighter
Plug 'karb94/neoscroll.nvim' " Smooth Scroll
Plug 'tpope/vim-surround' " Add surround easy
"Plug 'toppair/peek.nvim', { 'do': 'deno task --quiet build:fast' } " Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"Plug 'maxmellon/vim-jsx-pretty' " React syntax jsx tsx highlighting
Plug 'karb94/neoscroll.nvim'
Plug 'scrooloose/nerdtree' " File system explorer
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Exafunction/codeium.vim'
"Plug 'linty-org/key-menu.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'neovim/nvim-lspconfig'
Plug 'davidosomething/format-ts-errors.nvim'
"ChatGPT
"Plug 'MunifTanjim/nui.nvim'
Plug 'dpayne/CodeGPT.nvim'

Plug 'xiyaowong/nvim-transparent'

"ChatGPT
Plug 'MunifTanjim/nui.nvim'
Plug 'Bryley/neoai.nvim'

"Plug 'Tummetott/reticle.nvim'
""CPP env
"Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'vim-syntastic/syntastic'
"Plug 'rhysd/vim-clang-format'
"CPP env end

"Plug 'pangloss/vim-javascript' "JavaScript bundle for vim, syntax highlighting and improved indentation.

"Plug 'psliwka/vim-smoothie'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
"Astro
"Plug 'iloginow/vim-stylus' " CSS auto complete
"Plug 'williamboman/mason.nvim' " nvim-lsp-installer
"Plug 'williamboman/mason-lspconfig.nvim'
"Plug 'neovim/nvim-lspconfig'
"Pretty pretty debug info
"Plug 'folke/lsp-colors.nvim'
"Plug 'folke/trouble.nvim'

"Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
"Plug 'RRethy/vim-illuminate'

"Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install --frozen-lockfile --production',
"  \ 'branch': 'release/0.x'
"  \ }
"Plug 'virchau13/tree-sitter-astro'
"Plug 'wfxr/minimap.vim'
"Plug 'gorbit99/codewindow.nvim'
"Plug 'preservim/map.vim'nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'jcharum/vim-nerdtree-syntax-highlight'
"Plug 'scrooloose/nerdcommenter'
"Plug 'morhetz/gruvbox'
"Terminal Integration
"Plug 'Yggdroot/indentLine'
"Plug 'jonstoler/werewolf.vim'
"Plug 'tribela/vim-transparent'

"Jsx syntax highlighting
"Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
"fcitx5 in neovim
"Plug 'tonyfettes/fcitx5.nvim'
"Plug 'gen740/SmoothCursor.nvim'
"Transparent
"Plug 'miyakogi/seiya.vim'
"Js syntax highlighting
"Plug 'yuezk/vim-js'
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
			"\ 'coc-clangd',
			"\ 'coc-webview',
			"\ 'coc-markdown-preview-enhanced'
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

" the following lines are required to enabled nvim-treesitter be default.
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true }
}
EOF
" let g:lightline = {
" \ 'colorscheme': 'embark',
" \ }
"colorscheme nightflylet
"g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

"Indent Line Plug Conf
"let g:indentLine_color_term = 255
"" GVim
"let g:indentLine_color_gui = '#616a74'
"let g:indentLine_char = '┆'

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
let g:transparent_enabled = v:true

"codeium config
let g:codeium_no_map_tab = 1
let g:airline_section_y = '{…}%3{codeium#GetStatusString()}'
"set statusline+=\{…\}%3{codeium#GetStatusString()}
"imap <script><silent><nowait><expr> <Leader>c codeium#Accept()
imap <script><silent><nowait><expr> <M-l> codeium#Accept()
imap <script><silent><nowait><expr> <M-j> codeium#Complete()
imap <M-i>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <M-k>   <Cmd>call codeium#CycleCompletions(-1)<CR>
