:syntax on

" Fern nerdfont
let g:fern#renderer = "nerdfont"

" Removes show mode for lightline and sets color scheme
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [['']]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline#bufferline#enable_devicons=1

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set foldmethod=indent
set foldlevel=20

if !has('gui_running')
  set t_Co=256
endif

set noshowmode
set showtabline=2

" Color Scheme for vim
colorscheme gruvbox
let g:material_theme_style='darker' " 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'

" Fix italics in Vim
if !has('nvim')
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif

let g:material_terminal_italics=1
set background=dark " For dark theme
" set background=light " For light theme

let g:netrw_banner = 0

" Setting up key bindings.
map <Leader>e :Fern .<CR>
map <Leader>h :Fern . -opener=split<CR>
map <Leader>v :Fern . -opener=vsplit<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <Leader>ws <C-w>s
map <Leader>wv <C-w>v
map <Leader>wt :to vnew<CR>
map <Leader>wb :bo vnew<CR>
map <Leader>q :q<CR>
map <Leader>x :bw<CR>
map <Leader>c :w<CR>
map <Leader>s :b 
map <Leader>n :bn<CR>
map <Leader>p :bp<CR>
map <Leader>i :PymodeRopeAutoImport<CR>

set splitbelow
set splitright

" Allowing backspace over things we cannot backspace over.
set backspace=indent,eol,start

" Tabs into spaces
set tabstop=2 shiftwidth=2 expandtab

" Line numbering
set number


" Lines below the last status line
set laststatus=2

" Time vim waits after typing to trigger plugin
set updatetime=750

" Word wrapping
set wrap
set linebreak
set textwidth=0
set wrapmargin=0
set formatoptions-=t

" Set up python 
let g:pymode_virtualenv_path = './venv'
let g:pymode_rope_completion_bind = '<C-y>'
let g:pymode_rope_autoimport = 1

" 24bit color support

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
