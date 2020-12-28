if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let g:polyglot_disabled = [
            \'sensible',
            \'markdown.plugin',
            \'python',
            \'vue',
            \'javascript']


call plug#begin('~/.vim/plugged')
" install language packs, but disable any you hand tweak
Plug 'sheerun/vim-polyglot'
" extended %
Plug 'andymass/vim-matchup'
" add new targets to vim eg c2i)
Plug 'wellle/targets.vim'
" allows seemles navigation of vim and tmux splits
Plug 'christoomey/vim-tmux-navigator'
" tmux config syntax highlight
Plug 'whatyouhide/vim-tmux-syntax'
" command to align text (never used it yet, learn or remove)
Plug 'junegunn/vim-easy-align'
" better surrounds than tpope's
Plug 'machakann/vim-sandwich'
" swap delimited items
Plug 'machakann/vim-swap'
" git integration from tpope 
" (as commandline but :G instead of git, % is current file)


" ##### GIT #######
Plug 'tpope/vim-fugitive'
" bitbucket plugin for fugitive
Plug 'tommcdo/vim-fubitive'
Plug 'tpope/vim-rhubarb'
" fugitive plugin for branch management
Plug 'sodapopcan/vim-twiggy'
" commit browser plugin for fugitive
Plug 'junegunn/gv.vim'


" n_ctrl-x/a work as expected for dates, roman numerals etc.
Plug 'tpope/vim-speeddating'
" makes speeddating repeatable
Plug 'tpope/vim-repeat'
" does stuff to vim sessions
Plug 'tpope/vim-obsession'
" simple comment facilities
Plug 'tpope/vim-commentary'
" " completion engine 
" Plug 'Valloric/YouCompleteMe'
" " syntax checker
" Plug 'scrooloose/syntastic'
" file browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" this provides the autosave toggle
Plug '907th/vim-auto-save'
" snipets for UltiSnips
Plug 'honza/vim-snippets'
" Plug 'sirver/UltiSnips'
" fuzzy finder for vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" generate tags for jumping between latex tags and others
" requires https://askubuntu.com/questions/796408/installing-and-using-universal-ctags-instead-of-exuberant-ctags 
Plug 'ludovicchabant/vim-gutentags' 
" binds some stuff to tab
Plug 'ervandew/supertab'
" clears searches smarter
Plug 'junegunn/vim-slash'
" visualize undo trees
Plug 'sjl/gundo.vim'
" doesn't open misspelled files
Plug 'einfachtoll/didyoumean'
" dispatch commands in the background
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
" asynchronous linting
Plug 'dense-analysis/ale'
" LSP implementation
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
" switch between multiple lines and single lines
Plug 'AndrewRadev/splitjoin.vim'
" rename files command
Plug 'danro/rename.vim'

"
" the below plugins are support for languages
"
" Emmet is for expanding html stuff
Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" required by vim-markdown but easy-align is probably better
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'  
Plug 'othree/html5.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'elzr/vim-json'
Plug 'jupyter-vim/jupyter-vim'
" PYTHON
" python syntax
Plug 'vim-python/python-syntax'
" python code folding
Plug 'tmhedberg/SimpylFold'
" python textobjects
Plug 'jeetsukumaran/vim-pythonsense'
'

" this is a theme
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Do no close buffers when opening new buffer on top
set hidden

set updatetime=750
" autoread to read stuff change outside of vim and the au to trigger it when
" moving around
set autoread
au FocusGained,BufEnter * :silent! !

" Set compatibility to Vim only (i.e. no vi)
set nocompatible

" Wait less for keypresses and stuff?
set ttimeout
set ttimeoutlen=100

" show possibilities when using tab in command mode
set wildmenu

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines (this is a security feature)
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" this makes wrap not break words
set linebreak


" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set expandtab

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" show command you are typing
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers, but relative to current line
set number relativenumber

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> Í @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space>< zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=$HOME/.cache/vim/undo
set undofile
set noswapfile
set backup
set backupdir=$HOME/.cache/vim/backup
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')
endif
if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')
endif

" always be where the file is
" set autochdir

" powerline
set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
set showtabline=2
set noshowmode

" make splits open on the right side
set splitright

set mouse=a
" drag and drop in vim
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
  end

" ros setup
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch

" vue setup
let g:vim_vue_plugin_load_full_syntax = 1

" coc sets this to the one below
" set completeopt=menu,longest,popup

" ALE
let g:ale_disable_lsp = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\	'python': ['pylint']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines','trim_whitespace'],
\   'python': ['black', 'isort']
\}


" COC
let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-vetur',
\ 'coc-pyright',
\ 'coc-snippets',
\ 'coc-tag',
\ 'coc-tsserver']



" did you mean will use fzf
let g:dym_use_fzf = 1

colorscheme dracula
" this disable the jupyter-vim bindings
let g:jupyter_mapkeys = 0

" python-syntax highlightsetting
let g:python_highlight_all = 1
" run :PlugInstall to install stuff
" need to have npm and yarn for markdown preview

let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
" let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2

" emmet might be absolutely useless and just use snippets?
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall

" my own remap
let mapleader = "\<space>"
let maplocalleader = "\<space>"

" autosave normally saves on exiting insertmode, which is slow
let g:auto_save_events = ["WinLeave","BufLeave","CursorHold"]

" US keyboard layout like maps for HUN keyboard
set langmap=\
            \ő[,
            \Ő{,
            \ú],
            \Ú},
            \á',
            \Á@,
            \é`,
            \ű#,
            \Ű~,
            \ö^,
            \ü<,
            \ó>

nmap ő [
nmap ú ]
omap ő [
omap ú ]
xmap ő [
xmap ú ]
nmap úq :cnext<cr>
nmap őq :cprev<cr>
nmap őQ :cfirst<cr>
nmap úQ :clast<cr>

" set nolangremap
nmap gü <Plug>(swap-prev)
nmap gó <Plug>(swap-next)
" vim swap text objects 
omap i, <Plug>(swap-textobject-i)
xmap i, <Plug>(swap-textobject-i)
omap a, <Plug>(swap-textobject-a)
xmap a, <Plug>(swap-textobject-a)

" buffers
noremap <leader>n :bn<cr> " next buffer
noremap <leader>p :bp<cr> " previous buffer 
noremap <leader>d :bd<cr> " quit buffer 
noremap <leader>, :b#<cr> " alternate buffer

" better escape and exiting when using arrows
inoremap jk <Esc>
inoremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>

" Tpope Session
" start auto saving sessions, tmux needs the default name Session.vim
noremap <leader>ss :Obsession <cr> 
noremap <leader>sl :source Session.vim <cr> " load session

" Dispatch
au FileType python nnoremap <Leader>r :Dispatch python3 %<CR>

" Fugitive
nnoremap <leader>gs :G<cr>

" fzf bindings
let g:fzf_command_prefix = 'Fzf'
noremap <leader>fb :FzfBuffers<cr>
noremap <leader>ff :FzfFiles<cr>
noremap <leader>fg :FzfGitFiles<cr>
noremap <leader>ft :FzfTags<cr>
noremap <leader>fr :FzfRg<cr>
noremap <leader>fm :FzfMarks<cr>
noremap <leader>fl :FzfLines<cr>
noremap <leader>fw :FzfWindows<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': ':r !echo'}

let g:gundo_prefer_python3 = 1

" clear search highlight TODO: might not need it anymore
nnoremap <leader>m :noh<cr>

"wrap 
nnoremap <leader>w :set wrap!<cr>

" this also has a sideeffect of Q NOT taking you to ex mode
nnoremap Q :qa<CR>

" jk will work visually except when taking a count
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>


" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
set pastetoggle=<F2>
" nnoremap <F3> :SyntasticToggleMode<CR>
nnoremap <F3> :ALEToggle<CR>
nnoremap <F4> :AutoSaveToggle<CR>
nnoremap <F5> :setlocal spell! spelllang=en_gb,hu<CR>
nnoremap <F6> :GundoToggle<CR>

" coc and ale bindings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>cn <Plug>(coc-rename)

nmap <leader>co :CocFzfList outline <CR>
nmap <leader>cl :CocFzfList <CR>
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
" Use K to show documentation in preview window.
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
let g:coc_snippet_prev = '<c-k>'
let g:coc_snippet_next = '<c-j>'
imap <C-l> <Plug>(coc-snippets-expand)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <leader>lf <Plug>(ale_fix)
nmap <leader>lj <Plug>(ale_next_wrap)
nmap <leader>lk <Plug>(ale_previous_wrap)
nmap <leader>le <Plug>(ale_next_wrap_error)
nmap <leader>lr <Plug>(ale_previous_wrap_error)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" spelling
nnoremap zz z=
nnoremap <leader>z 1z=

" Ctrl-c copies to system keyboard in visual
vmap <C-C> "+y


" Ctrl-p pastes the last yank
nnoremap <leader>p "0p
nnoremap <leader>v "+p
nnoremap <leader>d "_dd
nnoremap <leader>o o<ESC>"+p
nnoremap <leader>gp "0gp
nnoremap <leader>gv "+gp


" json
let g:vim_json_syntax_conceal = 0

" nerdtree mapping to ctrl n
nnoremap <C-n> :NERDTreeToggle<CR>

" use tee to write file if I forgot to sudo
cmap w!! w !sudo tee > /dev/null %
" ##### GIT #######

let g:twiggy_close_on_fugitive_command = 1
let g:twiggy_split_position = 'topleft'


" vimtex setup
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_fold_enabled = 1
" let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'

" usage of vimtex
" - need to start vim with `vim --servername vim`: should add alias
" - run :VimtexCompile to start compilation

let g:SuperTabDefaultCompletionType = '<C-n>'

" au FileType python exe "normal zR"

set nofoldenable
" set some marks in vue files for easy navigation
au FileType vue silent! call s:set_vue_marks()
function! s:set_vue_marks()
    if search("data()","w") 
        mark d
    endif
    if search("methods:","w") 
        mark m
    endif
    if search("mounted()","w") 
        mark l
    endif
endfunction

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
augroup vue
    au!
    au FileType vue setlocal foldmethod=expr
augroup END
set title
set titlestring=%(%m%)%(%{expand(\"%:~\")}%)
