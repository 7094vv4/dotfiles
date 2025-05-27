" --------基本設定--------
" 文字コードをUTF-8に設定
set fenc=utf-8

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" 行番号を表示する
set number

" 長い行を表示させる
set display=lastline

" 補完メニューの高さを設定
set pumheight=10

" コマンドを画面の最下行に表示する
set showcmd

" コマンドライン補完を拡張モードで行なう
set wildmenu

" バックスペースキーで削除できるものを指定
" indent : 行頭の空白
" eol    : 改行
" start  : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" 不可視文字を表示する
set list

" 不可視文字の表示形式
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" ------------------------

" --------キーマッピング--------
" JJを入力でインサートモードを抜ける
inoremap <silent> jj <ESC>
tnoremap jj <C-\><C-n>
" ------------------------

" --------インデント--------
" オートインデント時にインデントする文字数
set shiftwidth=2
" 連続したスペースに対してTabキーやBSキーでカーソルが動く幅
set softtabstop=2
" タブ入力を複数のスペースに置き換える
set expandtab
" 画面上でタブが占める幅
set tabstop=2
" 行頭でタブ入力した場合に'shiftwidth'の数だけインデントする
set smarttab
" 改行時に前行のインデントを継続する
set autoindent
" ------------------------

" --------検索--------
" 検索結果をハイライト表示
set hlsearch
" 大文字小文字を区別しないで検索
set ignorecase
" 検索文字列に大文字小文字が混在した場合に限り大文字小文字を区別して検索する
set smartcase
" ------------------------

" --------クリップボード共有--------
augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('iconv -t sjis | clip.exe', @")
augroup END
" ------------------------

" --------HTML/XMLタグ補完--------
autocmd FileType html,xml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html,xml inoremap <buffer> </ </<C-x><C-o>
" ------------------------

" --------minpac--------
" https://github.com/k-takata/minpac
if &compatible
  set nocompatible
endif

function! PackInit() abort
  packadd minpac

  call minpac#init()

  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('mattn/vim-lsp-settings')
  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  call minpac#add('dense-analysis/ale')
  call minpac#add('rhysd/vim-lsp-ale')
endfunction

autocmd VimEnter * call PackInit()

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" https://github.com/prabirshrestha/vim-lsp
" https://github.com/mattn/vim-lsp-settings

" vim-lsp
function! s:onLspBufferEnabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  nnoremap <buffer> gd <plug>(lsp-definition)
  nnoremap <buffer> gs <plug>(lsp-document-symbol-search)
  nnoremap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nnoremap <buffer> gr <plug>(lsp-references)
  nnoremap <buffer> gi <plug>(lsp-implementation)
  nnoremap <buffer> gt <plug>(lsp-type-definition)
  nnoremap <buffer> gn <plug>(lsp-rename)
  nnoremap <buffer> [g <plug>(lsp-previous-diagnostic)
  nnoremap <buffer> ]g <plug>(lsp-next-diagnostic)
  nnoremap <buffer> K <plug>(lsp-hover)
  nnoremap <buffer> <C-l>d <Cmd>rightbelow LspDefinition<CR>

  let g:lsp_format_sync_timeout = 1000
endfunction

augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call s:onLspBufferEnabled()
augroup END

" vim-lsp-settings
let g:lsp_settings_filetype_javascript = ['typescript-language-server']
let g:lsp_settings_filetype_javascriptreact = ['typescript-language-server']
let g:lsp_settings_filetype_typescript = ['typescript-language-server']
let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server']
let g:lsp_settings_filetype_scala = ['metals']

" https://github.com/prabirshrestha/asyncomplete.vim
" https://github.com/prabirshrestha/asyncomplete-lsp.vim
" https://github.com/dense-analysis/ale
" https://github.com/rhysd/vim-lsp-ale

" ale.vim
let g:ale_floating_preview = 1

" エラーが発生している行の直下にエラーメッセージを表示する
" 'all' or '2' or 2 エラーが発生している全ての行でメッセージを表示
" 'current' or '1' or 1 エラーが発生している行にカーソルを置くと表示
" 'disabled' or '0' or 0 エラーが発生している行に表示しない。エラーが発生している行にカーソルを置くとコマンドラインモードに表示
let g:ale_virtualtext_cursor = 'all' 

" linter を有効にする
let g:ale_linters_explicit = 1

" 編集中のバッファを保存するタイミングで自動でコード修正
let g:ale_fix_on_save = 1

let g:ale_fixers = { 'typescript': ['eslint', 'prettier'], 'typescriptreact': ['eslint', 'prettier'], 'javascript': ['eslint', 'prettier'], }
let g:ale_linters = { 'typescript': ['eslint'], 'typescriptreact': ['eslint'], 'javascript': ['eslint'], }
let g:ale_linters = { 'scala': ['sbtserver'], }
" ------------------------
