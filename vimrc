"VUNDLE
set nocompatible      
filetype off          
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'  
						"Ici sont déclaré tous les plug-in

Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'ayu-theme/ayu-vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'farmergreg/vim-lastplace'
Plugin 'tpope/vim-sleuth'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive' "plugin git
Plugin 'vim-scripts/nextval'
Plugin 'nvie/vim-flake8'

								"Fin des plug-in
call vundle#end()            
filetype plugin indent on  
	"FIN DE VUNDLE


"Colorsheme/airline/lightline
colorscheme palenight
let g:palenight_terminal_italics=1
let g:airline_theme = "palenight"
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"Reglages classiques
set background=dark
set nu
syntax on
set mouse=a
set t_Co=256
set showcmd
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set nocompatible
set cursorline
set colorcolumn=81

"Nerdtree
map <C-e> :NERDTreeToggle<CR>

"tagbar
map <C-o> :TagbarToggle<CR>
let g:tagbar_autofocus=1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"True colors
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Syntastic
function Py2()
  let g:syntastic_python_python_exec = '/usr/local/bin/python2.7'
endfunction

function Py3()
  let g:syntastic_python_python_exec = '/usr/local/bin/python3'
endfunction

call Py3()   " default to Py3 because I try to use it when possible
