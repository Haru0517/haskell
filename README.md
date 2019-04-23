# haskell
Haskell code in advanced lecture on programing languages

## 使い方
### 実行環境の作成まで
`docker-compose build`でイメージ作成．
`docker-compose up`でコンテナ作成．
`docker-compose exec app /bin/bash`でコンテナの中に入る．

### コマンド
:q(uit) 終了
:l(oad) ファイルをロード

### 実行方法（hello.hsの場合）
`ghci hello.hs`で対話モードで実行．

mainがある場合は`ghc hello`でコンパイル．
`./hello`で実行．
