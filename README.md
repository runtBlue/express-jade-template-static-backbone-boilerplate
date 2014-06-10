主なフォルダ構成
================
設定
Gruntfile.coffee
package.json
資源
current.resource
public.resource
サーバー
views
bin
routes
node_modules
静的公開
public
サーバー起点
Procfile
サーバーロジック
settings.js
database.js
app.js

設定
--------
gruntに激しく依存するテンプレートです。テストありません。
現時点では資源のcoffeescript, jadetemplateを必要な場所へ変換してくれます。

資源
---------
current.resrouce はサーバー側の場所の元資源としてpublic以外のcoffeescript を配っていく。

サーバーロジック
-----------
このjsはcurrent.resroucesから生成されたもの。
settings.js: 設定系
database.js: herokuにあげるときにmongoDBのURLとかを書くつもりで分離した設定
app.js: サーバーメインロジック

静的公開
---------
このフォルダ以下のファイルが静的にルーティングされる
これに加えて、サーバーメインロジックでAPIのルーティングが加わった形

サーバー起点
----------
herokuにあげたあとに動かす奴