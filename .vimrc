execute pathogen#infect()
execute pathogen#helptags()

"call plug#begin('~/.vim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
"call plug#end()

syntax on
filetype plugin indent on

colorscheme gruvbox
set number "relativenumber
set background=dark

"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END


" Coc Binds
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_node_path = '/usr/local/n/versions/node/13.1.0/bin/node'


" Indenting
filetype plugin indent on
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
autocmd FileType javascript.jsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2

"Fuzzy finder
set rtp+=/usr/local/opt/fzf
nnoremap <C-f> :FZF<Cr>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Buffer switching
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

set tabstop=4
set shiftwidth=4

set colorcolumn=80
