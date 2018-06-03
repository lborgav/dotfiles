"###################################################################
"# Plugins 
"###################################################################

call plug#begin("~/.local/share/nvim/plugged")
Plug 'dracula/vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'elmcast/elm-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
call plug#end()


"###################################################################
"# Mappings 
"###################################################################

map <C-n> :NERDTreeToggle<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>


"###################################################################
"# Config 
"###################################################################

set termguicolors 
set number " line numbers
set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set cursorline  " highlight current line
set background=dark
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
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
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

