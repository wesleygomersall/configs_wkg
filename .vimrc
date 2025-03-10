let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your plugins here
" Plug 'tpope/vim-sensible'
" Plug 'ervandew/supertab'

Plug 'preservim/nerdtree'

Plug 'mbbill/undotree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive' 

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" `:LspInstallServer` command will install language server. 
" `:LspUninstallServer server-name` will uninstall server. 

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

syntax on
filetype on

set updatetime =50

" Line number
:set number

:set splitbelow

" No wrapping of lines by default
:set wrap! 

" change tabs to 4 whitespace characters
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab

" visible tab char
" :set list
" :set listchars=tab:>-
 
" Line numbers swapping between absolute and relative depending on mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" fzf: :Rg searches through file names. That is what :Files does. Change this. 
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 

" for gitgutter to work: 
:set updatetime=100 " this is the speed at which the changes are detected, default is 4s
:set signcolumn=auto " allows extra column to the left for change tracking

" vim-gitgutter used to do this by default:
highlight! link SignColumn LineNr

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

let g:gitgutter_sign_allow_clobber = 1 " prioritize the gitgutter symbols in the sign column

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = 'X'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = '~X'

" vim-lsp diagnostics
let g:lsp_diagnostics_enabled = 0 " Disable warnings, hints, errors, etc for being too verbose

" asyncomplete.vim tab completion\
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" If you prefer the enter key to always insert a new line (even if the popup menu is visible) then you can amend the above mapping as follows:
" inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<c>" : "\<cr>"

" only bring up autocomplete menu with tab
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" popup menu colors
highlight Pmenu ctermbg=black ctermfg=white guibg=black guifg=white
highlight PmenuSel ctermbg=white ctermfg=black guibg=white guibg=black
highlight PmenuSbar ctermbg=darkgray guibg=darkgray
highlight PmenuThumb ctermbg=white  guibg=darkgray

if has("persistent_undo")
   let target_path = expand('~/.vim/undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set noswapfile
    set undofile
endif

" keep at least 10 lines visible around cursor when possible
set scrolloff=10

set incsearch

" REMAPS
let mapleader =" "

nnoremap H ^
nnoremap L $

" Use ctrl-[hjkl] to select the active split: 
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" make excecutable / run current file
nnoremap <leader>x <cmd>!chmod +x %<CR>
nnoremap <leader>s <cmd>! %<CR>

" undo tree toggle
nnoremap <leader>u :UndotreeToggle<CR>

nmap <leader>b :bp <CR>

nmap <leader>f :Files<CR>
nmap <leader>r :RG <CR>
nmap <leader>v :Ex <CR>

nmap <leader>k :LspHover<CR>
nmap <leader>d :LspPeekDefinition<CR> 
" scroll the popup window with Control+j and Control+k
nnoremap <buffer> <expr><c-j> lsp#scroll(+4)
nnoremap <buffer> <expr><c-k> lsp#scroll(-4)

" bring search results to the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" control d and u snap to the middle of the screen
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

" move highlighted lines in visual mode
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" keep cursor in place when concatenating lines
nnoremap J mzJ`z 

nnoremap Q <nop>

