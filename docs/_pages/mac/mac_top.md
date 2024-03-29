---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: MacTop
layout: home
description: Mac(OSX)に関する設定
---



## iterm

[iterm](iterm.md)


## finder

- サイドバーのカスタマイズ
  メニュー > 環境設定 > サイドバー
  特に初期状態だと~が見えなかったりするのでかなり使いにくい．

- 全てのファイルの拡張子を表示
　メニュー > 環境設定 > 詳細 >すべてのファイル名拡張子を表示 

- パスバー/タブバー/ステータスバーの表示
  メニュー > 表示 > パスバーを表示(など)

- 名前ソート時，フォルダを必ず先頭に表示
  メニュー > 環境設定 > 詳細 > 名前順で表示しているウィンドウ

- カスタムアイコン
  適用したいファイルやディレクトリの情報を`cmd+i`で確認して，一番上のアイコン部分にダウンロードしたアイコンをドラッグアンドドロップ．

- openineditor_lite/
  finder拡張機能．現在のディレクトリをエディタやターミナルで開いてくれる．
  
- デフォルトの表示スタイルの変更
　finderの設定は設定しているディレクトリだけで有効．全てのディレクトリに適用したい場合，
  表示 > 表示オプション > デフォルトとして保存
  とする．ただしこれだと今後新しくできるディレクトリにしか適用されない．そこで面倒ではあるが全てのディレクトリの.DS_Storeファイルを削除する必要がある．
  ```bash
  sudo find / -name .DS_Store -delete; killall Finder
  ```

## メール

標準のメーラーははっきり言ってあまり使いやすくないが，かといってかわりも難しい．．．

- Venturaから，いわゆる遅延送信に対応した．設定>作成>送信>送信を取り消すまでの時間といって，10s,20s,30sから選択可能．
- 自分を自動的にcc/bccに入れるには，環境設定>作成>「自動的に自分をcc/bccに含める」にチェック

## メニューバー

- メニューバーの表示内容の変更
  環境設定 > Dockとメニューバー 
  特にspotlightなどはここにあっても使わないと思うのでそういうものを非表示にできる．

- hidenbar
  
- [MacBing](https://goodsnooze.gumroad.com/l/macbing)
  - macのメニューバーからBingChatを開ける
- spaceman
  

## カレンダーに予報天気を表示する

[iCal週間天気予報（ITエンジニアがときめく自動化の魔法）](https://weather.masuipeo.com/)

## コピペ時に改行が入ってしまう場合

pdfの書類をCopy-Pasteする時に，改行が入ってしまう問題がある． これは，一旦コピーしたものをchromeなどの検索窓に貼り付けて再度コピーすることで回避することができる．

## ショートカットキーほかキーボードに関すること

- `ctrl+D`で右側の文字を消せるけど，`ctrl+H`で左側の文字を消せる．
- capslockを使いたくない場合，環境設定 > キーボード > 修飾キーから動作を変更可能．emacsを使う人はESCに割り当てておくと便利．


## google chrome

chromeでは，/を押すと検索ボックスに移動できる．

- `command+→` 次のページへ
- `command+←`　前のページへ
- `command+r` 更新

以下の記事が参考になる．

[https://qiita.com/dodonki1223/items/205a937c21030d1a511e](https://qiita.com/dodonki1223/items/205a937c21030d1a511e)


さらに，拡張機能vimiumが使える．
[https://qiita.com/hiratekatayama/items/d202d4a0ad99b23e75ef#vimiumとは](https://qiita.com/hiratekatayama/items/d202d4a0ad99b23e75ef#vimium%E3%81%A8%E3%81%AF)

EMACSとCHROMEの連携
[https://minorugh.xsrv.jp/post/2018/1203-emacs-chrome-together/](https://minorugh.xsrv.jp/post/2018/1203-emacs-chrome-together/)



## intel oneapi

[HPC kit](https://software.intel.com/content/www/us/en/develop/tools/oneapi/hpc-toolkit/download.html)

## 自分の設定したカスタムショトカまとめ

- `cmd+space` :: alfread → これはまずspotlightのショトカなので，環境設定→キーボード→spotlightから無効化した上で設定．
- `shif+space`   :: Things
- `shift+return` :: iterm2 hotkey

## mac標準コマンド

```
# smcデータをみる
sudo powermetrics --samplers smc

# cpu温度確認
sudo powermetrics --samplers smc | grep -i "CPU die temperature"

# gpu温度確認
sudo powermetrics --samplers smc | grep -i "GPU die temperature"

# Fan回転数
sudo powermetrics --samplers smc | grep -i "Fan"
```

## その他便利アプリケーション

- Alfread4(brewで入る)
  spotlightの代わりとして活用できる．
- qlmarkdown(brewで入る)
  finderのクイックルックでmarkdownを見れる

## zotero
<!-- 
https://ohdachi.github.io/ohdachi_lab/researches/2018/02/02/zotero_zotfile.html
-->


- [connected paper](https://www.connectedpapers.com/)
<!--
https://note.com/sangmin/n/n92321e835bc2
-->

- [デスク備品一覧]({% link _pages/mac/desk_tour.md %})

## bootcamp

- bootcamp windowsを使っていてGPUがおかしい場合，デバイスマネージャー>ディスプレイアダプターでGPUを見て正常に動いているかを確認


## マルチディスプレイでの設定について

- メインディスプレイの変更 :: システム設定->ディスプレイ->配置で，白いバーをドラッグドロップで移動させる．
- Dockの場所 :: システム設定->デスクトップとDockから．dockの場所は右ディスプレイの右端，左ディスプレイの左端，（上で設定した）メインディスプレイの下の3つからしか選べない．
- [Alfread4の表示スクリーンを変更](https://parashuto.com/rriver/tools/alfred-on-multiple-displays) :: appearance=>options=>show Alfread onでactive screenかmouse screenへ変更．
- 仮想デスクトップと併用する場合，常駐させたいアプリはDockを右クリック->オプション->割り当て先->全てのデスクトップと変更．これで中央ディスプレイは仮想ディスプレイを切り替えながら，左のディスプレイのメーラーは常時表示，みたいなことができる．
