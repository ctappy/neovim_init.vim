call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'valloric/YouCompleteMe'
 " Plug 'alvan/vim-closetag'
Plug 'scrooloose/syntastic'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'dietsche/vim-lastplace'
Plug 'myusuf3/numbers.vim'
Plug 'christoomey/vim-rfactory'
" autocompletion library for python
Plug 'davidhalter/jedi-vim'
" status bar
Plug 'vim-airline'
" Remove extraneous whitespace when edit mode is exited
Plug 'thirtythreeforty/lessspace.vim'
" Tab completion
Plug 'ervandew/supertab'
""""""" SuperTab configuration """""""
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction

Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
" }}}
"
call plug#end()

""""""" Python stuff """""""
syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1

" expand netrw tree
let g:netrw_liststyle=3

" Call Explorer by pressing f2 or ctrl-e
map <F2> :Explore<CR>
map <C-E> :Explore<CR>

" Call FZF search by pressing ctrl-f
map <C-L> :FZF<CR>

" setup find and replace syntax
map <C-C> :%s/from/to/g

" Call Startify by pressing f4 or ctrl-s
map <F3> :SClose<CR>
map <C-S> :SClose<CR>

" Use CTRL-W for saving, also in Insert mode
noremap <C-W> :update<CR>
vnoremap <C-W> <C-C>:update<CR>
inoremap <C-W> <C-O>:update<CR>

" allow quit via ctrl-q
map <C-Q> :qa<CR>

" Run Github activity
map <C-V> :GHActivity<cr>


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

" %F(Full file path)
" %m(Shows + if modified - if not modifiable)
" %r(Shows RO if readonly)
" %<(Truncate here if necessary)
" \ (Separator)
" %=(Right align)
" %l(Line number)
" %v(Column number)
" %L(Total number of lines)
" %p(How far in file we are percentage wise)
" %%(Percent sign)
set statusline=%F%m%r%<\ %=%l,%v\ [%L]\ %p%%

" Change the highlighting so it stands out
hi statusline ctermbg=white ctermfg=black

" Make sure it always shows
set laststatus=2


" github auto login
let g:github_dashboard = { 'username': $GITHUB_USERNAME, 'password': $GITHUB_TOKEN }


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
let g:syntastic_html_tidy_ignore_errors = [ '<iframe> proprietary attribute "allowtransparency"', '<meta> proprietary attribute "description"', '<meta> proprietary attribute "author"', '<ul> proprietary attribute "for"', '<li> proprietary attribute', 'missing <li>']
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
let g:syntastic_python_checkers       = ['flake8']
let g:syntastic_javascript_checkers   = ['eslint']
let g:syntastic_enable_elixir_checker = 0

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

" Lightline
Plug 'itchyny/lightline.vim'
" {{{
  let g:lightline = {
        \ 'colorscheme': 'jellybeans_mod',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'fugitive', 'gitgutter', 'filename' ] ],
        \   'right': [ [ 'percent', 'lineinfo' ],
        \              [ 'syntastic' ],
        \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'fugitive': 'LightLineFugitive',
        \   'gitgutter': 'LightLineGitGutter',
        \   'readonly': 'LightLineReadonly',
        \   'modified': 'LightLineModified',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'filename': 'LightLineFilename'
        \ },
        \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
        \ 'subseparator': { 'left': '>', 'right': '' }
        \ }
  function! LightLineModified()
    if &filetype == "help"
      return ""
    elseif &modified
      return "+"
    elseif &modifiable
      return ""
    else
      return ""
    endif
  endfunction

  function! LightLineReadonly()
    if &filetype == "help"
      return ""
    elseif &readonly
      return "RO"
    else
      return ""
    endif
  endfunction

  function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
  endfunction

  function! LightLineGitGutter()
    if ! exists('*GitGutterGetHunkSummary')
          \ || ! get(g:, 'gitgutter_enabled', 0)
          \ || winwidth('.') <= 90
      return ''
    endif
    let symbols = [
          \ g:gitgutter_sign_added,
          \ g:gitgutter_sign_modified,
          \ g:gitgutter_sign_removed
          \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
      if hunks[i] > 0
        call add(ret, symbols[i] . hunks[i])
      endif
    endfor
    return join(ret, ' ')
  endfunction

  function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
  endfunction

  " {{{ Modified jellybeans theme
  let s:base03    = [ '#151513', 233 ]
  let s:base02    = [ '#30302c', 236 ]
  let s:base01    = [ '#4e4e43', 237 ]
  let s:base00    = [ '#666656', 242 ]
  let s:base0     = [ '#808070', 244 ]
  let s:base1     = [ '#949484', 246 ]
  let s:base2     = [ '#a8a897', 248 ]
  let s:base3     = [ '#e8e8d3', 253 ]
  let s:yellow    = [ '#ffb964', 215 ]
  let s:red       = [ '#cf6a4c', 167 ]
  let s:magenta   = [ '#f0a0c0', 217 ]
  let s:blue      = [ '#7697D6', 4   ]
  let s:orange    = [ '#ffb964', 215 ]
  let s:green     = [ '#99ad6a', 107 ]
  let s:white     = [ '#FCFCFC', 15  ]

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}}
  let s:p.normal.left     = [ [ s:white, s:blue ], [ s:base3, s:base02 ] ]
  let s:p.normal.right    = [ [ s:base02, s:base1 ], [ s:base3, s:base02 ] ]
  let s:p.inactive.right  = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
  let s:p.inactive.left   = [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
  let s:p.insert.left     = [ [ s:base02, s:orange ], [ s:base3, s:base01 ] ]
  let s:p.replace.left    = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
  let s:p.visual.left     = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
  let s:p.terminal.left   = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
  let s:p.normal.middle   = [ [ s:base0, s:base03 ] ]
  let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
  let s:p.tabline.left    = [ [ s:base3, s:base02 ] ]
  let s:p.tabline.tabsel  = [ [ s:white, s:blue ] ]
  let s:p.tabline.middle  = [ [ s:base01, s:base03 ] ]
  let s:p.tabline.right   = [ [ s:base03, s:base03 ], [ s:base03, s:base03 ] ]
  let s:p.normal.error    = [ [ s:red, s:base02 ] ]
  let s:p.normal.warning  = [ [ s:yellow, s:base01 ] ]
  " }}}
" }}}
Plug 'nathanaelkane/vim-indent-guides'
" {{{
  let g:indent_guides_default_mapping = 0
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']
" }}}
"



" Thank you zenbro, some of this file was used creating his vimrc located https://github.com/zenbro/dotfiles/blob/master/.nvimrc
