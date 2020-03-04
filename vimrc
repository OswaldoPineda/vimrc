call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'      "Arbol de archivos
Plug 'Yggdroot/indentLine'      "Indentaciones con lineas
Plug 'ctrlpvim/ctrlp.vim'       "Copiado y pegado con vim
Plug 'mattn/emmet-vim'          "Emmet editor
Plug 'w0rp/ale'                 "Aler linters
Plug 'editorconfig/editorconfig-vim' "editorconfig to maintain
Plug 'tpope/vim-fugitive'
Plug 'nelstrom/vim-visual-star-search' "
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mhartington/oceanic-next'
Plug 'sickill/vim-monokai' "Theme
Plug 'leshill/vim-json'
Plug 'ntpeters/vim-better-whitespace' " remove trailing whitespaces
"Plug 'git@github.com:ajh17/VimCompletesMe.git'
"Plug 'ycm-core/YouCompleteMe'
Plug 'mattn/emmet-vim' "autocomplete html tags
Plug 'jiangmiao/auto-pairs' "pairs
Plug 'tpope/vim-commentary' "comment lines
Plug 'othree/yajs.vim'
call plug#end()

set autoindent                  " Auto-indent new lines
set expandtab
set tabstop=2
set softtabstop=2               " Number of spaces per Tab
set shiftwidth=2                " Number of auto-indent spaces
"set line at 80 column
set colorcolumn=80

" move whiout Ctr+W
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" css autocomplete
" crl x + crl o
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" emet html config
let g:user_emmet_leader_key=','

" themes
"syntax enable
"colorscheme molokai
syntax enable
colorscheme monokai
"if (has("termguicolors"))
"  set termguicolors
"endif
"colorscheme OceanicNext

"config
set number
set pastetoggle=<F2>            " toogle auto-indenting for code paste
set clipboard=unnamedplus

"config indentation
let g:indentLine_color_term = 0
let g:indentLine_char = '|'
"control P
let g:ctrlp_user_command = ['.git/',
                \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] "Pluggin de controlp ignore  archivos de git
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|android'
"config linter with ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
let g:ale_linters = {
			\'*': ['remove_trailing_lines', 'trim_whitespace'],
					\    'ruby': ['rubocop', 'ruby', 'rails_best_practices'],
          \    'css': ['stylelint'],
          \    'sass': ['stylelint'],
          \    'scss': ['stylelint'],
          \    'javascript': ['prettier', 'eslint']
					\}
"let g:ale_fixers = {'ruby': ['rubocop']}

set hlsearch                    " Highlight all search results

" Swap file path
"set swapfile
"set dir=~/.tmp

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif
autocmd BufWritePre * :%s/\s\+$//e
" whitespace config
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

