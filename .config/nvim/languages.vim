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
