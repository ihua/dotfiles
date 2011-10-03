"based on http://amix.dk/vim/vimrc.html
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on                           "  Enable filetype plugin
set history=1000
set nocompatible
set autoread
let mapleader = ","
let g:mapleader = ","
set ai                                              "  Auto indent
set backspace=eol,start,indent
set cmdheight=2                                     "  The commandbar height
"set cursorline
set encoding=utf8
set expandtab
set fencs=ucs-bom,utf-8,defeault,latin,cp936,gb2312
set ffs=unix,dos,mac                                "  Default file types
set formatoptions=qrn1
set gdefault                                        "  set global substitution
set hid                                             "  Change buffer - without saving
set hlsearch                                        "  Highlight search things
set ignorecase                                      "  Ignore case when searching
set incsearch                                       "  Make search act like search in modern browsers
set lbr
"set list
"set listchars=tab:▸\ ,eol:¬
set magic                                           "  Set magic on, for regular expressions
set mat=2                  "  How many tenths of a second to blink
set modelines=0
set nobackup
set noerrorbells           "  No sound on errors
set nolazyredraw           "  Don't redraw while executing macros
set noswapfile
set novisualbell
set nowb
set nu
set ruler                  "  Always show current position
set shiftwidth=4
set showmatch              "  Show matching bracets when text indicator is over them
set showmode
set si                     "  Smart indet
set smartcase
set smarttab
set so=7
set t_vb=
set tabstop=4
set ttyfast
set tw=80
set whichwrap+=<,>,h,l
set wildmenu               "  Turn on WiLd menu
set wildmode=list:longest
"set wildmode=full:longest
set wrap                   "  Wrap lines
"use very magical regex pattern match
nnoremap  / /\v
vnoremap / /\v
"use tab to move around bracket pairs
nnoremap % <tab>
vnoremap % <tab>
syntax enable 

set shell=/bin/bash

if has("gui_running")
  set guioptions-=T
  set guioptions-=R
  set guioptions-=r
  set guioptions-=L
  set guioptions-=l
  set t_Co=256
  set gfn=Monaco\ 10
  "let g:molokai_original = 1
  set background=dark
  colorscheme molokai
else
  colorscheme zellner
  set background=dark
endif

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" From an idea by Michael Naumann
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d c <C-\>eCurrentFileDir("e")<cr>
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful when moving accross long lines
map j gj
map k gk

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>
map <leader>ce :cd ~/dev<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" Return to last edit position (You want this!) *N*
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif

"Remeber open buffers on close
set viminfo^=%

" Always show the statusline
set laststatus=2

iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set guitablabel=%t

map <leader>c :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>r :MRU<CR>

"fuf file explorer
map <leader>v :FufDir<cr>
map <leader>f :FufFile<cr>

""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>y :CommandTFlush<cr>
"noremap! <leader>j :PeepOpen<cr>
"Pressing ,ss will toggle and untoggle spell checking

""""""""""""""""""""""""""""""
" => tagbar
""""""""""""""""""""""""""""""
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

map <leader>ss :setlocal spell!<cr>
"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au FileType python set omnifunc=pythoncomplete#Complete
au BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

python <<EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" for vim to gf to source code
au FileType python setlocal suffixesadd+=.py
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-e> :py EvaluateCurrentRange()

au BufNewFile,BufRead *.jinja set ft=html
au BufNewFile,BufRead *.j2 set ft=html
au BufNewFile,BufRead *.mako set ft=mako

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


autocmd FileType css set omnifunc=csscomplete#CompleteCSS


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
map <leader>pp :setlocal paste!<cr>
map <leader>bb :cd ..<cr>

nnoremap <leader>e :e! $MYVIMRC<cr>
autocmd! bufwritepost vimrc source $MYVIMRC<cr>
nnoremap <leader>ev <c-w><c-v><c-l>:e $MYVIMRC<cr>
nnoremap <leader>w <c-w>v<c-w>l
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=""<cr>
nnoremap <leader>a :Ack 
map <leader>q :vnew ~/buffer<cr>
nmap <F12> :!ctags -R *<cr>

autocmd FileType cpp set makeprg=g++\ -o\ %<\ %
autocmd FileType c set makeprg=gcc\ -o\ %<\ %
