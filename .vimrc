" slaz's vimrc

if has("gui_running")
    " gui mode colors
    "hi NonText gui=bold 
    "hi Text guifg=black 
    "hi Constant guifg=red
    "highlight Comment guifg=#80a0ff gui=bold
    set gfn=DejaVu\ Sans\ Mono\ 9
    set lsp=1
    set background=dark
"    set guioptions=agimrtbT
else
    "terminal mode colors
    highlight Comment term=bold ctermfg=Cyan 
    set background=dark
endif

syntax on

" general settings 
set ww=<,>,[,]
set number
set autoindent
set cindent
set history=1000
set ruler
set incsearch
set smartindent
set smarttab
set wrapscan

set hlsearch
" coding standards....
" no tabs in files, tab size = 4 spaces..
" set softtabstop=4
set tabstop=4
set ts=4
set shiftwidth=4
set expandtab
" don't make it look like there are line breaks where there aren't:
"set nowrap
" turn off beeps and flash instead
set vb
" no error bells
set noeb
" show tabs and white spaces at the end of lines
 set lcs=tab:>-,trail:-
set nolist

" set cursorline


" SYNTAX STUFF FOR CODING..

" this is for the you have to do CTRL-L to refresh the screen so that 
" the commented code will show up commented
let c_minlines = 300  
set comments=sl:/*,mb:*,elx:*/

" keep x number of lines above/below cursor while scrolling
set so=4
" keep x number of columns left/right cursor while scrolling
set siso=4

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=99

" wtf is this wildmode shit anyway?
set wildmode=list:longest,full 

set makeprg=make
" display the current mode and partially-typed commands in the status line:
"set showmode
"set showcmd

" NOT USED ANYMORE, BufferExplorer is the best
" map the tab key to 'bn'  
nmap <c-tab> :if &modifiable && !&readonly && &modified <cr> :w<cr> :endif<cr> gt<cr>
	
" mapped key strokes
if bufwinnr(1)
	map + <C-W>+
	map - <C-W>-
endif

" setup Tlist
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
set updatetime=2000
" remap f8 key
nnoremap <silent> <F4> :Tlist<CR>


" tab completion! :) thanks Marco!
function! InsertTabWrapper(direction) 
      let col = col('.') - 1 
      if !col || getline('.')[col - 1] !~ '\k' 
          return "\<tab>" 
      elseif "backward" == a:direction
          return "\<c-p>" 
      else 
          return "\<c-n>" 
      endif 
endfunction 

inoremap <tab> <c-r>=InsertTabWrapper("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("backward")<cr>

source ~/.vim/colors/desertEx.vim

" ooh darren's doing tricks!
au BufRead,BufNewFile *.html set filetype=php

set tags=~/.vim/mytags/framework
