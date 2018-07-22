"""""""""""""""""""""""""""""""""""""""""""""""""
""" Basic Info
"""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Bennett Rennier
" Edited by : Ahmed Khaled
" Website: http://brennier.com
" Description: My general vim configuration file


"""""""""""""""""""""""""""""""""""""""""""""""""
""" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""

set showcmd
set laststatus=2          " Status bar enable by default
set splitright            " Makes sure that new windows open on the right
set splitbelow            " Makes sure that new windows open on the bottom
set showmatch             " Show matching brackets when text indicator is over them
"set nohlsearch           " Highlight search results (TODO fix searching for 'd' in latex)
set smartcase             " be smart about cases when searching
set hid                   " hide buffer
set autoread              " update if the file is changed from the outside
set mouse=a               " Enable mouse
set foldmethod=marker     " Auto-fold tripe braces
"set colorcolumn=80        " Add a line at column 80
"set cursorcolumn          " Highlight the cursor column
set noshowmode           " Don't show what mode I'm in
set clipboard=unnamedplus " Use the OS clipboard for yanking/pasting
set textwidth=80          " Hard limit for the length of a line

" Show trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
" match BadWhitespace /\s\+$/


""""""""""""""""""""""""""""""""""""
""" Colors, Fonts, and Encodings
""""""""""""""""""""""""""""""""""""

" text file encoding/format
set fileformat=unix
set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8

set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm

syntax on
filetype plugin indent on


""""""""""""""""""
" Tab and Spaces
""""""""""""""""""

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


"""""""""""
" Backups
"""""""""""

set nobackup
set noswapfile


""""""""""""""""""""""""
" Status Line Settings "
""""""""""""""""""""""""

set statusline=»\ File:\    " Label
set statusline+=%t          " Show path to the file
set statusline+=\ %M        " Show path to the file
set statusline+=\ \\       " Separator
set statusline+=Type:\      " Label
set statusline+=%y          " Show filetype
set statusline+=%=          " Switch to the right side
set statusline+=%l          " Show line number
set statusline+=/           " Separator
set statusline+=%-4L        " Show total number of lines
set statusline+=\\         " Separator
set statusline+=%3p%%\ «     " Show percentage

hi statusline ctermfg=green
augroup statusline
    autocmd!
    au InsertLeave * hi statusline ctermfg=green
    au InsertEnter * hi statusline ctermfg=darkcyan
augroup END


""""""""""""""
" Remappings
""""""""""""""

nmap <F8> :TagbarToggle<CR>
" Getting out of the terminal emulator
" tnoremap <Esc> <C-\><C-n>
nnoremap Y y$
nnoremap X d^
nnoremap gj V}Jse<BS><CR><ESC>
nnoremap : :<C-f>i
nnoremap <silent>gi :call Preserve("normal! gg=G")<CR>
nnoremap <silent>gw :call WordProcessorMode()<CR>
nnoremap Q @q
"inoremap <silent> m <C-r>=EscapeSequence()<CR>
nnoremap Z zz


"""""""""""""""""""""""
" Leader Key Mappings "
"""""""""""""""""""""""

let mapleader = ' '
nnoremap <leader><leader> <C-z>
nnoremap <leader>n  :set number! relativenumber!<CR>
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>ep :call OpenFile(g:vimtexer)<CR>
nnoremap <leader>ez :call OpenFile("$HOME/.zshrc")<CR>
nnoremap <leader>ex :call OpenFile("$HOME/.xinitrc")<CR>
nnoremap <leader>ei :call OpenFile("$HOME/.i3/config")<CR>
nnoremap <leader>u  :call Preserve("normal! Ypv$r-k")<CR>
nnoremap <leader>f  za
nnoremap <silent> <leader>p :put=py3eval(getline('.'))<CR>
nnoremap <silent> <leader>t :call Term('')<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>S :w !sudo tee %<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" Window commands
nnoremap <leader>v  :vsp<CR>
nnoremap <leader>vt :vsp<CR>:terminal<CR><C-\><C-n>
nnoremap <leader>vo :call fzf#run({'source':'find ~/', 'right': winwidth('.')/2, 'sink':'vertical botright split'})<CR>

nnoremap <leader>V  :split<CR>
nnoremap <leader>Vt :split<CR>:terminal<CR><C-\><C-n>
nnoremap <leader>Vo :call fzf#run({'source':'find ~/', 'down':'40%', 'sink':'botright split'})<CR>

nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>

" Git Commands
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush origin master<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gl :Glog<CR>

" Music Commands
nnoremap <leader>ms  :silent !mplayer ~/Audio/Playlist/*<CR>
nnoremap <leader>mp  :silent !echo "pause" > /home/brennier/Pipes/media_control<CR>
nnoremap <leader>mq  :silent !echo "quit" > /home/brennier/Pipes/media_control<CR>
nnoremap <leader>mvm :silent !echo "set_property volume 0" > /home/brennier/Pipes/media_control<CR>
nnoremap <leader>mvu :silent !echo "volume +5" > /home/brennier/Pipes/media_control<CR>
nnoremap <leader>mvd :silent !echo "volume -5" > /home/brennier/Pipes/media_control<CR>

" Other Commands
nnoremap <leader>T :NERDTreeToggle<CR>
"nnoremap <leader>f :call Translate()<CR>
"nnoremap <leader>T :call TranslateLine()<CR>
nnoremap <leader>F :call Format()<CR>
nnoremap <leader>y  "+y
"nnoremap <leader>a :call AddToFrenchFile()<CR>


""""""""""""""
" My Plugins
""""""""""""""

"Plugin
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'let-def/vimbufsync'
Plug 'jiangmiao/auto-pairs'
Plug 'lucas8/coquille', { 'branch': 'pathogen-bundle' }
Plug 'python-mode/python-mode'  "python awesome plugin
Plug 'fatih/vim-go'             "Golang Run and debug plugin
Plug 'lekv/vim-clewn'           "GDB (Gnu DeBugger plugin) for alot of lang.
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
call plug#end()


"""""""""""""""""
" Plugin Config
"""""""""""""""""

"{{{ Quicktex Setup
"
"let g:quicktex_trigger = "\t"

" let g:quicktex_cpp = {
"             \'boiler' : "#include <iostream>\<CR>using namespace std;\<CR>\<CR>int main(int argc, char **argv) {\<CR><+++>\<CR>\<CR>\<BS>return 0;\<CR>}",
"             \'func' : "<+++> <+Name+>(<+Arguments+>) {\<CR><+Content+>\<CR>}",
"             \' '    : "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
" \}


" let g:quicktex_python = {
"             \'boiler' : "#include <iostream>\<CR>using namespace std;\<CR>\<CR>int main(int argc, char **argv) {\<CR><+++>\<CR>\<CR>\<BS>return 0;\<CR>}",
"             \'def'    : "def <+++>(<+Arguments+>):\<CR><++>",
"             \'if'     : "if <+++>:\<CR><++>\<CR>\<BS><++>",
"             \'el'     : "elif <+++>:\<CR><++>\<CR>\<BS><++>",
"             \'else'   : "else:\<CR><+++>\<CR>\<BS><++>",
"             \'p'      : "(<+++>) <++>",
"             \'for'    : "for <+++> in <++>:\<CR><++>",
"             \'r'      : "return <+++>",
"             \'t'      : "#TODO: <+++>",
"             \'bin'    : "#!/user/bin/python\<CR><+++>",
"             \'bin3'   : "#!/user/bin/python3\<CR><+++>",
"             \'cl'     : "## <+++> #############################################################",
"             \' '      : "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
" \}

" let g:quicktex_html = {
"             \'boiler' : "#include <iostream>\<CR>using namespace std;\<CR>\<CR>int main(int argc, char **argv) {\<CR><+++>\<CR>\<CR>\<BS>return 0;\<CR>}",
"             \'tag'    : "\<BS>\<ESC>ByWi<\<ESC>Ea><+++></\<ESC>pa>",
" \}

" let g:quicktex_markdown = {
"             \'b'      : "**<+++>**",
"             \'i'      : "*<+++>*",
"             \' '      : "\<ESC>/<+.*+>\<CR>\"_c/+>/e\<CR>",
" \}
"}}}

""" pymode
let g:pymode = 1    "Turn on whole plug
let g:pymode_rope = 0   "Turn off rope support
let g:pymode_trim_whitespaces = 1   "remove unused white space on save
let g:pymode_lint = 0 "trun of code checking with pylint
let g:pymode_python='python3'

""" Syntastic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""
" Misc
""""""""

" Ignore files that vim doesn't use
set wildignore+=.git,.hg,.svn
set wildignore+=.steam,.cache
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*


" Close vim if NerdTree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Only show extra whitespace in normal mode
" autocmd! InsertEnter * set nolist
" autocmd! InsertLeave * set list
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

"if &term =~ "konsole"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif

" Command for auto-setting up my windows
command! -register DefaultWorkspace call DefaultWorkspace()

" Some abbreviations for words that I commonly misspell
iabbrev teh the
iabbrev taht that
iabbrev tehn then
iabbrev adn and
iabbrev ive I've
iabbrev dont don't
iabbrev isnt isn't
iabbrev seperate separate
iabbrev waht what


"{{{ Compile Commands
nnoremap <leader>c :Compile<CR>
"map <F5> : !gcc % ; ./a.out; rm a.out <CR>
command Compile execute('call Compile()')

let g:compileCommand = {
            \'cpp'    : 'g++ % ; ./a.out; rm a.out',
            \'c'    : 'gcc % ; ./a.out; rm a.out',
            \'python' : 'python3 %',
            \}

function Compile()
    let ft = &ft
    if ft ==# 'tex'
        LLPStartPreview
        return
    elseif ft ==# 'go'
        GoRun
        return
    else
        " split
        " resize 13
        execute('! '.g:compileCommand[ft])
    endif
endfunction
