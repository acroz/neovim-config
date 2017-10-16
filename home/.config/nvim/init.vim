" First install vim-plug from https://github.com/junegunn/vim-plug

call plug#begin('~/.local/share/nvim/plugins')

" UI Styling
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tools
Plug 'srstevenson/vim-picker' " Fuzzy file searching
Plug 'diepm/vim-rest-console'
Plug 'tpope/vim-fugitive'

" Coding
Plug 'ervandew/supertab' " Tab completion
Plug 'Raimondi/delimitMate' " Auto close quotes etc.
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter' " Show git diff indicators
Plug 'sheerun/vim-polyglot' " Language pack
Plug 'srstevenson/vim-topiary' " Clean whitespace on save
Plug 'tpope/vim-commentary' " Commenting actions
Plug 'tpope/vim-vinegar' " Improvements to directory browser
Plug 'w0rp/ale' " Asychronous lint engine

call plug#end()

" Use shell colour scheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Options for rainbow_parentheses
let g:rainbow#blacklist = [11]
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses

" Options for ale
let g:ale_python_mypy_options = '--ignore-missing-imports'

" Vim options
set number
set relativenumber
set expandtab
set shiftwidth=4
set colorcolumn=80
set listchars=tab:→\ ,trail:·,nbsp:+ " TODO: Not working?
set showcmd
set nomodeline
set noshowmode " TODO: Redundant?
set scrolloff=3
set spelllang=en_gb
set splitbelow
set splitright
set clipboard=unnamed
let mapleader="\<SPACE>"

" Format-specific
autocmd FileType markdown setlocal textwidth=79
autocmd FileType javascript set shiftwidth=2
let g:vim_json_syntax_conceal = 0

" Powerline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_grayscale'

" Auto indent on return inside braces
let delimitMate_expand_cr=1

" Tab between windows in normal mode
nmap <Tab> <C-W><C-W>

" Alias write/quit commands to allow sloppy capitals
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang Qa qa<bang>
    command! -bang QA qa<bang>
    command! -bang Wqa wqa<bang>
    command! -bang WQa wqa<bang>
    command! -bang WQA wqa<bang>
endif

" Keybindings for vim-fugitive
nnoremap <unique> <leader>gc :Gcommit -v<cr>
nnoremap <unique> <leader>gd :Gdiff<cr>
nnoremap <unique> <leader>gs :Gstatus<cr>
nnoremap <unique> <leader>gw :Gwrite<cr>

" Keybindings for vim-picker
nmap <unique> <leader>pe <Plug>PickerEdit
nmap <unique> <leader>ps <Plug>PickerSplit
nmap <unique> <leader>pt <Plug>PickerTabedit
nmap <unique> <leader>pv <Plug>PickerVsplit
nmap <unique> <leader>pb <Plug>PickerBuffer
nmap <unique> <leader>p] <Plug>PickerTag
nmap <unique> <leader>ph <Plug>PickerHelp
