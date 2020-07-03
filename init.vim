call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes
Plug 'valloric/YouCompleteMe'
let g:ycm_auto_trigger = 0
 " Plug 'alvan/vim-closetag'
Plug 'scrooloose/syntastic'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_grep=''
set updatetime=100
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-rake'
Plug 'dietsche/vim-lastplace'
Plug 'myusuf3/numbers.vim'
" Plug 'christoomey/vim-rfactory'
" Remove extraneous whitespace when edit mode is exited
Plug 'thirtythreeforty/lessspace.vim'
" Tab completion
Plug 'ervandew/supertab'
" vim vagrant
Plug 'hashivim/vim-vagrant'
" Terraform plug
Plug 'hashivim/vim-terraform'
" vim puppet
" Plug 'rodjek/vim-puppet'
" Go plug
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'zchee/deoplete-go'

Plug 'scrooloose/nerdtree'

" js
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern', 'for': 'javascript' }

" React plugs
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'
Plug 'davidhalter/jedi-vim'
Plug 'mhinz/vim-startify'

" Angular
" Typescrript syntax support
Plug 'https://github.com/leafgarland/typescript-vim'
" Template strings syntax support
" FIXME: throws E488 trailing characters error when opening .ts files
Plug 'https://github.com/Quramy/vim-js-pretty-template'
" TS features plugin
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/denite.nvim'
" Angular CLI plugin
" Use :Ng command in Vim
Plug 'https://github.com/bdauria/angular-cli.vim'

" emmet-vim plug
let g:user_emmet_leader_key='<Tab>'

let g:deoplete#enable_at_startup = 1
""""""" SuperTab configuration """""""
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
" }}}
"
call plug#end()

" Size of nerdtree width
let g:NERDTreeWinSize=40

" Enable displaying TS compilation errors in the QuickFix window
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Disable VIM Scratch Preview Window included at the top of the editted files
" See also: https://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
set completeopt-=preview

" Airline theme
let g:airline_theme='jellybeans'

au FileType go nmap <F6> <Plug>(go-build)
au FileType go nmap <F7> <Plug>(go-test)
au FileType go nmap <F8> <Plug>(go-run)

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
" Neomake and other build commands (ctrl-b)
" nnoremap <C-b> :w<cr>:Neomake<cr>

" autocmd BufNewFile,BufRead *.tex,*.bib noremap <buffer> <C-b> :w<cr>:new<bar>r !make<cr>:setlocal buftype=nofile<cr>:setlocal bufhidden=hide<cr>:setlocal noswapfile<cr>
" autocmd BufNewFile,BufRead *.tex,*.bib imap <buffer> <C-b> <Esc><C-b>
" autocmd! QuitPre * let g:neomake_verbose = 0
" copy and paste using system clipboard
set clipboard=unnamedplus
""""""" Python stuff """""""
syntax enable
set number showmatch
" set shiftwidth=4 tabstop=2 softtabstop=2 expandtab autoindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
let python_highlight_all = 1
" run python code with :make and ctrl-m to run :make
set makeprg=python\ %
set autowrite
au FileType python map <C-M> :make<CR>
au FileType go nmap <C-M> <Plug>(go-run)

" Copy current variable under cursor
map <C-C> mp"+yiw`p

" expand netrw tree
let g:netrw_liststyle=3

" let mapleader=" "
let mapleader = "\<Space>"
 map <leader>h :wincmd h<CR>
 map <leader>j :wincmd j<CR>
 map <leader>k :wincmd k<CR>
 map <leader>l :wincmd l<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Nerd tree
map <C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

" Call Explorer by pressing f2 or ctrl-e
map <F2> :Explore<CR>
map <C-E> :Explore<CR>

" Call FZF search by pressing ctrl-f
map <C-L> :FZF<CR>

" setup find and replace syntax
map <C-F> :%s:::g
map <C-G> :%s/\<<C-r><C-w>\>/

" Call Startify by pressing f4 or ctrl-s
map <F3> :SClose<CR>
map <C-S> :SClose<CR>

" Use CTRL-W for saving, also in Insert mode
noremap <C-U> :update<CR>
vnoremap <C-U> <C-C>:update<CR>
inoremap <C-U> <C-O>:update<CR>

" switch windows faster
map <C-Q> <c-w><c-w>

" FixIt
map <C-Y> :YcmCompleter FixIt<CR>

" run pathogen
execute pathogen#infect()

" create a undo history/file
set undodir=~/.undohistory/
set undofile

" turn off buffer
set hidden

" do not create backup
set nobackup
set nowb
set noswapfile

" turn off mouse
set mouse=""

" Language-specific
highlight! link elixirAtom rubySymbol

" Syntastastic syntax
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_html_tidy_ignore_errors = [ '<input> proprietary attribute "role"' ]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_html_tidy_ignore_errors = [ '<iframe> proprietary attribute "allowtransparency"', '<meta> proprietary attribute "description"', '<meta> proprietary attribute "author"', '<ul> proprietary attribute "for"', '<li> proprietary attribute', 'missing <li>', 'is not recognized', 'discarding unexpected', 'attribute name', 'lacks value', 'proprietary attribute', 'has invalid value', 'plain text', 'trimming empty', '<img> lacks "alt" attribute', '<img> lacks "src" attribute']
let g:syntastic_enable_signs          = 1
let g:syntastic_enable_highlighting   = 1
let g:syntastic_cpp_check_header      = 1
let g:syntastic_enable_balloons       = 1
let g:syntastic_echo_current_error    = 1
let g:syntastic_check_on_wq           = 0
let g:syntastic_error_symbol          = '✘'
let g:syntastic_warning_symbol        = '!'
let g:syntastic_style_error_symbol    = ':('
let g:syntastic_style_warning_symbol  = ':('
let g:syntastic_vim_checkers          = ['vint']
let g:syntastic_elixir_checkers       = ['elixir']
let g:syntastic_python_checkers       = ['pylint']
let g:syntastic_python_pylint_post_args =
      \ '--module-rgx=''[a-zA-Z_][a-zA-Z0-9_]*$'' --max-line-length 120 --disable=line-too-long,missing-docstring,invalid-name,fixme,broad-except,too-many-arguments,too-many-locals,too-many-branches,too-many-statements'
  " '--module-rgx=''[a-zA-Z_][a-zA-Z0-9_]*$'' --max-line-length 120 --indent-string=''\t'' --disable=mixed-indentation,line-too-long,missing-docstring,too-many-public-methods,too-few-public-methods,import-error,no-name-in-module,not-callable,locally-disabled,bad-continuation'
let g:syntastic_python_flake8_args='--ignore=F821,E302,E501,E266,E303,W605'
let g:syntastic_javascript_checkers   = ['eslint']
let g:syntastic_enable_elixir_checker = 0
let g:syntastic_go_checkers           = ['go']
let g:syntastic_aggregate_errors = 1
let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']

highlight SyntasticErrorSign guifg=black guibg=#E01600 ctermfg=16 ctermbg=160
highlight SyntasticErrorLine guibg=#0D0D0D ctermbg=232
highlight SyntasticWarningSign guifg=black guibg=#FFED26 ctermfg=16 ctermbg=11
highlight SyntasticWargningLine guibg=#171717
highlight SyntasticStyleWarningSign guifg=black guibg=#bcbcbc ctermfg=16 ctermbg=250
highlight SyntasticStyleErrorSign guifg=black guibg=#ff8700 ctermfg=16 ctermbg=208

highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap

" Vim color-schemes
colorscheme jellybeans

set cursorline     " highlight current line
set colorcolumn=80 " highlight column
highlight! ColorColumn ctermbg=233 guibg=#131313

" Various columns
highlight! SignColumn ctermbg=233 guibg=#0D0D0D
highlight! FoldColumn ctermbg=233 guibg=#0D0D0D

" enhance YCM JS completion with tern's smarts
autocmd FileType javascript setlocal omnifunc=tern#Complete

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
" let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#var('omni', 'input_patterns', {})
call deoplete#custom#option({'smart_case': v:false, 'refresh_always': v:false })
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = [" - persistent"]
