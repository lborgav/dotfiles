noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-m> <c-w>c

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>t :GoTest <cr>
nnoremap <leader>y ggVG"+y''
nnoremap <silent> <leader>gg :LazyGit<cr>

nnoremap ; :
nnoremap ;; :!
nnoremap ;;o :!open .<cr>
nnoremap <right> <c-w>v<c-w>l
nnoremap Q @@
nnoremap Y y$
nnoremap <cr> <nop>

inoremap jk <esc>
