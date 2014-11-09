###これは何？
armadilloで動くC言語のプログラムの作成。コンパイル。転送。実行の自動化をするツール  
C言語のライブラリ

bin/project コマンドで操作します
- -b --build   make
- -c --create  プロジェクトの作成
- -d --delete  プロジェクトの削除
- -n --name    プロジェクトの名前
- -r --refresh make clean

例:  
bin/project -r -c -n led  
make cleanしてledプロジェクトを作成

後々Capistranoを使ってコンパイルと転送と実行の自動化をする予定です  
Qtの対応はまだです

### 環境
VM
- virtual box
- atde5 64bit
- ip address 192.168.56.101
- arm-linux-gnueabi-gcc 4.6.3
- cmake 2.8

Host
- MBA 2012 11 inch
- Mac OS X 10.10
- ruby 2.1.4
- capistrano 3.1.2
