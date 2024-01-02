" --------基本設定--------
" reset augroup
augroup MyAutoCmd
    autocmd!
    " XMLとHTMLの閉じタグ補完
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

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

" ヤンクしたテキストをクリップボードにコピー
set clipboard=unnamed

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

" Yを行末までのヤンクにする
nnoremap Y y$

" 数字のインクリメント/デクリメントのマッピング変更
nnoremap + <C-a>
nnoremap - <C-x>
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
