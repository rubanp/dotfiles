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
set conceallevel=2
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

Plug 'neoclide/jsonc.vim' " https://github.com/neoclide/jsonc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " https://github.com/neoclide/coc.nvim
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
Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
Plug 'preservim/vim-markdown' " https://github.com/preservim/vim-markdown
Plug 'preservim/tagbar' " https://github.com/preservim/tagbar
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes' " https://github.com/vim-airline/vim-airline-themes
Plug 'airblade/vim-rooter' " https://github.com/airblade/vim-rooter
Plug 'jonsmithers/vim-html-template-literals' "https://github.com/jonsmithers/vim-html-template-literals
Plug 'pangloss/vim-javascript' " https://github.com/pangloss/vim-javascript
Plug 'unblevable/quick-scope' " https://github.com/unblevable/quick-scope
Plug 'brooth/far.vim' " https://github.com/brooth/far.vim
Plug 'Xuyuanp/nerdtree-git-plugin' " https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'PhilRunninger/nerdtree-visual-selection' " https://github.com/PhilRunninger/nerdtree-visual-selection
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
Plug 'SirVer/ultisnips' " https://github.com/SirVer/ultisnips
Plug 'vim-scripts/loremipsum' " https://github.com/vim-scripts/loremipsum
Plug 'dhruvasagar/vim-open-url' " https://github.com/dhruvasagar/vim-open-url
Plug 'jiangmiao/auto-pairs' " https://github.com/jiangmiao/auto-pairs
Plug 'alvan/vim-closetag' " https://github.com/alvan/vim-closetag
Plug 'simeji/winresizer' " https://github.com/simeji/winresizer
Plug 'easymotion/vim-easymotion' " https://github.com/easymotion/vim-easymotion
Plug 'mattn/emmet-vim' " https://github.com/mattn/emmet-vim
Plug 'edkolev/tmuxline.vim' " https://github.com/edkolev/tmuxline.vim
Plug 'kyazdani42/nvim-web-devicons' " https://github.com/kyazdani42/nvim-web-devicons
Plug 'ryanoasis/vim-devicons' " https://github.com/ryanoasis/vim-devicons
Plug 'honza/vim-snippets' " https://github.com/honza/vim-snippets
Plug 'ap/vim-css-color' " https://github.com/ap/vim-css-color
Plug 'hail2u/vim-css3-syntax' " https://github.com/hail2u/vim-css3-syntax
Plug 'andymass/vim-matchup' " https://github.com/andymass/vim-matchup
Plug 'lukas-reineke/indent-blankline.nvim' " https://github.com/lukas-reineke/indent-blankline.nvim
Plug 'Yggdroot/indentLine' " https://github.com/Yggdroot/indentLine
Plug 'jbyuki/venn.nvim' " https://github.com/jbyuki/venn.nvim
Plug 'dhruvasagar/vim-table-mode' " https://github.com/dhruvasagar/vim-table-mode
Plug 'zackhsi/fzf-tags' " https://github.com/zackhsi/fzf-tags
Plug 'ludovicchabant/vim-gutentags' " https://github.com/ludovicchabant/vim-gutentags
Plug 'mhinz/vim-grepper' " https://github.com/mhinz/vim-grepper

call plug#end()

" =======
" |theme|
" =======

colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_medium'
set background=dark
set termguicolors
highlight clear SignColumn

" Make javascript files syntax highlight as typescript
augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile,BufRead *.js set syntax=typescript
augroup END

" Specific Highlight Colours
hi Folded guibg=#282828 guifg=#949494 
hi DiffAdd guifg=#282828 guibg=#98971a
hi DiffDelete guifg=#282828 guibg=#cc241d
hi DiffChange guifg=#282828 guibg=#458588
hi FoldColumn guibg=#282828

" ===========
" |shortcuts|
" ===========

" Move between tabs
nnoremap <tab> :tabprevious<cr>
nnoremap <s-tab> :tabnext<cr>

" Quickly paste in insert mode
inoremap <C-l> <C-r>0

" Quickly Navigate Buffers
nnoremap <Right> :silent bn<cr> :redraw!<cr>
nnoremap <Left> :silent bp<cr> :redraw!<cr>

" Create ascii font
vnoremap <leader>1  d:r!figlet <C-r>1<cr>

" Toggle signcolumn
nnoremap <silent>,s :call ToggleSignColumn()<cr>

function! ToggleSignColumn()
  if !exists("b:signcolumn_on") || b:signcolumn_on
    set signcolumn=no
    let b:signcolumn_on=0
  else
    set signcolumn=number
    let b:signcolumn_on=1
  endif
endfunction

" Reload buffer
nnoremap <Leader>k :e!<cr>

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

" Toggle viewing fold column
nnoremap <silent>† :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=2
  endif
endfunction

" Turn off search highlighting
nnoremap <silent> <esc><esc> :nohlsearch<cr>

" Add new line below
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<cr>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<cr>

"Remove all trailing whitespace
nnoremap <silent><Leader>0 :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><cr>

" Toggle Conceal Level
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>

" Replace
nnoremap ,r :%s///g<Left><Left>
nnoremap ,rc :%s///gc<Left><Left><Left>
xnoremap ,r :%s///g<Left><Left>
xnoremap ,rc :%s///gc<Left><Left><Left>

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

" Gutentags
let g:gutentags_add_default_project_roots = 0
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
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
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
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" Tagbar
nnoremap ,5 :TagbarToggle<cr>

" Table Mode
let g:table_mode_corner='|'

" Venn
nnoremap <silent><leader>2 :set ve=all<cr>
vnoremap <silent> <C-l> :VBox<cr>

" Limelight
nnoremap <silent>,l :Limelight!!<cr>
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'

" IndentLine
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
let g:goyo_width= '50%'

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
  hi FoldColumn guibg=#282828
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
  hi Folded guibg=#282828 guifg=#949494 
  hi DiffAdd guifg=#282828 guibg=#98971a
  hi DiffDelete guifg=#282828 guibg=#cc241d
  hi DiffChange guifg=#282828 guibg=#458588
  hi FoldColumn guibg=#282828
  highlight clear SignColumn
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

" HTML Syntax Highlighting
" ========================
let g:htl_css_templates = 1
let g:html_indent_style1 = "inc"
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,typescript'
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion,litHtmlRegion',
      \ 'javascript.jsx': 'jsxRegion,litHtmlRegion',
      \ 'javascript':     'litHtmlRegion',
      \ 'typescript':     'litHtmlRegion',
      \ }

" Jsonc
" =====
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" EasyMotion
" ==========
map <Leader><Leader> <Plug>(easymotion-prefix)

" Rainbow Parentheses
" ===================
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow_active = 1

" Quickscope
" ==========
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Ultisnips
" =========
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories=['snips']

" Far.vim
" =======
let g:far#auto_preview = 1
let g:far#enable_undo = 1

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

" Nerd Tree
" =========
let NERDTreeShowBookmarks=1
nnoremap ,b :Bookmark<cr>
nnoremap <silent><c-k> :NERDTreeToggle<cr>
let g:NERDTreeGitStatusShowClean = 1
let NERDTreeIgnore = ['node_modules']

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
" ==========
let g:rooter_patterns = ['.git']
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

" Dev Icons
" =========
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Emmet
" =====
let g:user_emmet_leader_key=','

" CoC
" ====
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-css', 'coc-eslint', 'coc-tsserver', 'coc-snippets', 'coc-prettier', 'coc-sql', 'coc-sh', 'coc-stylelintplus']
autocmd FileType css setl iskeyword+=-

autocmd FileType markdown let b:coc_suggest_disable = 1

" ==Diagnostics Navigation==
nmap <silent>]g <Plug>(coc-diagnostic-prev)
nmap <silent>[g <Plug>(coc-diagnostic-next)

" ==GoTo code navigation==
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ==Show Documentation==
nnoremap <silent> K :call <SID>show_documentation()<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ==Symbol renaming==
nmap ,rn <Plug>(coc-rename)

" ==CocList Mappings==
" option + d
nnoremap <silent><nowait> ∂  :<C-u>CocList diagnostics<cr>
" option + o
nnoremap <silent><nowait> ø  :<C-u>CocList outline<cr>

" ==Coc Git==
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)

" ==Coc Airline Settings==
let airline#extensions#coc#error_symbol = 'Error: '
let airline#extensions#coc#warning_symbol = 'Warning: '
