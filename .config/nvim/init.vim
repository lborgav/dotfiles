"###################################################################
"# Plugins
"###################################################################

call plug#begin("~/.local/share/nvim/plugged")
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'dart-lang/dart-vim-plugin'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'elmcast/elm-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hashivim/vim-terraform' 
Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'sebdah/vim-delve'
Plug 'shime/vim-livedown'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'SirVer/ultisnips'
Plug 'sotte/presenting.vim'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'thosakwe/vim-flutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wavded/vim-stylus'
Plug 'wellle/targets.vim'
Plug 'w0rp/ale'
"Plug 'yuttie/comfortable-motion.vim'
call plug#end()


"###################################################################
"# Mappings
"###################################################################

noremap <c-n> :NERDTreeToggle<cr>
noremap <c-t> :TagbarToggle<cr>
noremap <c-f> :Ack<space>
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-p> :Filesf<cr>
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-m> <c-w>c

nnoremap <c-g> :GitGutterToggle<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>y ggVG"+y''

nnoremap ; :
nnoremap ;; :!
nnoremap ;;o :!open .<cr>
nnoremap <right> <c-w>v<c-w>l
nnoremap Q @@
nnoremap Y y$

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
set hidden "When a buffer is brought to foreground, remember undo history and marks
set ignorecase
set inccommand=split
set list
set listchars=eol:¬,tab:▸-
set mouse=a "Enable mouse in all modes
set termguicolors
set title "Show the filename in the window titlebar
set number relativenumber
set noswapfile

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

colorscheme palenight


"###################################################################
"# Plugin Config
"###################################################################

command! -bang -nargs=? -complete=dir Filesf call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat {}']}, <bang>1)

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
  let g:ale_linters = {
  \  'proto': ['prototool-lint'],
  \  'python': ['pylint'],
  \  'javascript': ['eslint'],
  \  'jsx': ['eslint'],
  \}
augroup END

augroup ack_config
  autocmd!
  let g:ackprg = 'ag --vimgrep --smart-case'
  if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
  endif
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
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
  "autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

augroup prettier_config
  autocmd!
  let g:prettier#autoformat = 0
  let g:prettier#config#parser = 'babylon'
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml PrettierAsync
augroup END

augroup terraform_config
  autocmd!
  let g:terraform_align=1
  let g:terraform_fold_sections=1
  let g:terraform_remap_spacebar=1
  let g:terraform_fmt_on_save=1
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

augroup cpp_config
  nnoremap <leader>c :!g++ %<cr>
  autocmd BufNewFile *.cpp -r ~/Code/cp/templates/template.cpp
  autocmd FileType cpp nnoremap <leader>c :!g++ --std=c++17 % -o %:r<CR>
augroup END

augroup html_config
  autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2
augroup END

augroup js_config
  autocmd FileType js setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType vue setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType jsx setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType javascript.jsx setlocal expandtab shiftwidth=2 tabstop=2
augroup END

augroup vim_config
  autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=2
augroup END

augroup dart_config
  autocmd BufWritePre *.dart DartFmt
augroup END

augroup vim_go_config
  autocmd!
  let g:go_def_mapping_enabled = 0
augroup END

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
