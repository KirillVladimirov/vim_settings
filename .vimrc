" Вырубаем режим совместимости с VI:
set nocompatible           

" Включаем распознавание типов файлов и типо-специфичные плагины:   
filetype on
filetype plugin on
filetype plugin indent on

" Настройки табов для Python, согласно рекоммендациям
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе

" Автоотступ
set autoindent

" Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1

" Включаем 256 цветов в терминале
set t_Co=256

" Настройка omnicomletion для Python, js, html и css
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Авто комплит по табу
function InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\"
	else
		return "\<c-p>"
	endif
endfunction

" Показываем все полезные опции автокомплита сразу
imap <c-r>=InsertTabWrapper()
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Копи/паст по Ctrl+C/Ctrl+V
vmap <C-C> "+yi
imap <C-V> "+gPi

" Цветовая схема
colorscheme molokai
"if has('gui_running')
"  set background=dark
"  colorscheme molokai
"else
"  colorscheme zenburn
"endif

" Включить подсветку синтаксиса
syntax on

" Включаем нумерацию строк
set nu

" Спрятать курсор мыши когда набираем текст
set mousehide

" Включить поддержку мыши
set mouse=a

" Кодировка терминала
set termencoding=utf-8

" Не мигать
set novisualbell

" Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Вырубаем черточки на табах
set showtabline=0

" Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldcolumn=1

" Переносим на другую строчку, разрываем строки
set wrap
set linebreak

"Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile

" Кодировка файлов по умолчанию
set encoding=utf-8

" Возможные кодировки файлов, если файл не в unicode кодировке,
" то будет использоваться cp1251
set fileencodings=utf8,cp1251 


" Однокнопочная навигация по разделенным экранам
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Сворачивание кода
set foldmethod=indent
set foldlevel=99

" Использование пробела для сворачивания кода
nnoremap <space> za

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

" Code/project navigation
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          	" Class/module browser

" Other
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more

" Snippets support
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo

" Languages support
" Python
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

" vim python highlight
Plugin 'hdima/python-syntax'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'

call vundle#end()            		" required



