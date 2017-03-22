execute pathogen#infect()
" autocmd vimenter * NERDTree

syntax on
filetype plugin indent on
set guifont=Monaco:h14
set background=dark
set number
colorscheme solarized
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80
set autoread "auto load changed files

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2


map <C-e> :NERDTreeToggle<CR>
"set nofoldenable    " disable folding
set foldmethod=indent
nnoremap <space> za
vnoremap <space> zf
set tags=ctags;
map <f12> :!ctags -R -f ctags .

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>bn :enew<cr>

" Move to the next buffer
nmap <Tab> :bnext<CR>

" Move to the previous buffer
nmap <S-Tab> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>


" vim-test
" let test#strategy = "iterm"
let test#python#djangotest#options = '--settings=test_local_settings --nomigrations'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
