"----vim 个人使用习惯配置start------
set encoding=UTF-8
" leader设置成空格
let mapleader=" "
" 使用鼠标
set mouse=a
" 显示行号
set nu
" 相对行号
set relativenumber
set scrolloff=5
" tab=4个空格
set tabstop=4
set shiftwidth=4
" 改变 vim中光标的形状
let g:db_ui_use_nerd_fonts=1
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
" 高度光标所在行
"set cursorline
" 设置不换行
"set nowrap
set wrap
" 显示按下的按键
set showcmd
" 按tab显示菜单
set wildmenu
" 不需要备份文件
set nobackup

"set clipboard=unnamed
set clipboard=unnamedplus

" ciw
nnoremap ciw "+ciw
nnoremap cw ciw

" ci'   "word"
nnoremap ci" "+ci'
nnoremap c" ci'

" cib   (word)
nnoremap cib "+cib
nnoremap cb cib

" ci"   "word"
nnoremap ci' "+ci"
nnoremap c' ci"

"   cis     {word}
nnoremap cis "+ci{
nnoremap cs ci{

" cit   <>word<>
nnoremap cit "+cit
nnoremap ct cit

" yiw
nnoremap yiw "+yiw
nnoremap yw yiw

" yib   (word)
nnoremap yib "+yib
nnoremap yb yib

" yit   <>word<>
nnoremap yit "+yit
nnoremap yt yit

"   y-'     'word'
nnoremap yi" "+yi'
nnoremap y" yi'

"   y-"     "word"
nnoremap yi' "+yi"
nnoremap y' yi"

" yi{
nnoremap yis "+yi{
nnoremap ys yi{

" diw
nnoremap siw "+diw
nnoremap sw diw

" dib
nnoremap sib "+dib
nnoremap sb dib

" dit
nnoremap sit "+dit
nnoremap st dit

" di'
nnoremap si" "+di'
nnoremap s" di'

" di"
nnoremap si' "+di"
nnoremap s' di"

"----vim 个人使用习惯配置end------
"ssh 远程粘贴板
if executable('clipboard-provider')
    let g:clipboard = {
          \ 'name': 'myClipboard',
          \     'copy': {
          \         '+': 'clipboard-provider copy',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider copy',
          \     },
          \     'paste': {
          \         '+': 'clipboard-provider paste',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider paste',
          \     },
          \ }
endif
"随机选一个颜色风格
function RandomColorScheme()
  let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n") 
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction

"call RandomColorScheme()

:command NewColor call RandomColorScheme()


" 文件类型设置 "{{{
" ---------------------------------------------------------------------
" JSX 语法高亮
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx,*.js set filetype=typescriptreact


