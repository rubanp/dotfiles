" ============================================
"
" |settings|
" |plugins|
" |theme|
" |shortcuts|
" |plugin-settings|
"
" ============================================

" ==========
" |settings|
" ==========

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

" Folding
function! MyFoldText()
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')
  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" =========
" |plugins|
" =========

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-abolish' " https://github.com/tpope/vim-abolish
Plug 'tpope/vim-speeddating' " https://github.com/tpope/vim-speeddating
Plug 'tpope/vim-eunuch' " https://github.com/tpope/vim-eunuch
Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary
Plug 'tpope/vim-fugitive' " https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround
Plug 'tpope/vim-repeat' " https://github.com/tpope/vim-repeat
Plug 'junegunn/vim-easy-align' " https://github.com/junegunn/vim-easy-align
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " https://github.com/junegunn/fzf
Plug 'junegunn/fzf.vim' " https://github.com/junegunn/fzf.vim
Plug 'junegunn/goyo.vim' " https://github.com/junegunn/goyo
Plug 'junegunn/limelight.vim' " https://github.com/junegunn/limelight.vim
Plug 'svermeulen/vim-subversive' " https://github.com/svermeulen/vim-subversive
Plug 'svermeulen/vim-yoink' " https://github.com/svermeulen/vim-yoink
Plug 'svermeulen/vim-cutlass' " https://github.com/svermeulen/vim-cutlass
Plug 'neoclide/jsonc.vim' " https://github.com/neoclide/jsonc.vim
Plug 'preservim/vim-markdown' " https://github.com/preservim/vim-markdown
Plug 'preservim/tagbar' " https://github.com/preservim/tagbar
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes' " https://github.com/vim-airline/vim-airline-themes
Plug 'airblade/vim-rooter' " https://github.com/airblade/vim-rooter
Plug 'pangloss/vim-javascript' " https://github.com/pangloss/vim-javascript
Plug 'dhruvasagar/vim-open-url' " https://github.com/dhruvasagar/vim-open-url
Plug 'alvan/vim-closetag' " https://github.com/alvan/vim-closetag
Plug 'simeji/winresizer' " https://github.com/simeji/winresizer
Plug 'edkolev/tmuxline.vim' " https://github.com/edkolev/tmuxline.vim
Plug 'ap/vim-css-color' " https://github.com/ap/vim-css-color
Plug 'zackhsi/fzf-tags' " https://github.com/zackhsi/fzf-tags
Plug 'ludovicchabant/vim-gutentags' " https://github.com/ludovicchabant/vim-gutentags
Plug 'jiangmiao/auto-pairs' " https://github.com/jiangmiao/auto-pairs
Plug 'neoclide/coc.nvim', {'branch': 'release'} " https://github.com/neoclide/coc.nvim
Plug 'leafOfTree/vim-vue-plugin' " https://github.com/leafOfTree/vim-vue-plugin'
Plug 'mattn/emmet-vim' " https://github.com/mattn/emmet-vim

call plug#end()

" =======
" |theme|
" =======

colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_medium'
set background=dark
set termguicolors

" Make javascript files syntax highlight as typescript
augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile,BufRead *.js set syntax=typescript
augroup END

" Change formatting for markdown
autocmd FileType markdown 
      \ set formatoptions-=q |
      \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Specific Highlight Colours
hi Folded guibg=#282828 guifg=#949494
hi DiffAdd guifg=#282828 guibg=#98971a
hi DiffDelete guifg=#282828 guibg=#cc241d
hi DiffChange guifg=#282828 guibg=#458588
hi CocUnusedHighlight ctermbg=NONE guibg=NONE guifg=#949494
hi Search guibg=#ffffff guifg=#949494
hi CocErrorSign guibg=#282828 guifg=#cc241d
hi CocWarningSign guibg=#282828 guifg=#fabd2f
hi CocInfoSign guibg=#282828 guifg=#98971a
hi CocHintSign guibg=#282828 guifg=#458588

" Transparent Background
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! SignColumn guibg=NONE
hi FoldColumn guibg=NONE

highlight clear SignColumn

" ===========
" |shortcuts|
" ===========

" Bold text in markdown
nnoremap ,b gvS*

" Save page
nnoremap <C-s> :w<cr>
nnoremap <C-b> :q<cr>

" Align whole page
nnoremap <leader>= gg=G

" Move between tabs
nnoremap <tab> :tabprevious<cr>
nnoremap <s-tab> :tabnext<cr>

" Move between buffers
nnoremap <Right> :silent bn<cr> :redraw!<cr>
nnoremap <Left> :silent bp<cr> :redraw!<cr>

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

" Turn off search highlighting
nnoremap <silent> <esc><esc> :nohlsearch<cr>

" Toggle fold column
nnoremap <silent>† :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=2
  endif
endfunction

" Toggle signcolumn
nnoremap <silent>,s :call ToggleSignColumn()<cr>

function! ToggleSignColumn()
  if !exists("b:signcolumn_on") || b:signcolumn_on
    set signcolumn=no
    let b:signcolumn_on=0
  else
    set signcolumn=auto
    let b:signcolumn_on=1
  endif
endfunction

" Toggle number column
nnoremap <silent>,n :call ToggleNumberColumn()<cr>

function! ToggleNumberColumn()
  if !exists("b:numbercolumn_on") || b:numbercolumn_on
    set nonumber
    set norelativenumber
    let b:numbercolumn_on=0
  else
    set number
    set relativenumber
    let b:numbercolumn_on=1
  endif
endfunction

" Reload buffer
nnoremap <Leader>k :e!<cr>

" Better Movement
nnoremap j gj
nnoremap k gk
nnoremap gk :<C-u>call rpcrequest(g:vscode_channel, 'vscode-command', 'cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
nnoremap gj :<C-u>call rpcrequest(g:vscode_channel, 'vscode-command', 'cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
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

" =================
" |plugin-settings|
" =================

" Table Mode
" ==========
let g:table_mode_corner='|'

" Venn
" ====
nnoremap <silent><leader>2 :set ve=all<cr>
vnoremap <silent> <C-l> :VBox<cr>

" Limelight
" =========
nnoremap <silent>,l :Limelight!!<cr>
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'

" IndentLine
" ==========
function! ToggleIndents()
  if !exists("b:indents_on") || b:indents_on
    :IndentLinesDisable
    :IndentBlanklineDisable
    let b:indents_on=0
  else
    :IndentLinesEnable
    :IndentBlanklineEnable
    let b:indents_on=1
  endif
endfunction

nnoremap <silent>,i :call ToggleIndents()<cr>

let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 0

" EasyAlign
" =========
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fzf
" ====
let g:fzf_preview_window = ['right:70%:hidden', 'ctrl-/']

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.9, 'relative': v:true } }

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
      \ 'source': s:list_buffers(),
      \ 'sink*': { lines -> s:delete_buffers(lines) },
      \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
      \ }))

nnoremap <Leader>p :Buffers<cr>
nnoremap <Leader>B :BD<cr>
nnoremap <Leader>W :Windows<cr>
nnoremap <Leader>l :BLines<cr>
nnoremap <Leader>L :Lines<cr>
nnoremap <Leader>R :Rg<cr>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>g :GFiles<cr>
nnoremap <Leader>G :GFiles?<cr>
nnoremap <Leader>h :History:<cr>
nnoremap <Leader>H :History<cr>
nnoremap <Leader>/ :History/<cr>
nnoremap <Leader>b :BTags<cr>
nnoremap <Leader>T :Tags<cr>
nnoremap <Leader>c :BCommits<cr>
nnoremap <Leader>C :Commits<cr>
nnoremap <Leader>E :Helptags<cr>
nnoremap <Leader>q :Snippets<cr>
nnoremap <Leader>m :Marks<cr>
nnoremap <Leader>M :Maps<cr>

" WinResizer
" ==========
nnoremap <Leader>w :WinResizerStartResize<cr>

" Goyo
" =====
nnoremap <silent> ,g :silent! Goyo<cr>

let g:goyo_height= '70%'
let g:goyo_width= '70%'

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  hi Normal guibg=NONE ctermbg=NONE
  set number
  set relativenumber
  set signcolumn=yes
  let b:signcolumn_on=1
  hi Folded guibg=#282828 guifg=#949494
  hi DiffAdd guifg=#282828 guibg=#98971a
  hi DiffDelete guifg=#282828 guibg=#cc241d
  hi DiffChange guifg=#282828 guibg=#458588
  hi CocUnusedHighlight ctermbg=NONE guibg=NONE guifg=#949494
  hi Search guibg=#ffffff guifg=#949494
  hi FoldColumn guibg=#282828
  hi SignColumn guibg=#282828
  hi CocErrorSign guibg=#282828 guifg=#cc241d
  hi CocWarningSign guibg=#282828 guifg=#fabd2f
  hi CocInfoSign guibg=#282828 guifg=#98971a
  hi CocHintSign guibg=#282828 guifg=#458588
  highlight clear SignColumn
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  hi Normal guibg=NONE ctermbg=NONE
  set norelativenumber
  set nonumber
  set signcolumn=no
  let b:signcolumn_on=0
  hi Folded guibg=#2e333f guifg=#949494
  hi DiffAdd guifg=#2e333f guibg=#98971a
  hi DiffDelete guifg=#2e333f guibg=#cc241d
  hi DiffChange guifg=#2e333f guibg=#458588
  hi CocUnusedHighlight ctermbg=NONE guibg=NONE guifg=#949494
  hi Search guibg=#ffffff guifg=#949494
  hi FoldColumn guibg=#2e333f
  hi SignColumn guibg=#2e333f
  hi CocErrorSign guibg=#2e333f guifg=#cc241d
  hi CocWarningSign guibg=#2e333f guifg=#fabd2f
  hi CocInfoSign guibg=#2e333f guifg=#98971a
  hi CocHintSign guibg=#2e333f guifg=#458588
  highlight clear SignColumn
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

" HTML Syntax Highlighting
" ========================
let g:htl_css_templates = 1
let g:html_indent_style1 = "inc"

" Jsonc
" =====
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" EasyMotion
" ==========
map ;k <Plug>(easymotion-prefix)

" Rainbow Parentheses
" ===================
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow_active = 1

" Quickscope
" ==========
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Vim Cutlass
" ===========
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" Vim Yoink
" =========
nnoremap <leader>Y :Yanks<cr>
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkMoveCursorToEndOfPaste = 1
let g:yoinkSwapClampAtEnds = 1
let g:yoinkSavePersistently = 1

" Vim Subversive
" ==============
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

" Vim Rooter
" ==========
let g:rooter_patterns = ['.git', 'node_modules']
let g:rooter_change_directory_for_non_project_files = 'current'

" Airline
" =======
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_left_sep = "\uE0B0"
let g:airline_right_sep = "\uE0B2"
let g:airline#extensions#tabline#alt_sep = 1
let g:airline_stl_path_style = 'short'
let g:airline_section_c_only_filename = 1
let g:airline_section_c = "%{expand('%:p:h:t')}"
let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'error', 'warning' ] ]
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0

" Emmet
" =====
let g:user_emmet_leader_key=','

" Coc
" ====
let g:coc_global_extensions = ['coc-marketplace', 'coc-json', 'coc-git', 'coc-tsserver', 'coc-emmet', 'coc-prettier', 'coc-pairs', '@yaegassy/coc-volar']

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use enter to trigger completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
