"""""""""""""""""""""""""""""""""""""""""""""""""
" –––––––––––––––– Basic Info ––––––––––––––––––
"""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Bennett Rennier
" Edited: Ahmed Khaled
" Website: http://brennier.com
" Description: My general vim configuration file

" General Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""
set splitright              " Makes sure that new windows open on the right
set splitbelow              " Makes sure that new windows open on the bottom
set showmatch               " Show matching brackets when text indicator is over them
set smartcase               " be smart about cases when searching
set autoread                " update if the file is changed from the outside
set mouse=a                 " Enable mouse
set foldmethod=marker       " Auto-fold tripe braces
set colorcolumn=100         " Add a line at column 80
set clipboard=unnamedplus   " Use the OS clipboard for yanking/pasting
set nobackup                " Disable backup
set noswapfile
set tbidi
"}}}
" Colors, Fonts, and Encodings {{{
""""""""""""""""""""""""""""""""""""
" text file encoding/format
set fileformat=unix
set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

filetype plugin indent on
" }}}
" Tab and Spaces {{{
""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Visualize tab
set list
set listchars=tab:\│\ ,trail:-,nbsp:.
"}}}
" Status Line Settings {{{
""""""""""""""""""""""""
" Emacs like status line
set statusline=
		\\ [%n]
		\\ %{&readonly\|\|!&modifiable?&modified?'%*':'%%':&modified?'**':'--'}
		\\ %F
		\\:%l:%c
		\%=
		\\ %{&filetype!=#''?&filetype:'none'}
		\\ %{FugitiveStatusline()}
"		\%<\ Col%c%3(%)L%l/%L%2(%)
"		\%6(%p%%\ %)
"}}}
" Remappings {{{
""""""""""""""
" Fast Escape
imap jj <ESC>
" Emacs movement in insert mode
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <M-f> <C-Right>
inoremap <M-b> <C-Left>     "Doesn't work

nmap <F8> :TagbarToggle<CR>
" Getting out of the terminal emulator
" tnoremap <Esc> <C-\><C-n>
nnoremap Y y$
nnoremap X d^
nnoremap gj V}Jse<BS><CR><ESC>
nnoremap : :<C-f>i
nnoremap Q @q
"inoremap <silent> m <C-r>=EscapeSequence()<CR>
nnoremap Z zz
"}}}
" Leader Key Mappings {{{
"""""""""""""""""""""""
let mapleader = ' '     " Map our main leader Space
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
" Follow-mode like keybinding
nmap <silent> <Leader>ef	:vsplit<bar>wincmd l<bar>exe "norm! Ljz<c-v><cr>"<cr>:set scb<cr>:wincmd h<cr>:set scb<cr>

nnoremap <leader><leader> <C-z>
nnoremap <leader>tn  :set number! relativenumber!<CR>

nnoremap <leader>ev :split $MYVIMRC<CR>
"nnoremap <leader>ep :call OpenFile(g:vimtexer)<CR>
"nnoremap <leader>ez :call OpenFile("$HOME/.zshrc")<CR>
"nnoremap <leader>ex :call OpenFile("$HOME/.xinitrc")<CR>
"nnoremap <leader>ei :call OpenFile("$HOME/.i3/config")<CR>

nnoremap <leader>u  :call Preserve("normal! Ypv$r-k")<CR>
nnoremap <leader>h  za
nnoremap <silent> <leader>p :put=py3eval(getline('.'))<CR>
"nnoremap <silent> <leader>t :call Term('')<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>S :w !sudo tee %<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :bd<CR>

" Easy Motion, make it spacemacs-ish
map  <Leader>jl <Plug>(easymotion-bd-jk)
nmap <Leader>jl <Plug>(easymotion-overwin-line)
map  <Leader>jj <Plug>(easymotion-bd-f)
nmap <Leader>jj <Plug>(easymotion-overwin-f)
map  <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jw <Plug>(easymotion-overwin-w)

" Window commands
nnoremap <leader>v  :vsp<CR>
nnoremap <leader>vt :vsp<CR>:terminal<CR><C-\><C-n>
nnoremap <leader>vo :call fzf#run({'source':'find ~/', 'right': winwidth('.')/2, 'sink':'vertical botright split'})<CR>

nnoremap <leader>V  :split<CR>
nnoremap <leader>Vt :split<CR>:terminal<CR><C-\><C-n>
nnoremap <leader>Vo :call fzf#run({'source':'find ~/', 'down':'40%', 'sink':'botright split'})<CR>

nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wj :wincmd j<CR>

" Git Commands
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush origin master<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gl :Glog<CR>

" Music Commands
"nnoremap <leader>ms  :silent !mplayer ~/Audio/Playlist/*<CR>
"nnoremap <leader>mp  :silent !echo "pause" > /home/brennier/Pipes/media_control<CR>
"nnoremap <leader>mq  :silent !echo "quit" > /home/brennier/Pipes/media_control<CR>
"nnoremap <leader>mvm :silent !echo "set_property volume 0" > /home/brennier/Pipes/media_control<CR>
"nnoremap <leader>mvu :silent !echo "volume +5" > /home/brennier/Pipes/media_control<CR>
"nnoremap <leader>mvd :silent !echo "volume -5" > /home/brennier/Pipes/media_control<CR>

" Other Commands
nnoremap <leader>T :NERDTreeToggle<CR>
nnoremap <leader>F :call Format()<CR>
nnoremap <leader>y  "+y
"nnoremap <leader>f :call Translate()<CR>
"nnoremap <leader>T :call TranslateLine()<CR>
"nnoremap <leader>a :call AddToFrenchFile()<CR>
"}}}
" Plugins {{{
""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'tpope/vim-surround'       " Add surround feature
Plug 'tpope/vim-fugitive'       " GIT
Plug 'vim-scripts/Smart-Tabs'   " Indent with TAB, align with SPC
Plug 'jiangmiao/auto-pairs'     "DELETE Auto-close plugin
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'        " Show functions, Golbal var, Macros etc etc
Plug 'prabirshrestha/async.vim' " VIM LSP-helper
Plug 'prabirshrestha/vim-lsp'   " VIM LSP
Plug 'morhetz/gruvbox'          " My fav colorscheme
Plug 'lekv/vim-clewn'           " GDB
Plug 'sheerun/vim-polyglot'    " For language support
"Plug 'tpope/vim-commentary'    " For faster comment !!
"Plug 'alvan/vim-closetag'      " Faster (X)HML tag colser !!
call plug#end()
"}}}
" Plugin Config {{{
"""""""""""""""""
" Quicktex Setup {{{
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
"{{{ Syntastic
set statusline+=%#warningmsg#
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}
"{{{ LSP
"" Registering Python
if executable('pyls')
	au User lsp_setup call lsp#register_server({
		\ 'name' : 'pyls',
		\ 'cmd'  : {server_info->['pyls']},
		\ 'whitelist' : ['python'],
		\ 'workspace_config' : {'pyls': {'plugins': {'pydocstyle': {'enable': v:true}}}}
		\ })
endif
if executable('clangd')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'clangd',
		\ 'cmd': {server_info->['clangd']},
		\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
		\ })
endif
"}}}
"}}}
" Misc {{{
""""""""
" Colorscheme
"colorscheme vim-monokai-tasty
"let g:vim_monokai_tasty_italic = 1
"syntax off
colorscheme bw

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
"autocmd InsertLeave,WinEnter * set cursorline
"autocmd InsertEnter,WinLeave * set nocursorline

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
"}}}
"{{{ Compile Commands
"""""""""""""""""""""
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
    else
        " split
        " resize 13
        execute('! '.g:compileCommand[ft])
    endif
endfunction
"}}}

