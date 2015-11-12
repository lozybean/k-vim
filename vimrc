let mapleader = ','
let g:mapleader = ','
syntax on
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
filetype plugin indent on
set history=2000
set autoread
set shortmess=atI
set nobackup
set noswapfile
if has('persistent_undo')
  set undolevels=1000
  set undoreload=10000
  set undofile
  set undodir=/tmp/vimundo/
endif
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
set mouse-=a
set selection=inclusive
set selectmode=mouse,key
set title
set novisualbell
set noerrorbells
set t_vb=
set tm=500
set viminfo^=%
set magic
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set cursorcolumn
set cursorline
set ruler
set showcmd
set showmode
set scrolloff=7
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2
set number
set showmatch
set matchtime=2
nnoremap / /\v
vnoremap / /\v
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap # *
nnoremap * #
noremap <silent><leader>/ :nohls<CR>
set hlsearch
set ignorecase
set smartcase
set foldenable
set foldmethod=indent
set foldlevel=99
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun
set smartindent   " Smart indent
set autoindent    " 打开自动缩进
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set shiftround
set hidden
set wildmode=list:longest
set ttyfast
set nrformats=
inoremap # X<c-h>#
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m
set formatoptions+=B
autocmd! bufwritepost .vimrc source %
set completeopt=longest,menu
set wildmenu
set wildignore=*.o,*~,*.pyc,*.class
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabm<cr>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
let g:last_active_tab = 1
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
noremap <F1> <Esc>"
function! HideNumber()
  if(&number)
    set number!
  else
    set number!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
set pastetoggle=<F5>
au InsertLeave * set nopaste
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap H ^
noremap L $
vnoremap < <gv
vnoremap > >gv
vnoremap v <ESC>
nnoremap <leader>v <C-v>
map Y y$
map <Leader>sa ggVG"
nnoremap <leader>sb V`}
cmap w!! w !sudo tee >/dev/null %
inoremap kj <Esc>
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap ' `
nnoremap ` '
nnoremap U <C-r>
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd
autocmd BufRead,BufNew *.R,*.r,*.Rtp,*.rtp,*.rscript,*.Rscript set filetype=r
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
noremap <silent><leader>rs :call <SID>StripTrailingWhitespaces()<CR>
if has("autocmd")
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif
if has("gui_running")
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
	if has("gui_macvim")
		set guifont=Bitstream_Vera_Sans_Mono:h14:cANSI
	endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
	set mouse=a
endif
if has("gui_macvim")
	set imdisable
endif
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
set background=dark
set t_Co=256
colorscheme Tomorrow-Night-Bright
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1
