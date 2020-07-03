" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        autocmd VimEnter * PlugUpdate --sync | source $MYVIMRC
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif


call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'

" utilities
Plug 'tpope/vim-abolish'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'junegunn/goyo.vim' " Distraction-free writing in Vim
" Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'vim-scripts/mru.vim' "provides an easy access to a list of recently opened/edited files in Vim
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim https://www.braintreepayments.com/blog/vimux-simple-vim-and-tmux-integration/
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'w0rp/ale' " Asynchonous linting engine
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'airblade/vim-gitgutter' " shows a git diff in the 'gutter' (sign column)
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-vinegar' " netrw helper
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'SirVer/ultisnips' " Snippets plugin
Plug 'honza/vim-snippets' " Snippets files for various programming languages, doesn't seem to work
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-syntastic/syntastic' " A syntax checking plugin
Plug 'easymotion/vim-easymotion' " Vim motions on speed! https://code.tutsplus.com/tutorials/vim-essential-plugin-easymotion--net-19223
Plug 'wahidrahim/resize-font'  " Resize font https://vimawesome.com/plugin/resize-font
Plug 'neomake/neomake' " Provide asynchronous to run programs
Plug 'ton/vim-bufsurf' " Vim plugin that enables surfing through buffers based on viewing history per window.:bp | :bn
Plug 'christoomey/vim-tmux-navigator' "Seamless navigation between tmux panes and vim splits
Plug 'godlygeek/tabular' " Vim script for text filtering and alignment. See: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/




" IDE stuffs
Plug 'ervandew/supertab' " supertab makes tab work with autocomplete and ultisnips
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Provides Async autocomplete with Tern
Plug 'majutsushi/tagbar' "  provides an easy way to browse the tags of the current file and get an overview of its structure
" Plug 'vim-vdebug/vdebug' "Debugger client for Vim



" Note for install YouComplete
" Due to file size, it is recommended to download the plugin and compile it locally
" git clone git@github.com:Valloric/YouCompleteMe.git
" then run python ./install.py --clang-completer --tern-completer
" I would prefer if there's an alternative for this (deoplete.nvim)
"
" Plug '~/.dotfiles/config/nvim/plugged/YouCompleteMe', { 'do': 'python ./install.py --clang-completer --tern-completer' }

" html / templates
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx'] } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mustache/vim-mustache-handlebars' " mustach support
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] } " pug / jade support

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }

" TypeScript
" Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
" Plug 'angelozerr/tslint-language-service', { 'for': 'typescript' }
" Plug 'Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'npm install' }

" Elm
" Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

" Ruby
" Plug 'tpope/vim-endwise', { 'for': 'ruby' } " automatically add end in ruby

" CoffeeScript
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }

" styles
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'gko/vim-coloresque'

" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " Markdown Vim Mode See: https://github.com/plasticboy/vim-markdown



" language-specific plugins
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'timcharper/textile.vim', { 'for': 'textile' } " textile support

" twig template
Plug 'nelsyeung/twig.vim'

" drupal
Plug 'https://git.drupal.org/project/vimrc.git', { 'branch': '8.x-1.x', 'rtp': 'bundle/vim-plugin-for-drupal' }

" Letex
Plug 'lervag/vimtex'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()
