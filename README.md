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
