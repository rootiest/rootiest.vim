"
" =====================================================================
" =========================== KICKSTART.VIM ===========================
" =====================================================================
"
" Kickstart.vim is a template for *your* Vim configuration.
" You should read every line of the code and understand what it is doing.
" Afterwards, you can configure and tinker with vimrc.
"
" Vim's built-in help, triggered by `:help X` is a very helpful guide for any
" of the Vim's built-in features as well as plugins.
"
" Kickstart.vim is heavily inspired by Kickstart.nvim.
" If you are using Neovim, consider using Kickstart.nvim instead:
" https://github.com/nvim-lua/kickstart.nvim
"
" Feel free to delete this comment once you feel that this config is "yours."
" I hope you enjoy your Vim journey!
" - Theo
"


" Set <space> as the leader key
" See `:help mapleader`
"  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
let mapleader=' '
let maplocalleader = ' '


" Install package manager
" https://github.com/junegunn/vim-plug/
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" NOTE: Here is where you install your plugins.
call plug#begin()

" Git related plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Detect tabstop and shiftwidth automatically
Plug 'tpope/vim-sleuth'

" Use <Tab> to auto complete
Plug 'ervandew/supertab'

" Useful plugin to show you pending keybinds.
Plug 'liuchengxu/vim-which-key'

" Adds git related signs to the gutter
Plug 'airblade/vim-gitgutter'

" Theme inspired by Atom
Plug 'joshdick/onedark.vim'

" Set airline as statusline
Plug 'vim-airline/vim-airline'

" Add indentation guides even on blank lines
Plug 'Yggdroot/indentLine'

" "gc" to comment visual regions/lines
Plug 'tpope/vim-commentary'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" [[ Setting default options ]]
" These are some of the settings enabled by default in Neovim.
" These are options believed by many Vim users to be essential.
" Find the list of the options here:
" https://neovim.io/doc/user/vim_diff.html#nvim-defaults

" Automatically detect filetype 
filetype on

" Turn on syntax highlighting
syntax on

" Automatically indent : Detect when the file is changed externally
set autoindent autoread

" Dark mode for colorschemes : Change backspace behavior
set background=dark backspace=indent,eol,start

" Turn off vi compatibility : Display @@@ in the last column of last line
set nocompatible display=lastline

" Set encoding : Allow opening other files w/o saving current (make it hidden)
set encoding=utf-8 hidden

" Highlight search result as you type : Always show statusline
set incsearch laststatus=2

" Characters to display for tab, trail spaces, etc., used if `:set list` is on
set listchars=tab:>\ ,trail:-,nbsp:+
"set list

" Show line and column number in the statusline (overriden by airline)
set ruler

" Show stuff like number of lines selected in the bottom right
set showcmd

" Use shiftwidth for the line indent and (soft)tabstop for others
"  NOTE: See `:help tabstop` to learn how tabs in Vim work
set smarttab

" Completion menu for command (:)
set wildmenu


" [[ Settings options ]]
" NOTE: You can change these options as you wish!

" Set highlight on search
set nohlsearch

" Make line numbers default
set number

" Enable mouse mode
set mouse=a

" Sync clipboard between OS and Neovim.
"  Remove this option if you want your OS clipboard to remain independent.
"  See `:help 'clipboard'`
set clipboard=unnamedplus

" Enable break indent
set breakindent

" Save undo history
"  By default, undo files (.file.txt.un~) are saved in the current directory.
"  This makes the file system very messy, so undofile is disabled by default.
"  If would like to enable undofile, I recommend you to change undodir:
"  1. Create the undo directory: `:! mkdir -p ~/.local/state/vim/undo`
"  2. Uncomment the following line starting with "set undodir" and save the file
"  3. Source the .vimrc: `:source ~/.vimrc`
"  4. Now undo history will persist between Vim sessions
"
"  NOTE: See `:help undofile` and `:help undodir` for more information
"    You may change the undodir to another directory you prefer
"set undodir=~/.local/state/vim/undo// undofile

" Case-insensitive searching UNLESS \C or capital in search
set ignorecase
set smartcase

" Keep signcolumn on by default
set signcolumn=yes

" Decrease update time
set updatetime=250
set timeoutlen=300

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect

" NOTE: You should make sure your terminal supports this
set termguicolors


" [[ Basic Keymaps ]]

" Keymaps for better default experience
nnoremap <silent> <Space> <Nop>
xnoremap <silent> <Space> <Nop>

" Remap for dealing with word wrap
nmap <expr> <silent> k v:count == 0 ? 'gk' : 'k'
nmap <expr> <silent> j v:count == 0 ? 'gj' : 'j'


" [[ Configure plugins ]]
" Make <Space> trigger key map guide
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Set color scheme
colorscheme onedark
" Characters to render for indentation guide
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


" [[ Configure fzf.vim ]]
" See `:help fzf-vim`

" [?] Find recently opened files
nmap <leader>? :History<CR>
" [ ] Find existing buffers
nmap <leader><space> :Buffers<CR>
" [/] Fuzzily search in current buffer
nmap <leader>/ :BLines<CR>
" Search [G]it [F]iles
nmap <leader>gf :GFiles<CR>
" [S]earch [F]iles
nmap <leader>sf :Files<CR>
" [S]earch [H]elp
nmap <leader>sh :Helptags<CR>

" [[ Configure built-in keyword completion ]]
" Set Omni Completion
"  See `:help compl-omni` and `:help omnifunc`
set omnifunc=syntaxcomplete#Complete

" Enter key confirms the current selection when completion is open
inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'

" [[ Personal settings for development ]]
" TODO Remove this in the release
set list
inoremap jk <ESC>

" The line beneath this is called `modeline`. See `:help modeline`
" vim: ts=2 sts=2 sw=2 et
