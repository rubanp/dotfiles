" Leader
let mapleader=" "
nnoremap <SPACE> <Nop>

" Basics
set spelllang=en_gb
set textwidth=80
filetype plugin indent on
syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set incsearch
set hlsearch
let @/ = ''
set ignorecase
set smartcase
set formatoptions-=cro
set nolist
set noshowmatch
set splitbelow
set splitright
set conceallevel=0
set concealcursor=inc
set autochdir
set tags=tags
set number
set relativenumber
set linebreak
set fo=tcrwa
set shada=!,'100,<50,s10,h
set foldmethod=manual
set foldlevel=99
let g:loaded_perl_provider = 0
set nomodeline

" Quickly paste in insert mode
inoremap <C-l> <C-r>0

" Replace visually selected text
vnoremap ,r y:%s/<c-r>0//gc<Left><Left><Left>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<cr>
      \gvy/<C-R>=&ic?'\c':'\C'<cr><C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
      \gVzv:call setreg('"', old_reg, old_regtype)<cr>
vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<cr>
      \gvy?<C-R>=&ic?'\c':'\C'<cr><C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
      \gVzv:call setreg('"', old_reg, old_regtype)<cr>
nnoremap <silent> ,* viW:<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<cr>
      \gvy/<C-R>=&ic?'\c':'\C'<cr><C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
      \gVzv:call setreg('"', old_reg, old_regtype)<cr>
nnoremap <silent> ,# viW:<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<cr>
      \gvy?<C-R>=&ic?'\c':'\C'<cr><C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<cr><cr>
      \gVzv:call setreg('"', old_reg, old_regtype)<cr>

" Better Movement
nnoremap j gj
nnoremap k gk
nnoremap k :<C-u>call rpcrequest(g:vscode_channel, 'vscode-command', 'cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
nnoremap j :<C-u>call rpcrequest(g:vscode_channel, 'vscode-command', 'cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
nnoremap 0 g0
nnoremap _ g_
nnoremap $ g$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Yank till end of line
nnoremap Y yg_

" Move Text (using Option + j: ∆ and Option + k:˚)
vnoremap <silent>∆ :m '>+1<cr>gv=gv
vnoremap <silent>˚ :m '<-2<cr>gv=gv
nnoremap <silent>∆ :m .+1<cr>==
nnoremap <silent>˚ :m .-2<cr>==
inoremap <silent>∆ <esc>:m .-2<cr>==gi
inoremap <silent>˚ <esc>:m .+1<cr>==gi

" Fast Replacement
nnoremap cn *``cgn
nnoremap cN *``cgN

" Set marks with 'gm' instead of 'm'
nnoremap gm m

" Add new line below
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<cr>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<cr>

"Remove all trailing whitespace
nnoremap <silent><Leader>0 :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><cr>

" Toggle Conceal Level
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>

" Yank into system clipboard
nnoremap <Leader>y "*y
vnoremap <Leader>y "*y

" Select all
nnoremap <Leader>z ggVG$

" Move up & Pad Top
nnoremap <Leader>u z<Enter>5k5j

