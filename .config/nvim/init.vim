"###################################################################
"# Plugins
"###################################################################

call plug#begin("~/.local/share/nvim/plugged")
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'ap/vim-buftabline'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'elmcast/elm-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'pbogut/deoplete-elm'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-go', { 'do': 'make'}
call plug#end()


"###################################################################
"# Mappings
"###################################################################

noremap <c-n> :NERDTreeToggle<cr>
noremap <c-f> :Ag<space>
noremap <s-l> :bnext<cr>
noremap <s-h> :bprevious<cr>
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

nnoremap <c-g> :GitGutterToggle<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap ; :
nnoremap ;; :!
nnoremap ;;o :!open .<cr>
nnoremap <right> <c-w>v

inoremap jk <esc>
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<down>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<up>"

" Abbreviations
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q


"###################################################################
"# Config
"###################################################################

set background=dark
set clipboard+=unnamedplus
set cursorline "Highlight current line
set expandtab "Expand tabs to spaces
set hidden "When a buffer is brought to foreground, remember undo history and marks
set inccommand=split
set list
set listchars=eol:¬,tab:▸-
set mouse=a "Enable mouse in all modes
set number "line numbers
set termguicolors
set title "Show the filename in the window titlebar

colorscheme palenight


"###################################################################
"# Plugin Config
"###################################################################

augroup airline_config
  autocmd!
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'bubblegum'
augroup END

augroup ale_config
  autocmd!
  let g:ale_sign_error = '●' " Less aggressive than the default '>>'
  let g:ale_sign_warning = '.'
  let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
  let g:ale_linters = {'javascript': ['eslint']}
augroup END

augroup ack_config
  autocmd!
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
augroup END

augroup ctrlp_config
  autocmd!
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|elm-stuff'
  let g:ctrlp_max_files = 0
  let g:ctrlp_dotfiles = 1
augroup END

augroup emmet_config
  autocmd!
  let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \    'extends' : 'jsx',
  \  },
  \}
augroup END

augroup deoplete_config
  autocmd!
  let g:deoplete#enable_at_startup = 1
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

augroup nerdtree_config
  autocmd!
  let NERDTreeShowHidden=1
  let NERDTreeIgnore=["\.git"]
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

augroup prettier_config
  autocmd!
  let g:prettier#autoformat = 0
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
augroup END

augroup ultisnips_config
  autocmd!
  let g:UltiSnipsEditSplit = 'vertical'
  let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
augroup END

augroup vimgo_config
  autocmd!
  autocmd FileType go nnoremap <leader>d :GoDoc<cr>
  autocmd FileType go nnoremap <leader>w :GoDocBrowser<cr>
  autocmd FileType go nnoremap <leader>r :GoRun<cr>
  autocmd FileType go nnoremap <leader>t :GoTest<cr>
  autocmd FileType go nnoremap <leader>i :GoImport<space>
augroup END


"###################################################################
"# Programming languages Config
"###################################################################

augroup javascript
  autocmd!
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
augroup END

augroup css
  autocmd!
  autocmd FileType css setlocal shiftwidth=2 tabstop=2
augroup END

augroup vim 
  autocmd!
  autocmd FileType vim setlocal shiftwidth=2 tabstop=2
augroup END

