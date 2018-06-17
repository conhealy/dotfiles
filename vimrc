" Con Healy's .vimrc file mostly taken from 
" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012
"
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'nakamuray/jedi-rpc.vim'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'

" No longer using YouCompleteMe because it doesn't play so nicely on OSX
" Will switch back to using jedi vim for now
" Plugin 'Valloric/YouCompleteMe'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"-------------------------------------------------------
" END VUNDLE SECTION
"-------------------------------------------------------

" call pathogen at start of file to avoid issues
 call pathogen#infect()

" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %

:imap jk <Esc>

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
 noremap <C-n> :nohl<CR>
 vnoremap <C-n> :nohl<CR>
 inoremap <C-n> :nohl<CR>

" enable using the mouse
set mouse=a

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
 set t_Co=256
 set background=dark
 colorscheme solarized 

 " lines below to undo weird stuff with vim on mac
 let g:solarized_termcolors= 16
 let g:solarized_termtrans = 16
 let g:solarized_bold = 1
 let g:solarized_underline = 1 
 let g:solarized_italic = 1
 let g:solarized_contrast = "high"
 let g:solarized_visibility= "high"



" Enable syntax highlighting
" You need to reload this file for the change to apply
 filetype off
 filetype plugin indent on
 syntax on


" Showing line numbers and length
 set number  " show line numbers
 set tw=79   " width of document (used by gd)
 set nowrap  " don't automatically wrap on load
 set fo-=t   " don't automatically wrap text when typing
 set colorcolumn=80
 highlight ColorColumn ctermbg=233

" Useful settings
 set history=700
 set undolevels=700


 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set shiftround
 set expandtab


" Make search case insensitive
 set hlsearch " highlight all searches
 set incsearch " incremental search 
 set ignorecase
 set smartcase " if a pattern contains an uppercase letter, then the search is
               " case sensitive


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile


" ============================================================================
" Python IDE Setup
" ============================================================================

" I generally install Syntastic also
" But that doesn't require any configuration here yet
"" :let g:syntastic_loc_list_height=3

" NERDTree shortcut
map <C-O> :NERDTreeToggle<CR>

" syntastic setup - does syntax error detection
"" set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
"" set statusline+=%*

""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" set laststatus=2

" Now using vim-airline statusbar
let g:airline#extensions#ale#enabled = 1

" ALE settings for linting
let g:ale_linters = {
\   'python': ['pylint'],
\}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_list_window_size = 5

" search files
" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
 let g:ctrlp_max_height = 30
 set wildignore+=*.pyc
 set wildignore+=*_build/*
 set wildignore+=*/coverage/*



"" settings for jedi vim
" let g:jedi#usages_command = "<leader>z"
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
" filetype plugin on
" set omnifunc=jedi#completions
let g:jedi#force_py_version="auto"
"  map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
"


  " CH - Below creates shorthands for autocomplete commands
  " none of the commands seem to work
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" set completeopt=longest,menuone
" function! OmniPopup(action)
"     if pumvisible()
"         if a:action == 'j'
"             return "\<C-N>"
"         elseif a:action == 'k'
"             return "\<C-P>"
"         endif
"     endif
"     return a:action
" endfunction

" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


 " keys f and F to fold code
" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
 set nofoldenable

