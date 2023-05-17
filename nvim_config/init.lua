
-- Setting the required configurations
vim.cmd([[

set expandtab ts=4 sw=4 ai
set statusline+=%#warningmsg#
set statusline+=%*

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/opt/homebrew/opt/fz

set tags=./tags
]])
vim.opt.compatible = false
vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.background = "dark"
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.wildmenu = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.backspace = "indent,eol,start"
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.opt.number = true
vim.opt.swapfile = false

-- Install the required plugins 
vim.cmd([[
filetype off                  " required

" set the runtime path to include Vundle and initialize
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/L9'
Plugin 'tpope/vim-surround'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'joonty/vim-taggatron'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mxw/vim-jsx'
Plugin 'junegunn/fzf'
Plugin 'fatih/vim-go'
Plugin 'jremmen/vim-ripgrep'
Plugin 'mileszs/ack.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'lepture/vim-jinja'
Plugin 'hashivim/vim-terraform'
Plugin 'vim-airline/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-bufferline'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'sharkdp/fd'
Plugin 'lewis6991/gitsigns.nvim'

call vundle#end()            " required
" filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
"
]])

-- Autocmds
vim.cmd([[
syntax on

filetype on
filetype plugin on
filetype indent on

autocmd FileType * set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab|set autoindent
autocmd BufNewFile,BufRead *.go setlocal ts=4 sw=4 sts=4
autocmd FileType go setlocal ts=4 sw=4 sts=4
autocmd FileType rs setlocal ts=4 sw=4 sts=4
autocmd FileType python set tabstop=4|set softtabstop=4|set shiftwidth=4|set expandtab|set autoindent
autocmd FileType ruby set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab|set autoindent
autocmd FileType javascript set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab|set autoindent
autocmd FileType css set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab|set autoindent
autocmd FileType scss set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab|set autoindent
autocmd FileType html set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab|set autoindent
autocmd FileType erb set tabstop=2|set softtabstop=2|set shiftwidth=2|set expandtab|set autoindent
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
]])


-- Global config for installed plugins
vim.g.go_fmt_autosave = 1
vim.g["jedi#completions_enabled"] = 0
vim.g["jedi#use_splits_not_buffers"] = "right"
vim.g["python3_host_prog"] = '/Users/gsarma/.pyenv/shims/python3'

-- Key mappings
vim.cmd([[
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap ch :%s/\<<C-r><C-w>\>/
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>
nmap <leader>sn :set number<CR>
nmap <leader>snn :set nonumber<CR>
nmap <leader>pst :set paste<CR>
nmap <leader>npst :set nopaste<CR>

" Toggle NERDTree
nmap <leader>nn :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

" Remove trailing whitespaces
nmap <leader>pw :%s/\s\+$//e<CR>

" Mouse strategy
nmap <leader>mc :set mouse=c<CR>
nmap <leader>ma :set mouse=a<CR>

" Fold strategy
nmap <leader>fi :set foldenable foldmethod=indent<CR>
nmap <leader>fn :set nofoldenable<CR>

" CTags bindings
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Save keybindings
nmap <leader>s :w<CR>
nmap <leader>ss :wq<CR>
imap <leader>s <Esc>:w<CR>i
imap <leader>ss <Esc>:wq<CR>

nnoremap <leader>t :CtrlPTag<return>
nnoremap <leader>h :noh<return><esc>
noremap <leader>a ggVG

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Bindings to find files and find strings
nmap <C-p> :Telescope find_files<CR>
imap <C-p> :Telescope find_files<CR>
nmap <C-f> :Telescope live_grep<CR>
imap <C-f> :Telescope live_grep<CR>
nnoremap <leader>f :execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>

]])

require("telescope_nvim")
require("gitsigns_nvim")