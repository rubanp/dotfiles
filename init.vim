" ============================================
"
" |basics|
" |plugins|
" |theme|
" |functions|
" |autocommands|
" |shortcuts|
" |plugin-settings|
" |coc-config|
"
" ============================================

" |basics|
" ========

set spelllang=en_gb
filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set incsearch
set hlsearch
let @/ = ''
set ignorecase
set smartcase
set formatoptions-=cro
set nolist
set noshowmatch
let mapleader=" "
nnoremap <SPACE> <Nop>
set splitbelow
set splitright
set conceallevel=2
set concealcursor=inc
set autochdir
set tags=tags
set number
set relativenumber
set linebreak
set fo=tcrwa
set shada=!,'100,<50,s10,h
set foldmethod=indent
set foldlevel=99

" Better Movement
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Yank till end of line
nnoremap Y yg_

" Better Undo
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap [ [<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

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

" Easier Ctrl-w (option-w)
nnoremap ∑ <C-w>

" |plugins|
" =========

call plug#begin('~/.config/nvim/plugged')

Plug 'lervag/vimtex' " https://github.com/lervag/vimtex

Plug 'tpope/vim-abolish' " https://github.com/tpope/vim-abolish

Plug 'tpope/vim-speeddating' " https://github.com/tpope/vim-speeddating

Plug 'tpope/vim-repeat' " https://gihtub.com/tpope/vim-repeat

Plug 'neoclide/jsonc.vim' " https://github.com/neoclide/jsonc.vim

Plug 'Yggdroot/indentLine' " https://github.com/Yggdroot/indentLine

Plug 'lukas-reineke/indent-blankline.nvim' " https://github.com/lukas-reineke/indent-blankline.nvim

Plug 'tpope/vim-dadbod' " https://github.com/tpope/vim-dadbod

Plug 'kristijanhusak/vim-dadbod-ui' " https://github.com/kristijanhusak/vim-dadbod-ui

Plug 'AndrewRadev/tagalong.vim' " https://github.com/AndrewRadev/tagalong.vim

Plug 'ap/vim-css-color' " https://github.com/ap/vim-css-color

Plug 'glepnir/dashboard-nvim' " https://github.com/glepnir/dashboard-nvim

Plug 'unblevable/quick-scope' " https://github.com/unblevable/quick-scope

Plug 'gcmt/taboo.vim' " https://github.com/gcmt/taboo.vim

Plug 'brooth/far.vim' " https://github.com/brooth/far.vim

Plug 'svermeulen/vim-subversive' " https://github.com/svermeulen/vim-subversive

Plug 'svermeulen/vim-yoink' " https://github.com/svermeulen/vim-yoink

Plug 'svermeulen/vim-cutlass' " https://github.com/svermeulen/vim-cutlass

Plug 'airblade/vim-rooter' " https://github.com/airblade/vim-rooter

Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree

Plug 'Xuyuanp/nerdtree-git-plugin' " https://github.com/Xuyuanp/nerdtree-git-plugin

Plug 'PhilRunninger/nerdtree-visual-selection' " https://github.com/PhilRunninger/nerdtree-visual-selection

Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " https://github.com/tiagofumo/vim-nerdtree-syntax-highlight

Plug 'junegunn/vim-easy-align' " https://github.com/junegunn/vim-easy-align

Plug 'SirVer/ultisnips' " https://github.com/SirVer/ultisnips

Plug 'honza/vim-snippets' "https://github.com/honza/vim-snippets

Plug 'tpope/vim-fugitive' " https://github.com/tpope/vim-fugitive

Plug 'ludovicchabant/vim-gutentags' " https://github.com/ludovicchabant/vim-gutentags

Plug 'neoclide/coc.nvim', {'branch': 'release'} " https://github.com/neoclide/coc.nvim

Plug 'vim-scripts/loremipsum' " https://github.com/vim-scripts/loremipsum

Plug 'tpope/vim-eunuch' " https://github.com/tpope/vim-eunuch

Plug 'dhruvasagar/vim-open-url' " https://github.com/dhruvasagar/vim-open-url

Plug 'jiangmiao/auto-pairs' " https://github.com/jiangmiao/auto-pairs

Plug 'junegunn/goyo.vim' " https://github.com/junegunn/goyo.vim

Plug 'alvan/vim-closetag' " https://github.com/alvan/vim-closetag

Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary

Plug 'simeji/winresizer' " https://github.com/simeji/winresizer

Plug 'kyazdani42/nvim-web-devicons' " https://github.com/kyazdani42/nvim-web-devicons

Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround

Plug 'easymotion/vim-easymotion' " https://github.com/easymotion/vim-easymotion

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " https://github.com/junegunn/fzf

Plug 'junegunn/fzf.vim' " https://github.com/junegunn/fzf.vim

Plug 'mattn/emmet-vim' " https://github.com/mattn/emmet-vim

Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline

Plug 'vim-airline/vim-airline-themes' " https://github.com/vim-airline/vim-airline-themes

Plug 'edkolev/tmuxline.vim' " https://github.com/edkolev/tmuxline.vim

Plug 'ryanoasis/vim-devicons' " https://github.com/ryanoasis/vim-devicons

Plug 'yuezk/vim-js' " https://github.com/yuezk/vim-js

call plug#end()

" |theme|
" =====

" PMenu
set background=dark
colorscheme onehalfdark

let g:airline_theme='papercolor'
set termguicolors
highlight Folded guifg=#694c21

" Make background transparent
highlight Normal guibg=none
highlight NonText guibg=none
highlight LineNr guibg=none
highlight SignColumn guibg=none ctermbg=none
highlight clear SignColumn
highlight CursorLine ctermfg=none guibg=none

" fzf colors
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
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

" |functions|
" ===========

" Open Relative File Links
fun! s:get_visual_selection()
       let l=getline("'<")
       let [line1,col1] = getpos("'<")[1:2]
       let [line2,col2] = getpos("'>")[1:2]
       return l[col1 - 1: col2 - 1]
 endfun
nnoremap <leader>. viby<Esc>:tabedit <C-R>0<cr>
vnoremap <leader>. y<Esc>:tabedit <C-R>0<cr>

" Folding Setup
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

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set showtabline=0
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showtabline=2
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <silent><C-h> :call ToggleHiddenAll()<cr>

function! ToggleSignColumn()
    if !exists("b:numbers_on") || b:numbers_on
        let b:numbers_on=0
        set signcolumn=no
    else
        let b:numbers_on=1
        set signcolumn=yes
    endif
endfunction


" |autocommands|
" ==============
" Start Dashboard when Vim is started without file arguments.
autocmd FileType dashboard call ToggleHiddenAll() | autocmd WinLeave <buffer> call ToggleHiddenAll()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Dashboard | endif

" Goyo Dimensions
let g:goyo_height= '80%'
let g:goyo_width= '80%'

function! s:goyo_leave()
    hi Normal guibg=NONE ctermbg=NONE
    set number
    set relativenumber
    set signcolumn=yes
    let b:signcolumn_on=1
    source ~/Dotfiles/dotfiles/init.vim
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:goyo_enter()
    hi Normal guibg=NONE ctermbg=NONE
    set norelativenumber
    set nonumber
    set signcolumn=no
    let b:signcolumn_on=0
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

" |shortcuts|
" ===========
nnoremap gm m
map q: <Nop>
nnoremap ,q :q<cr>
nnoremap ,w :w<cr>

nnoremap <silent>† :call FoldColumnToggle()<cr>

nnoremap <silent> <esc><esc> :nohlsearch<cr>
nnoremap <silent> ,g :silent! Goyo<cr>
nnoremap <silent><Leader>9 :so ~/Dotfiles/dotfiles/init.vim<cr> :NERDTreeToggle<cr> :NERDTreeToggle<cr>

" Lorem Ipsum
nnoremap ,l :LoremIpsum<space>

" Taboo Rename
nnoremap ,r :TabooRename<space>
nnoremap ,R :TabooReset<cr>

" Add new line below
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

"Remove all trailing whitespace
nnoremap <silent><Leader>0 :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Toggle Conceal Level
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
nnoremap [oe :setlocal conceallevel=<c-r>=&conceallevel > 0 ? &conceallevel - 1 : 0<cr><cr>
nnoremap ]oe :setlocal conceallevel=<c-r>=&conceallevel < 2 ? &conceallevel + 1 : 2<cr><cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Fast Folds
nnoremap <Leader>a za

" fzf
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

nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>B :BD<cr>
nnoremap <Leader>W :Windows<cr>
nnoremap <Leader>dc :Colors<cr>

nnoremap <Leader>l :BLines<cr>
nnoremap <Leader>L :Lines<cr>
nnoremap <Leader>r :Rg<cr>

nnoremap <Leader>f :Files<cr>
nnoremap <Leader>g :GFiles<cr>
nnoremap <Leader>G :GFiles?<cr>

nnoremap <Leader>h :History:<cr>
nnoremap <Leader>H :History<cr>
nnoremap <Leader>/ :History/<cr>

nnoremap <Leader>t :BTags<cr>
nnoremap <Leader>T :Tags<cr>

nnoremap <Leader>c :BCommits<cr>
nnoremap <Leader>C :Commits<cr>

nnoremap <Leader>E :Helptags<cr>

nnoremap <Leader>q :Snippets<cr>

nnoremap <Leader>m :Marks<cr>

nnoremap <Leader>M :Maps<cr>

" Pane Resizing
nnoremap <Leader>w :WinResizerStartResize<cr>

" Search under cursor for selected text
nnoremap * yiW/<C-r>"<CR>
nnoremap # yiW?<C-r>"<CR>
vnoremap * y/<C-r>"<CR>
vnoremap # y?<C-r>"<CR>

" Toggle Sign Column
nnoremap <silent>€ :call ToggleSignColumn()<CR>

" Yank into system clipboard
nnoremap <Leader>y "*y
vnoremap <Leader>y "*y
nnoremap <Leader>A ggVG$"*y<esc>0

" Select all
nnoremap <Leader>z ggVG$

" Move up & Pad Top
nnoremap <Leader>u z<Enter>5k5j

" Tab Movements
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" |plugin-settings|
" =================

" Json
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" Easy motion
map <Leader>; <Plug>(easymotion-prefix)

" Rainbow Parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow_active = 1

" Indent Line
let g:indentLine_enabled = 0
let g:indentLine_char = '|'
let g:indentLine_fileTypeExclude = ["text", "help", "dashboard", "log", "fugitive", "gitcommit", "markdown", "json", "txt", "git", "", "vim", "NERDTree"]
let g:indentLine_bufNameExclude = ["NERD_tree.*"]

" Dashboard
let g:dashboard_default_executive ='fzf.vim'
nnoremap <silent> <Leader>dn :DashboardNewFile<CR>
nnoremap <Leader>ds :SessionSave
nnoremap <Leader>dS :SessionLoad

let g:dashboard_custom_shortcut={
    \ 'book_marks'         : 'SPC n  ',
    \ 'change_colorscheme' : 'SPC d c',
    \ 'find_file'          : 'SPC f  ',
    \ 'find_history'       : 'SPC H  ',
    \ 'find_word'          : 'SPC r  ',
    \ 'last_session'       : 'SPC d S',
    \ 'new_file'           : 'SPC d n'
\ }

let g:dashboard_custom_header = [
    \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" Quickscope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Ultisnips
let g:UltiSnipsExpandTrigger="œ"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Far.vim
let g:far#auto_preview = 1
let g:far#enable_undo = 1

" Vim Cutlass
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

" Vim Yoink
nnoremap <leader>Y :Yanks<cr>

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
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
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
" nmap S <plug>(SubversiveSubstituteToEndOfLine)

nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

" Nerd Tree
let NERDTreeShowBookmarks=1
nnoremap ,b :Bookmark<CR>
nnoremap <silent><leader>n :NERDTreeToggle<CR>
let g:NERDTreeGitStatusShowClean = 1

" Nerd Tree Syntax Highlighting
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:salmon " sets the color of css files to blue

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['html'] = s:blue " sets the color of css files to blue

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['js'] = s:green " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

" Vim Rooter
let g:rooter_patterns = ['.git', 'package.json']
let g:rooter_change_directory_for_non_project_files = 'current'

" Airline
let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"
let g:airline#extensions#tabline#alt_sep = 1
let g:airline_stl_path_style = 'short'
let g:airline_section_c_only_filename = 1
let g:airline_section_c = "%{expand('%:p:h:t')}"
let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'error', 'warning' ] ]
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0

" Taboo.vim
let g:taboo_renamed_tab_format = '%l'

" Refresh Dev Icons on sourcing vimrc
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Emmet
let g:user_emmet_leader_key=','

" Gutentags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_modules=['ctags']
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
            \ '--tag-relative=yes',
            \ '--fields=+ailmnS',
            \ ]
let g:gutentags_ctags_exclude = [
            \ '*.git', '*.svg', '*.hg',
            \ '*/tests/*',
            \ 'dist',
            \ 'bin',
            \ 'cache',
            \ 'compiled',
            \ 'docs',
            \ 'example',
            \ 'bundle',
            \ 'vendor',
            \ '*.md',
            \ '*-lock.json',
            \ '*.lock',
            \ '*bundle*.js',
            \ '*build*.js',
            \ '.*rc*',
            \ '*.json',
            \ '*.min.*',
            \ '*.map',
            \ '*.bak',
            \ '*.zip',
            \ '*.pyc',
            \ '*.class',
            \ '*.sln',
            \ '*.Master',
            \ '*.csproj',
            \ '*.tmp',
            \ '*.csproj.user',
            \ '*.cache',
            \ '*.pdb',
            \ 'cscope.*',
            \ '*.css',
            \ '*.less',
            \ '*.exe', '*.dll',
            \ '*.mp3', '*.ogg', '*.flac',
            \ '*.swp', '*.swo',
            \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
            \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
            \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
            \ ]

" |coc-config|
" ============
hi PMenu guifg=#dcdfe8 guibg=#2f323b
hi CocWarningFloat guifg=#f19746 guibg=#2f323b
hi CocErrorFloat guifg=#ea3524 guibg=#2f323b
hi CocHintFloat guifg=#dcdfe8 guibg=#2f323b
hi CocInfoFloat guifg=#73aae6 guibg=#2f323b

" Diagnostics Navigation
nmap <silent>]g <Plug>(coc-diagnostic-prev)
nmap <silent>[g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Symbol renaming.
nmap ,rn <Plug>(coc-rename)

" CocList Mappings
" option + d
nnoremap <silent><nowait> ∂  :<C-u>CocList diagnostics<cr>
" option + o
nnoremap <silent><nowait> ø  :<C-u>CocList outline<cr>

" Coc Airline Settings
let airline#extensions#coc#error_symbol = 'Error: '
let airline#extensions#coc#warning_symbol = 'Warning: '
