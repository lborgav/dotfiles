" Plugins
runtime ./plug.vim

" Mappings
runtime ./maps.vim

" Programming Languages
runtime ./languages.vim

" Config
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
