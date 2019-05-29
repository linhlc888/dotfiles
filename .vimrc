set nocp
set enc=utf-8
set number
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://tpope.io/vim/eunuch.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'vim-scripts/indentpython.vim'
Plug 'https://github.com/nvie/vim-flake8.git'
Plug 'https://github.com/easymotion/vim-easymotion.git'
Plug 'michaeljsmith/vim-indent-object'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'davidhalter/jedi-vim'
Plug 'https://github.com/tell-k/vim-autopep8.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'crusoexia/vim-monokai'
call plug#end()
augroup HelpInTabs
	autocmd!
	autocmd BufEnter *.txt call HelpInNewTab()
augroup END
"Only apply tp help files...
function! HelpInNewTab ()
	if &buftype == 'help'
		"Convert the help window to a tab...
		execute "normal \<C-W>T"
	endif
endfunction
map <C-n> :NERDTreeToggle<CR>
set ruler
nnoremap / /\v
set ignorecase
set smartcase
set incsearch
set hlsearch
set backspace=indent,eol,start
" turn off search highlight
" Set map leader
let mapleader = ","
nnoremap <leader><space> :nohlsearch<CR>
" jk is escape
inoremap jj <esc>
set cursorline " highlight current line 
set wildmode=list:longest,full
set foldmethod=manual                                                           "sets fold method to manual"
set ruler                                                                       "shows line number and column"
set rulerformat=%l\:%c                                                          "better ruler format"
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l\:%c%V%)
highlight ColorColumn ctermbg=magenta
set t_Co=256
filetype plugin on

"set shortcuts for window move
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"set shortcuts for tabe move
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Settings to replace tab. Use :retab for replacing tab in existing files.
set tabstop=4
set shiftwidth=4
set expandtab
set undolevels=1000
syntax on
set nopaste
let g:SimpylFold_docstring_preview=1
" Setting for easy motion
map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
" setting python linter
let g:syntastic_python_checkers = ["flake8"]
autocmd BufWritePost *.py call flake8#Flake8()
" shellcheck
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_sh_shellcheck_args = "-e SC2088"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
" setting system clipboard
vmap <C-c> "+y
let g:clipboard = {
         \   'name': 'myClipboard',
         \   'copy': {
         \      '+': 'pbcopy load-buffer -',
         \      '*': 'pbcopy load-buffer -',
         \    },
         \   'paste': {
         \      '+': 'pbpaste save-buffer -',
         \      '*': 'pbpaste save-buffer -',
         \   },
         \   'cache_enabled': 0,
         \ }

" Clipboard 
set clipboard=unnamed
" Setting autopep8 to format python file
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1
" Open Nerd when start vim without argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Set theme
let g:molokai_original = 1
" Start ctrlp
set rtp+=~/.vim/plugged/ctrlp.vim
"Setting git
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" disable preview window
set completeopt-=preview
"go syntax highlight
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
"go shortcut
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" change to  monokai
syntax on
color monokai
