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
Plug 'airblade/vim-gitgutter' "show git changes
Plug 'tpope/vim-surround' " surround content between
Plug 'rking/ag.vim'
Plug 'leafgarland/typescript-vim' " for typescript highlight
Plug 'peitalin/vim-jsx-typescript' " for typescript highlight

call plug#end()

set autoindent                  " Auto-indent new lines
set expandtab
set tabstop=2
set softtabstop=2               " Number of spaces per Tab
set shiftwidth=2                " Number of auto-indent spaces
"set line at 80 column
set colorcolumn=100

" move whiout Ctr+W
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"change ESC for jh
inoremap jh <Esc>
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
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
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
let g:ctrlp_show_hidden = 1
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

"config to can copy
vnoremap <C-c> "*y
set clipboard=unnamed
map <leader>c :.w !pbcopy<CR><CR>
map <leader>p :r !pbpaste<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>s :sort<CR>
" map <leader>h :noh<CR>
map <leader>h :vertical resize +10<CR>
map <leader>l :vertical resize -10<CR>
map <leader>j :resize +10<CR>
map <leader>k :resize -10<CR>
map <leader>nt :tabedit<CR>
map <leader>tq :tabclose<CR>
map <leader>tn :tabnext<CR>
map <leader>tp :tabprevious<CR>

let g:airline#extensions#branch#enabled = 0
set conceallevel=1
let g:indentLine_conceallevel=1

" git status config
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

let NERDTreeShowHidden=1
set runtimepath^=~/.vim/bundle/ag

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
