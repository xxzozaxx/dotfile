"""""""""""""""""""""""""""""""""""""""""""""""""
" –––––––––––––––– Basic Info ––––––––––––––––––
"""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Bennett Rennier
" Edited: Ahmed Khaled
" Website: http://brennier.com
" Description: My general vim configuration file

" General Settings TODO
"""""""""""""""""""""""""""""""""""""""""""""""""
set splitright              " Makes sure that new windows open on the right
set splitbelow              " Makes sure that new windows open on the bottom
set showmatch               " Show matching brackets when text indicator is over them
set smartcase               " be smart about cases when searching
set autoread                " update if the file is changed from the outside
set mouse=a                 " Enable mouse
"set foldmethod=marker       " Auto-fold tripe braces
set foldmethod=syntax       " Auto-fold with indent level
set colorcolumn=100         " Add a line at column 80
set clipboard=unnamedplus   " Use the OS clipboard for yanking/pasting
set nobackup                " Disable backup
set noswapfile
set tbidi
"}}}
" Colors, Fonts, and Encodings 
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
" Tab and Spaces 
""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Visualize tab
set list
set listchars=tab:\│\ ,trail:-,nbsp:.
"}}}
" Status Line Settings 
""""""""""""""""""""""""
set laststatus=0
" Emacs like status line
set statusline=
		\\ [%n]
		\\ %{&readonly\|\|!&modifiable?&modified?'%*':'%%':&modified?'**':'--'}
		\\ %F
		\\:%l:%c
		\%=
		\\ %{&filetype!=#''?&filetype:'none'}
"}}}
" Remappings 
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
" Leader Key Mappings 
"""""""""""""""""""""""
let mapleader = ' '     " Map our main leader Space

nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>y  "+y
"}}}
" Plugins 
""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'       " Add surround feature
Plug 'vim-scripts/Smart-Tabs'   " Indent with TAB, align with SPC
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'        " Show functions, Golbal var, Macros etc etc
Plug 'prabirshrestha/async.vim' " VIM LSP-helper
Plug 'prabirshrestha/vim-lsp'   " VIM LSP
"Plug 'morhetz/gruvbox'          " My fav colorscheme
Plug 'sheerun/vim-polyglot'     " For language support
Plug 'lfv89/vim-foldfocus'      " fold into new buffer
Plug 'troydm/easytree.vim'      " lighter NERDtree
"Plug 'severin-lemaignan/vim-minimap' " Test minimap
"Plug 'jiangmiao/auto-pairs'     " DELETE Auto-close plugin
"Plug 'lekv/vim-clewn'          " GDB
"Plug 'tpope/vim-fugitive'       " GIT
"Plug 'junegunn/fzf', { 'do': './install --all' }
call plug#end()
"}}}
" Plugin Config 
"""""""""""""""""
" Fold Focus {{{
nmap <CR> :call FoldFocus('e')<CR>
nmap <Leader><CR> :call FoldFocus('vnew')<CR>
"}}}
" Quicktex Setup 
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
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}
" LSP
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
" Misc 
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
" Compile Commands
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

