"###################################################################
"# Plugins 
"###################################################################

call plug#begin("~/.local/share/nvim/plugged")
Plug 'drewtempelmeyer/palenight.vim'
Plug 'elmcast/elm-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'pbogut/deoplete-elm'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
call plug#end()


"###################################################################
"# Mappings 
"###################################################################

map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
map <C-f> :Ag<Space>
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv 

" Using ctrl+j and ctrl+k when popup is visible
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

"###################################################################
"# Config 
"###################################################################

set background=dark
set cursorline  " highlight current line
set expandtab
set hidden
set inccommand=split
set mouse=a
set number " line numbers
set relativenumber
set shiftwidth=2
set softtabstop=0
set tabstop=2
set termguicolors 
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
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
augroup END

augroup numbertoggle_config
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

augroup elmvim_config
  autocmd!
  let g:elm_detailed_complete = 1
augroup END
