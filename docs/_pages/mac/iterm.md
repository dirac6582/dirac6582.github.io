---
layout: single
title:  "iterm2 トップページ"
date:   2022-09-04 10:03:40 +0900
categories: iterm2
---

## [iterm2](https://iterm2.com)

[公式のドキュメント](https://iterm2.com/documentation.html)が充実しているのでそちらも参照．


itermはmacのデフォルトのターミナルと違って**24-bit color**や**画像表示**というグラフィカルな機能を持ったターミナルアプリである．機能面でも非常に優れており，追加の独自コマンドやGUIによるファイル操作を可能にする**シェルインテグレーション**を始め画面分割など有効活用することで作業がかなり楽になる．最後にカスタマイズ性に優れており，見た目やショートカットなどを定義した自分だけのプロファイルを作ることができる．

- 優れたグラフィカル(24-bit color,アイコンや画像の表示)
- 優れた機能性(シェルインテグレーション)
- 優れたカスタマイズ性(独自プロファイルの作成)

## shell integration

itermをインストールしたらまず設定したいのはshell integration. これは追加でインストールが必要であるが非常に容易であり，ツールバーからiterm2→install shell integrationとすることで自動でインストールできる．

## [User interface]

- preferenceの保存
iterm2全体の設定を保存するにはgeneral > Preferenceから保存先のディレクトリを選択する．いつ変更を保存するかはmanual，automaticなどをお好みで選べる．意図しない変更を保存しないためにmanualが安全だが，意図する変更をした後にちゃんと保存し直すことを忘れないように．
ちなみにこれとは別にプロファイルの保存やキーマッピングの保存などいくつか保存できるものがある．


## [各種のfeatures](https://iterm2.com/features.html)

- 画面分割(split panes)
  
  縦分割(`cmd+D`)や縦分割(`cmd+shift+D`)が可能．分割を止めるのはタブの削除と同じく`cmd+W`. ペインを切り替えるのには`cmd+{`または`cmd+}`を利用する．

- タブ
  
  `cmd+t`で新しいタブを開くことができる．タブの間は`cmd+→`，macbookの場合は三本指スライドで移動することができる．


- クリップボード履歴(history)

  `cmd+shift+h`でクリップボードの履歴を確認することができる．

- マーク
  `cmd+shift+m`でクリップボードの履歴を確認することができる．
 
- タイムスタンプ
  `cmd+shift+e`でコマンド実行時のタイムスタンプを見ることができる．

- インスタントリプレイ
  `cmd+shift+b`でコマンドを遡れる． 

- hotkeyで一発でitermを起動
  
  keys→hotkeyで`option space`に設定してある．左手だけで効くので便利．


- 検索

  `cmd+f`で検索可能．

- コピーモード(copy mode)

  `cmd+shift+c`でコピーモードに入れる．`v`で選択開始，`y`で選択終了して即座にコピーできる．

- instant replay
  

- 透明度の変更

  Profile→Window→Transparencyで変更できる．また，透明と半透明を`cmd+u`で切り替えることができる．


- password manager
  
パスワードを要求される場面(sudo顕現ssh接続
https://www.karakaram.com/iterm2-password-manager/


- ssh先に応じて異なるプロファイルを適用する(Tagged profile)
  
- ステータスバー

- ツールベルト
  
　

- 補完
  
  zshの補完を使っているので現状利用していない．

## プロファイルのカスタマイズ

変更できるのは大きく以下の8項目

- General：プロファイル全般の設定
- Colors：色の設定
- Text：文字関連の設定
- Windows：ウインドウ設定
- Terminal：ターミナルの設定
- Session：セッション開始時やログ関連の設定
- Keys：キー関連の設定
- Advanced：その他の機能の設定
  

### カラープロファイル

iterm2用のカラープロファイルを提供しているサードパーティが色々あるので，調べて自分好みのプロファイルを探してくるのが良い．

- [doracula](https://draculatheme.com/iterm)

  ```bash
  # install via git
  $ git clone https://github.com/dracula/iterm.git
  # 1:iTerm2 > Preferences > Profiles > Colors Tab
  # 2: Open the Color Presets... drop-down in the bottom right corner
  # 3: Select Import... from the list
  # 4: Select the Dracula.itermcolors file
  # 5: Select the Dracula from Color Presets...
  ```

- solarized

- [iceberg](https://github.com/Arc0re/Iceberg-iTerm2)


- TriggerとAutomatc Profile Switchingの組み合わせ
https://blog.stenyan.jp/entry/iterm2


### session

- ssh接続がタイムアウトするのを防ぐ：sessionのwhen idle send ASCII codeにチェックを入れる．60 secondsくらいで大丈夫だと思う．



## トラブルシューティング

- option+→他いくつかのショートカットが効かない
  <!-- https://apple.stackexchange.com/questions/154292/iterm-going-one-word-backwards-and-forwards -->
  Preferences > Profiles > Keys > key Mappingsで左下のpresetsをクリックしてNatural Text Editingを選ぶと通常のテキストエディタと同様のショートカットが効くようになるが，これだとcmd+→でのタブ移動ができなくなる．「このショートカットだけは効かせたい」という場合はkey Mappingsの設定を直接弄るのが良い．左下のExportから設定を保存しておくと万が一の時に復帰できるのでお勧め．
  ```
  # option+→に単語移動を割り当てる場合
  ⌥← に Send Escape Sequence = b を設定
  ⌥→ に Send Escape Sequence = f を設定
  ```

## その他

- finderからiterm2を開く

OpenInTerminal-Lite+OpenInEditor-Liteがおすすめ．

```bash
# OpenInTerminal なら
$ brew cask install openinterminal

# OpenInTerminal-Lite なら
$ brew cask install openinterminal-lite

# OpenInEditor-Lite なら
$ brew cask install openineditor-lite
```

https://kakakakakku.hatenablog.com/entry/2020/09/02/084657

アイコンの変更方法
https://github.com/Ji4n1ng/OpenInTerminal/blob/master/Resources/README-Lite.md


その他
https://schlining.medium.com/integrate-iterm2-v-3-with-your-macs-finder-f3825acd3e0b
https://gist.github.com/pdanford/158d74e2026f393e953ed43ff8168ec1
https://www.gekal.cn/blogs/2020/04/08/open-terminal-from-finder-at-mac.html



## tmux



<!--
https://blog.spacemarket.com/code/terminal-development-env/
-->
