runtime ./plug.vim
runtime ./coc.vim
lua require('neoscroll').setup()
"lua require('chatgpt').setup()

"runtime ./lspconfig.lua

"lua require('neoscroll').setup()
"Astro LSP Setup
"lua require('mason').setup()
"lua require('mason-lspconfig').setup({ensure_installed = { "tsserver", "tailwindcss","astro" }})
"lua require'lspconfig'.astro.setup{}
"lua require'lspconfig'.eslint.setup{}
"lua require'lspconfig'.tsserver.setup{}
"lua require'lspconfig'.quick_lint_js.setup{}

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
set magic
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
"Space + t to Toggle telescope file search
noremap <silent> <Leader>t :Telescope find_files<Enter>
"Space + f to Toggle telescope file search
noremap <silent> <Leader>g :Telescope live_grep<Enter>
"Space + v to Toggle NeoAI
noremap <silent> <Leader>v :NeoAI<Enter>


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
"nnoremap <Leader>f :<C-u>ClangFormat<CR>

"python 3
"let g:python3_host_prog="/usr/local/bin/python3"
"
let g:loaded_perl_provider = 0

"Enable Astro tree-sitter
"autocmd BufRead,BufEnter *.astro set filetype=astro
"
"let g:astro_typescript = 'enable'
"let g:astro_stylus = 'enable'
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let g:ackprg = 'ag --vimgrep'
endif

set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold
"lua require('reticle').setup {follow = {cursorline = true,cursorcolumn = false,},always_show_cl_number = true,}
"
lua << EOF
require('neoai').setup{
    -- Below are the default options, feel free to override what you would like changed
    ui = {
        output_popup_text = "NeoAI",
        input_popup_text = "Prompt",
        width = 30,      -- As percentage eg. 30%
        output_popup_height = 80, -- As percentage eg. 80%
    },
    model = "gpt-3.5-turbo",
    register_output = {
        ["g"] = function(output)
            return output
        end,
        ["c"] = require("neoai.utils").extract_code_snippets,
    },
    inject = {
        cutoff_width = 75,
    },
    prompts = {
        context_prompt = function(context)
            return "Hi ChatGPT, I'd like to provide some context for future "
                .. "messages. Here is the code/text that I want to refer "
                .. "to in our upcoming conversations:\n\n"
                .. context
        end,
    },
    open_api_key_env = "OPENAI_API_KEY",
    shortcuts = {
        {
            key = "<leader>as",
            use_context = true,
            prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
            modes = { "v" },
            strip_function = nil,
        },
        {
            key = "<leader>ag",
            use_context = false,
            prompt = function ()
                return [[
                    Using the following git diff generate a consise and
                    clear git commit message, with a short title summary
                    that is 75 characters or less:
                ]] .. vim.fn.system("git diff --cached")
            end,
            modes = { "n" },
            strip_function = nil,
        },
    },
}
EOF

lua << EOF
local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({
  handlers = {
    ["textDocument/publishDiagnostics"] = function(
      _,
      result,
      ctx,
      config
    )
      if result.diagnostics == nil then
        return
      end

      -- ignore some tsserver diagnostics
      local idx = 1
      while idx <= #result.diagnostics do
        local entry = result.diagnostics[idx]

        local formatter = require('format-ts-errors')[entry.code]
        entry.message = formatter and formatter(entry.message) or entry.message

        -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
        if entry.code == 80001 then
          -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
          table.remove(result.diagnostics, idx)
        else
          idx = idx + 1
        end
      end

      vim.lsp.diagnostic.on_publish_diagnostics(
        _,
        result,
        ctx,
        config
      )
    end,
  },
})
EOF
