source ~/.config/nvim/plugins.vim

" Section General {{{

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed

set history=1000            " change history to 1000
set textwidth=80

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Please dobule check the path is correct for your python installation
" let g:python_host_prog = '/usr/bin/python'
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
" let g:python3_host_prog = '/Users/huangr/.pyenv/shims/python'
" let g:python3_host_prog = '/Users/huangr/.pyenv/versions/neovim3/bin/python'

if (has('nvim'))
	" show results of substition as they're happening
	" but don't open a split
	set inccommand=nosplit
endif

" }}}

" Section User Interface {{{

syntax on
set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"

" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (has('mac') && empty($TMUX) && has("termguicolors"))
    set termguicolors
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
	let g:onedark_termcolors=16
	let g:onedark_terminal_italics=1

	colorscheme onedark
endif



" set font
set guifont=Source\ Code\ Pro\ for\ Powerline:h18


" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=236
highlight NonText ctermfg=236

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight Comment ctermbg=black
highlight Comment ctermfg=blue
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
highlight Normal ctermbg=none

set number                  " show line numbers
set relativenumber          " turn on relativenumber

" set wrap                    " turn on line wrapping
" set wrapmargin=8            " wrap lines when coming within n characters from side
set nowrap                  " don't wrap lines
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

set autoindent              " automatically set indent of new line
set smartindent

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
set noexpandtab             " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'

" code folding settings
set foldmethod=syntax       " fold based on indent
set foldlevelstart=99
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

set clipboard=unnamed

set ttyfast                 " faster redrawing
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=10             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink


" buffer
set autowrite               "Save on buffer switch

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>




" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

if has('mouse')
	set mouse=a
endif

" }}}

" Section Mappings {{{

" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

" wipout buffer
nmap <silent> <leader>b :bw<cr>


" set paste toggle
set pastetoggle=<leader>v

" disable set paste by default
set nopaste

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

nmap <leader>l :set list!<cr>

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

map <leader>wc :wincmd q<cr>

" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

map <leader>r :call RunCustomCommand()<cr>
" map <leader>s :call SetCustomCommand()<cr>
let g:silent_custom_command = 0

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

command! Rm call functions#Delete()
command! RM call functions#Delete() <Bar> q!


" Remap pane switch. These also work well with tmux pane switch
" when install vim-tmux-navigator plugin. See: https://www.bugsnag.com/blog/tmux-and-vim
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" }}}

" Section AutoGroups {{{
" file type specific settings
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J
    autocmd FileType qf nmap q :q<cr>
augroup END
" }}}

" Section Plugins {{{

" FZF
"""""""""""""""""""""""""""""""""""""
" Toggle NERDTree
function! ToggleNerdTree()
	if @% != "" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
		:NERDTreeFind
	else
		:NERDTreeToggle
	endif
endfunction
map <silent> <Leader>k :call ToggleNerdTree()<CR>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <leader>t :GFiles --cached --others --exclude-standard<cr>
else
    " otherwise, use :FZF
    nmap <silent> <leader>t :FZF<cr>
endif

nmap <silent> <leader>r :Buffers<cr>
nmap <silent> <leader>e :FZF<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

command! -bang -nargs=* Find call fzf#vim#grep(
	\ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
	\ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

" Emmet
"""""""""""""""""""""""""""""""""""""
let g:user_emmet_settings = {
\  'javascript.jsx': {
\      'extends': 'jsx',
\  },
\}

" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>
nmap <leader>* *<c-o>:%s///gn<cr>

let g:ale_change_sign_column_color = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\	'html': []
\}

" YouCompleteMe
"""""""""""""""""""""""""""""""""""""
" let g:ycm_auto_trigger = 0
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_always_populate_location_list = 1
map <Leader>e :YcmDiags<CR>
let g:ycm_error_symbol = '✖'
let g:ycm_warning_symbol = '⚠'
function! s:CustomizeYcmLocationWindow()
	10wincmd _
endfunction
autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

" UltiSnips
"""""""""""""""""""""""""""""""""""""
" Todo: Need to find another mapping for this. I need the <tab> back
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/.dotfiles/"]


" airline options
"""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0
" }}}
"
"

" Quickly edit/reload this configuration file
" nnoremap gev :e $MYVIMRC<CR>
" nnoremap gsv :so $MYVIMRC<CR>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>


" Enable vim autocomplete
" https://docs.oseems.com/general/application/vim/enable-auto-complete
function! InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Vimux integration
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vm :VimuxPromptCommand("make ")<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vl :VimuxRunLastCommand<CR>



" Commentary
autocmd FileType twig setlocal commentstring=#\ %s

" set filetypehttps://github.com/Shougo/deoplete.nvim
autocmd BufRead,BufNewFile *.theme set filetype=php
autocmd BufRead,BufNewFile *.twig set filetype=twig
autocmd BufRead,BufNewFile *.js set filetype=javascript
autocmd BufRead,BufNewFile *.py set unmap <Tab>

" vim-syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ale_emit_conflict_warnings = 0
let g:syntastic_enable_signs = 1
" let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_javascript_checkers = ["jslint"]

" https://michaelthessel.com/syntastic-syntax-checker-for-vim/
let g:syntastic_php_checkers = ["phpcs"]
let g:syntastic_php_phpcs_exec = '~/.composer/vendor/bin/phpcs'
let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme,drupal"
" let g:syntastic_php_phpcs_args = ' --standard=Drupal'
" let g:neomake_php_phpcs_args_standard = 'Drupal'

" A function for adding new linebreak
" http://vim.wikia.com/wiki/Add_a_newline_after_given_patterns
" Insert a newline after each specified string (or before if use '!').
" If no arguments, use previous search.
command! -bang -nargs=* -range LineBreakAt <line1>,<line2>call LineBreakAt('<bang>', <f-args>)
function! LineBreakAt(bang, ...) range
  let save_search = @/
  if empty(a:bang)
    let before = ''
    let after = '\ze.'
    let repl = '&\r'
  else
    let before = '.\zs'
    let after = ''
    let repl = '\r&'
  endif
  let pat_list = map(deepcopy(a:000), "escape(v:val, '/\\.*$^~[')")
  let find = empty(pat_list) ? @/ : join(pat_list, '\|')
  let find = before . '\%(' . find . '\)' . after
  " Example: 10,20s/\%(arg1\|arg2\|arg3\)\ze./&\r/ge
  execute a:firstline . ',' . a:lastline . 's/'. find . '/' . repl . '/ge'
  let @/ = save_search
endfunction


" Font resize mapping
" https://vimawesome.com/plugin/resize-font
map <F11> :ResizeFontSmaller<CR>
map <F12> :ResizeFontBigger<CR>


" Use deoplete.
" It works with python3, and it is better to use pyenv to manage env. Used brew and pip to
" install neovim for python seems problematic.
" See https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
" and https://github.com/Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" Most Recent Used (MRU)
map <leader>mru :MRU<cr>



" Press jj to exit from insert mods jj to exit from insert mode
:imap jj <Esc>


" Less
" autocmd BufWritePost *.less !/Users/huangr/git_repos/nyu-law-d8/scripts/lessc.sh

" Crontab
" Make cronb editable in vim
autocmd filetype crontab setlocal nobackup nowritebackup

" Resize pane mapping
" Control-Shift-Left
noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>.
noremap <silent> <C-S-Up> :resize +1<CR>
noremap <silent> CSDw>:resize -1<CR>.


" Tabular & text align
" See:
"	http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
"	https://gist.github.com/287147
" If you put this in your vimrc file, then it will call the :Tabularize command
" each time you insert a | character.
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
" function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"     Tabularize/|/l1
"     normal! 0
"     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction


if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif


" Markdown
" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
" Remove the TableFormat command, the `:Tab \|` is preferred
autocmd BufRead,BufNewFile *.md delc TableFormat


