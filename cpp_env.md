# C++ Development in Neovim

## LSP

### coc.nvim

install coc.nvim via vim-plug in $HOME/.config/nvim/plug.vim

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

### coc.nvim settings for linting

Also in $HOME/.config/nvim/plug.vim

    let g:coc_global_extensions = [
    	\ 'coc-clangd'
    ]

### Syntax Highlighting

install plugin jackguo380/vim-lsp-cxx-highlight

    Plug 'jackguo380/vim-lsp-cxx-highlight'

coc-settings.json:

    "initializationOptions": {
    	// ...
    	// This will re-index the file on buffer change which is definitely a performance hit. See if it works for you
    	"index": {
    		"onChange": true
    	},
    	// This is mandatory!
    	"highlight": { "lsRanges" : true }
    }

in vim config:

    " c++ syntax highlighting
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1

The drawback of the syntax highlighting depending on the LSP server is that it is much slower than other solutions.

### Linting

Install cpplint

    pip install cpplint

install plugin

    Plug 'vim-syntastic/syntastic'

in vim config:

    let g:syntastic_cpp_checkers = ['cpplint']
    let g:syntastic_c_checkers = ['cpplint']
    let g:syntastic_cpp_cpplint_exec = 'cpplint'
    " The following two lines are optional. Configure it to your liking!
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

### Auto-formating

add .clang-format file in the project folder.

    # https://clang.llvm.org/docs/ClangFormatStyleOptions.html
    # To disable for a line use `// clang-format off`
    BasedOnStyle: Google # https://google.github.io/styleguide/cppguide.html
    IndentPPDirectives: BeforeHash

install plugin

    Plug 'rhysd/vim-clang-format'

config pressing Leader(space in my case) + f to format file

    nnoremap <Leader>f :<C-u>ClangFormat<CR>
