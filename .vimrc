" ------------------------------------------------------
" ------------------------------------------------------
" text encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,sjis
set fileformats=unix,dos,mac
" set line number
set number
set relativenumber
" swpファイル出力先
set directory=~/.vimtmp/swap
" バックアップファイル出力先
set backupdir=~/.vimtmp/backup
" undoファイル出力先
set undodir=~/.vimtmp/undo
" syntax
syntax enable
" colorscheme
colorscheme moonshine
"colorscheme twilight
" indent width
if has("autocmd")
  autocmd FileType html setlocal sw=4 sts=4 ts=4 et
  autocmd FileType js setlocal sw=4 sts=4 ts=4 et
  autocmd FileType go setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType c setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yml setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et
endif
" set wild menu
set wildmenu
set wildmode=full

" --------------------------------------------------------
" aliases
" --------------------------------------------------------
" Lsp
nnoremap ls :LspDefinition<CR>
nnoremap lS :LspReferences<CR>
nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
nnoremap <buffer> K :<C-u>LspHover<CR>
nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
nnoremap <buffer> <F2> :<C-u>LspRename<CR>
" highlight cancel
nnoremap <ESC><ESC> :nohl<CR>
" highlight text under cursor
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>"
" delete highlight
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" nerdtree settings
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" tab settings
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap <silent> tabn :tabnew<CR>
" tab move cursor
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $
" vim-delve
autocmd FileType go nmap <silent> dtb :DlvToggleBreakpoint<CR>
autocmd FileType go nmap <silent> ds :DlvDebug<CR>

" --------------------------------------------------------
" vim-plug
" if vim-plug is not exist
if has('vim_starting')
        set rtp+=~/.vim/plugged/vim-plug
        if !isdirectory(expand('~/.vim/plugged/vim-plug'))
                echo 'install vim-plug...'
                call system('mkdir -p ~/.vim/plugged/vim-plug')
                call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
        end
endif
call plug#begin('~/.vim/plugged')
" if add colorscheme write {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-goimports'
Plug 'mattn/vim-lsp-settings'
Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'
Plug 'mechatroner/rainbow_csv'
Plug 'dracula/vim', {'as': 'dracula', 'do': 'cp colors/* ~/.vim/colors/'}
Plug 'cocopon/iceberg.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'sebdah/vim-delve'
Plug 'chase/vim-ansible-yaml'
call plug#end()

" indentLine settings
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|'
set list listchars=tab:\¦\
" airline sttings
let g:airline_enable_branch = 0
let g:airline_section_b = "%t %M"
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
                        \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
                        \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
                        \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#enabled = 0
