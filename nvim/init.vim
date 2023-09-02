"/////////////////////////////////////////
" estefano: .vimrc file
" Stefan Rastocky (rastockystefan@gmail.com)
" Hostname rastocky-labsX200-II
" //////////////////////////////////////////

" ////////////////////
" PRELIMINARY SETTINGS
let mapleader= " "
" MAP A SOURCE CONFIG SHORTCUT
nnoremap <leader>sc :source ~/.config/nvim/init.vim<cr>

" ///////////////////////////////////////////
" SOME PLUG STUFF
call plug#begin('~/.config/nvim/autoload/plugged')
"	Plug 'jiangmiao/auto-pairs'
"	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
"	Plug 'christoomey/vim-system-copy'
  Plug 'sheerun/vim-polyglot'
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/vim-easy-align'
"	Plug 'PotatoesMaster/i3-vim-syntax'
"	Plug 'jreybert/vimagit'
"	Plug 'LukeSmithxyz/vimling'
"	Plug 'vimwiki/vimwiki'
"	Plug 'terryma/vim-multiple-cursors'
"	Plug 'vim-airline/vim-airline'
"	Plug 'tomasiser/vim-code-dark'
"	Plug 'jalvesaq/Nvim-R'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} "code completion
  Plug 'kevinoid/vim-jsonc'
	Plug 'ctrlpvim/ctrlp.vim' "fuzzyfinds files
	Plug 'scrooloose/nerdtree'
"	Plug 'tsony-tsonev/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'
"	Plug 'lervag/vimtex'
"  Plug 'xolox/vim-colorscheme-switcher'
"	Plug 'xolox/vim-misc'
"	Plug 'Taverius/vim-colorscheme-manager'
"  Plug 'scrooloose/nerdcommenter'
" Plug 'HerringthnDarkholme/yats.vim'
" Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

" /////////////////////////////////////////////////////////////////?/////
" THE FOLLOIWNG IS THE CODE NECESSARY FOR INSTALLATION OF vim/plug plugin
" manager

" if empty(glob('~/.vim/autoload/plug.vim'))
" 	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug /master/plug.vim
" 	autocmd VimEnter * PlugInstall --sync | ce $MYVIMRC
" end if

" Where the actual commands for installing the vim/plugged are:
"	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/ivm-plug /master/plug.vim

" ///////////////////////////////
" GENERAL SETTINGS
" BASICS
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set termguicolors
	set cursorline
	set cmdheight=2 "give more space for messages
	set updatetime=1 "shorter lag on update
	"set modifiable
	"set path+=**
"	let g:airline_theme = 'codedark'
"	let g:airline#extensions#ine#enabled = 1
" SET Y TO YANK UNTIL END OF LINE
	nnoremap Y y$
" SCROLL BY SCREEN LINES RATHER THAN TEXT LINES AND VICE VERSA
	map j gj
	map k gk
" ENABLE A CENTRE-OF-SCREEN SCROLLING WITH Shift+(j/k)
  	nnoremap <C-j> jzz
  	nnoremap <C-k> kzz
" ENABLE AUTOCOMPLETION
	set wildmenu
	set wildmode=longest:full,full
	set wildignorecase
" DISABLE AUTO COMMENT ON NEXT LINE
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Goyo - read without distractions
	map <leader>f :Goyo \| set linebreak<CR>
" SPELLCHECK SET TO <leader>o (o = orthography)
	map <leader>spelleng :setlocal spell! spelllang=en_gb<CR>
" SPLITS OPEN ON THE BOTTOM OR RIGHT, which is not retarded unlike vim default
	set splitbelow splitright
" SHORTCUTS FOR SPLIT NAVIGATION, saving keypresses
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	map <silent> <C-y> <C-w>4< " lessen width
	map <silent> <C-u> <C-w>4- " lessen height
	map <silent> <C-i> <C-w>4+ " increase height
	map <silent> <C-o> <C-w>4> " increse width
" CHECK FILE IN SHELLCHECK
	map <leader>s :!clear && shellcheck %<CR>
" SET WORKING DIRECTORY TO CURRENT OPEN FILE HOME DIRECTORY
	map <leader>cwd :lcd<space>%:p:h<CR> 

" OPEN SOME FILES FOR EDIT IN THE SPLIT
	map <leader>b :vsp<space>/home/estefano/library/bib.bib"<CR>
"	map <leader>B :sp<space>/home/estefano/library/bib.bib"<CR>
	map <leader>c :vsp<space>/home/estefano/.config/nvim/init.vim<CR>
	map <leader>r :vsp<space>/home/estefano/library/ref<CR> 
	map <leader>Z :sp<space>/home/estefano/.config/zsh/.zshrc<CR>
	map <leader>z :vsp<space>/home/estefano/.config/zsh/.zshrc<CR>
	map <leader>st :vsp<space>/usr/local/src/luke_st/config.h<CR> <bar> :lcd<space>%:p:h<CR>
	map <leader>cst :!sudo<space>make<space>clean<space>install<CR>
	map <leader>dwm :vsp<space>/home/estefano/.install/dwm-6.2/config.h<CR> <bar> :lcd<space>%:p:h<CR>
	map <leader>cdwm :!sudo<space>make<space>clean<space>install<CR>
	map <leader>short :sp<space>/home/estefano/.config/shortcutrc<CR>
	map <leader>dirnm :sp<space>/home/estefano/.config/zshnameddirrc<CR>
" OPEN SPLITS MORE EASILY
	nnoremap <leader>h :split<space>
	nnoremap <leader>v :vsp<space>
" use <tab> for trigger completion and navigate to the next complete item IMPORTANT use :verbose imap <keyname> to see what is a key mappd to 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" USE c-space TO TRIGGER COC COMPLETION
inoremap <silent><expr> <c-space> coc#refresh()
" SOME NERDTREE SETTINGS
	nmap <C-f> :NERDTreeToggle<CR>
	autocmd vimenter * NERDTree
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	let NERDTreeShowHidden=0
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" vimtex - start server automatically
    if empty(v:servername) && exists('*remote_startserver')
      call remote_startserver('VIM')
    endif
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" TRY TO AUTOCOMPILE LATEX
""autocmd BufWritePost *.tex silent! execute "!pdflatex main.tex >/dev/null 2>&1" | redraw!
nnoremap <leader>C :!pdflatex main.tex >/dev/null 2>&1<CR> | redraw!
"nnoremap <leader>B :!pdflatex main.tex >/dev/null 2>&1<CR> && pkill -HUP mupdf | redraw!
nnoremap <leader>Z :!zathura %:r.pdf & disown<CR> | redraw!
"add silent! after *.tex in order to push output to background 

" import python dicts
"autocmd FileType python set complete+=k/home/estefano/.config/dicts/rkulla-pydiction-41c7143/pydiction-0.5/pydiction isk+=.,(

" HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
" HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
" SOME TEXT MANIPULATION MAPPINGS
map <Space><Space> <Esc>/<++><Enter>"_c4l
" HTML
autocmd FileType html inoremap ;i <em></em><Space><Esc>FeT>i
autocmd FileType html inoremap ;b <b></b><Space><Esc>FbT>i
autocmd FileType html inoremap ;p <p></p><Enter><Enter><Esc>2ki
" LaTeX
autocmd FileType tex inoremap ;pkg \usepackage{}F{a

" CHANGE CURSOR COLOR
let &t_SI = "\<Esc>]12;orange\x7"
let &t_EI = "\<Esc>]12;red\x7"
"did not work well

" SET COLORSCHEME
"colorscheme codedark
"let g:airline_theme = 'codedark'

" outdated try to open pdf from name in vim
"nnoremap <leader>p 0wy$:!zathura "<C-R>"<BS>" & disown<CR><CR> 
map <leader>q 0wyf.:!zathura "<C-R>"<BS>.pdf" & disown<CR>
map <leader>a :!killall zathura<esc>0f"ya":!zathura <C-R>" & disown<CR><CR>i<space><BS><ESC>00<space><space>

" ENABLE TO WRITE INTO READ ONLY FILES
cnoremap sudow w !sudo tee % >/dev/null
cnoremap sw w !sudo tee % >/dev/null | redraw!
" still needs sudo access, sadly :( 
""""""""""""""""""""""""""""""""""""
