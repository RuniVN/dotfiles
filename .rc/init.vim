" Install the plugin manager if it doesn't exist

syntax on
filetype plugin indent on
let s:plugin_manager='~/.config/autoload/plug.vim'
let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:plugin_manager))
    echom 'vim-plug not found. Installing...'
    if executable('curl')
        silent exec '!curl -fLo ' . s:plugin_manager . ' --create-dirs ' .
                    \ s:plugin_url
    elseif executable('wget')
        call mkdir(fnamemodify(s:plugin_manager, ':h'), 'p')
        silent exec '!wget --force-directories --no-check-certificate -O ' .
                    \ expand(s:plugin_manager) . ' ' . s:plugin_url
    else
        echom 'Could not download plugin manager. No plugins were installed.'
        finish
    endif
    augroup vimplug
        autocmd!
        autocmd VimEnter * PlugInstall
    augroup END
endif

" Create a horizontal split at the bottom when installing plugins
let g:plug_window = 'botright new'

" Additional operating system detection
let s:has_mac = 0
let s:has_arch = 0
let s:has_oracle = 0
if has('unix')
    let s:uname = system('uname -s')
    if s:uname =~? 'Darwin'
        let s:has_mac = 1
    else
        let s:issue = system('cat /etc/issue')
        if s:issue =~? 'Arch Linux'
            let s:has_arch = 1
        elseif s:issue =~? 'Oracle Linux'
            let s:has_oracle = 1
        endif
    endif
endif

call plug#begin()

" --------------------------------------
" Languages & Syntax
" --------------------------------------

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'slashmili/alchemist.vim'

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Replacement
Plug 'tpope/vim-abolish'

" Golang
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go'

" Elm
Plug 'elmcast/elm-vim'

" HTML
Plug 'othree/html5.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'elzr/vim-json'

" CSS
Plug 'ap/vim-css-color'
Plug 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
Plug 'cakebaker/scss-syntax.vim'

Plug 'Shougo/vimshell'
" --------------------------------------
" Tmux
" --------------------------------------
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'

Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'
Plug 'spiegela/vimix'

" --------------------------------------
" Auto complete and snippet
" --------------------------------------

"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" --------------------------------------
" Git
" --------------------------------------
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sjl/gundo.vim'

" --------------------------------------
" NerdTree
" --------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tyok/nerdtree-ack'

" Syntax checker
Plug 'scrooloose/syntastic'

Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

" Others
Plug 'myusuf3/numbers.vim'
Plug 'rizzatti/dash.vim'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
" Plug 'sirver/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'FuzzyFinder'
Plug 'L9'
Plug 'benekastah/neomake'

" Indent guide
Plug 'Yggdroot/indentLine'

"Vim dispatch
Plug 'tpope/vim-dispatch'
" Docker
Plug 'ekalinin/Dockerfile.vim'

" Org mode
" Plug 'jceb/vim-orgmode'
" Plug 'tpope/vim-speeddating'

" Autocompletion
if has('nvim') && has('python3')
    function! DoRemote(arg)
        UpdateRemotePlugins
    endfunction

    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
endif
call plug#end()

filetype plugin on

" -----------------------------------------------------------------------------
" Colors/ Theme
" -----------------------------------------------------------------------------
if !has("gui_running")
    set t_Co=256
    if !has('mac')
        set term=xterm-256color
    endif
endif

set background=dark
"colorscheme base16-eighties

syntax enable
syntax sync minlines=250
if has("syntax")
    syntax on
endif

"-----------------------------------------------------------------------------
" UI
"-----------------------------------------------------------------------------
set ruler                             " show cursor position all the time
set nolazyredraw
set number                            " set line number on
set ch=1                              " command line height
set backspace=indent,eol,start        " backspace through everything in insert mode
set report=0                          " tell us about changes
set guioptions=aegitcm
set mousehide                         " hide mouse after chars typed
set mouse=a                           " mouse in all modes

" No annoying sound on errors
set noerrorbells
set novisualbell
set timeoutlen=500

set showmode
set showcmd
set autowrite
set autoread

"-----------------------------------------------------------------------------
" Mapping keys
"-----------------------------------------------------------------------------
" remap Leader to , instead of \
let mapleader = ","

" format the entire file
map === mmgg=G`m^zz

" a trick for sudo save
cmap w!! w !sudo tee % >/dev/null

inoremap <S-Tab> <C-x><C-l>

" Ctrl + Space to auto complete on local buff
imap <C-Space> <C-P>

" Increase indent / tab of current line
nmap <Leader>] >>
nmap <Leader>[ <<
vmap <Leader>[ <gv
vmap <Leader>] >gv

" Shortcut to select tab
map <Leader>1 1gt
map <Leader>2 2gt
map <Leader>3 3gt
map <Leader>4 4gt
map <Leader>5 5gt
map <Leader>6 6gt
map <Leader>7 7gt
map <Leader>8 8gt
map <Leader>9 9gt

" until we have default MacVim shortcuts this is the only way to use it in insert mode
imap <Leader>1 <esc>1gt
imap <Leader>2 <esc>2gt
imap <Leader>3 <esc>3gt
imap <Leader>4 <esc>4gt
imap <Leader>5 <esc>5gt
imap <Leader>6 <esc>6gt
imap <Leader>7 <esc>7gt
imap <Leader>8 <esc>8gt
imap <Leader>9 <esc>9gt

"-----------------------------------------------------------------------------
" Auto commands
"-----------------------------------------------------------------------------
nmap gt gt<sid>ts
nmap gT gT<sid>ts
nn <script> <sid>ts+ gt<sid>ts
nn <script> <sid>ts- gT<sid>ts
nmap <sid>ts <nop>

"-----------------------------------------------------------------------------
" Text formatting
"-----------------------------------------------------------------------------

set laststatus=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=0
set smarttab
set expandtab
set smartindent
set ttyfast
set autoread
set more
set cursorline!
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows

" Use Unix as the standard file type
set ffs=unix,dos,mac

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.ex :call DeleteTrailingWS()
autocmd BufWrite *.exs :call DeleteTrailingWS()

" Visualize tabs, trailing whitespaces and funny characters
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
" https://wincent.com/blog/making-vim-highlight-suspicious-characters
" set list
" set listchars=nbsp:¬,tab:»·,trail:·
set foldmethod=syntax
set foldnestmax=10
set nofoldenable                        "don't fold by default
set foldlevel=1
set clipboard+=unnamed                  " yanks go on clipboard instead
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

"-----------------------------------------------------------------------------
" Backup
"-----------------------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

"-----------------------------------------------------------------------------
" Visual cues
"-----------------------------------------------------------------------------
" set paste
set showmatch
set incsearch
set magic
set hls                               " Highlighting search result
set ignorecase                        " case insensitive search
set mat=5                             " bracket blinking
set t_vb=

" Starting from vim 7.3 undo can be persisted across sessions
" http://www.reddit.com/r/vim/comments/kz84u/what_are_some_simple_yet_mindblowing_tweaks_to/c2onmqe
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"-----------------------------------------------------------------------------
"set wildmode=list:longest

set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*node_modules*
set wildignore+=*/bower_components/*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/.idea/*

set scrolloff=5         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
autocmd BufWritePre * :%s/\s\+$//e

"  ---------------------------------------------------------------------------
"  When vimrc, either directly or via symlink, is edited, automatically reload it
"  ---------------------------------------------------------------------------
augroup reload_vimrc
    autocmd!
    autocmd! bufwritepost .vimrc nested source %
    autocmd! bufwritepost vimrc nested source %
    autocmd! bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" ---------------------------------------------------------------------------
"  HTML
" ---------------------------------------------------------------------------

let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

" ---------------------------------------------------------------------------
"  SASS / SCSS
" ---------------------------------------------------------------------------
au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

augroup vimrc
    autocmd!

    au BufWritePost vimrc,.vimrc nested if expand('%') !~ 'fugitive' | source % | endif

    " IndentLines
    au FileType slim IndentLinesEnable

    " File types
    au BufNewFile,BufRead Dockerfile*         set filetype=dockerfile

    " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
    au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
    au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/

    " Unset paste on InsertLeave
    au InsertLeave * silent! set nopaste

    " Close preview window
    if exists('##CompleteDone')
        au CompleteDone * pclose
    else
        au InsertLeave * if !pumvisible() && (!exists('*getcmdwintype') || empty(getcmdwintype())) | pclose | endif
    endif

    " Automatic rename of tmux window
    if exists('$TMUX') && !exists('$NORENAME')
        au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
        au VimLeave * call system('tmux set-window automatic-rename on')
    endif
augroup END

" ---------------------------------------------------------------------------
"  Numbers
" ---------------------------------------------------------------------------
nnoremap <F6> :NumbersToggle<CR>
nnoremap <F7> :NumbersOnOff<CR>

" ---------------------------------------------------------------------------
"  Yggdroot/indentLine
" ---------------------------------------------------------------------------
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let g:indentLine_noConcealCursor=""
let g:indentLine_color_dark = 1

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Set python executable
let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python3_host_skip_check = 1

" Dash.app
nmap <silent> <leader>d <Plug>DashSearch

" ---------------------------------------------------------------------------
"  Elm
" ---------------------------------------------------------------------------
let g:elm_format_autosave         = 1
let g:elm_syntastic_show_warnings = 1

" delimitMate
let g:delimitMate_expand_cr=1   " Put new brace on newline after CR

" -----------------------------------------------------------------------------
" Easy Align
" -----------------------------------------------------------------------------

let g:easy_align_ignore_comment = 0 " align comments
vnoremap <silent> <Enter> :EasyAlign<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Tmux
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

exe 'source' '~/.vim-plug/nerdtree.vim'
exe 'source' '~/.vim-plug/syntastic.vim'
exe 'source' '~/.vim-plug/ultisnips.vim'
exe 'source' '~/.vim-plug/tagbar.vim'
exe 'source' '~/.vim-plug/tmux.vim'
exe 'source' '~/.vim-plug/lightline.vim'
exe 'source' '~/.vim-plug/fzf.vim'
exe 'source' '~/.vim-plug/deoplete.vim'
exe 'source' '~/.vim-plug/go.vim'

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

nnoremap <silent> df :GoDef<cr>
nnoremap <silent> ` :noh<cr>
nnoremap <silent> gt :GoTest<cr>
nnoremap <silent> <C-`> :NERDTreeClose<cr>
inoremap <silent> pp pp.Println("")

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2

let g:ghcmod_ghc_options = ['-idir1', '-idir2']
autocmd BufRead,BufNewFile ~/.xmonad/* call s:add_xmonad_path()
function! s:add_xmonad_path()
  if !exists('b:ghcmod_ghc_options')
    let b:ghcmod_ghc_options = []
  endif
  call add(b:ghcmod_ghc_options, '-i' . expand('~/.xmonad/lib'))
endfunction

" easy motion
map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

:imap jj <Esc>
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>

" autocmd! BufWritePost,BufEnter * Neomake
" let g:neomake_open_list = 2
let $FZF_DEFAULT_OPTS = '-m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'
map - :s/^/\/\//<CR>:nohlsearch<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>
" OrgMode Keys
" nnoremap <Leader><Tab> :OrgCheckBoxToggle<CR>
" nnoremap <Leader>nc :OrgCheckBoxNewBelow<CR>
" nnoremap <Leader>nd :OrgDateInsertTimestampActiveCmdLine<CR>
" nnoremap <Leader>td :OrgBufferAgendaTodo<CR>
" nnoremap <Leader>wa :OrgBufferAgendaWeek<CR>
map oo yiw <Plug>(easymotion-sn) <C-R>"
