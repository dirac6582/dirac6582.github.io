---
layout: single
permalink: /bash/
title:  "bash/zsh トップページ"
date:   2022-09-04 10:03:40 +0900
categories: bash zsh
---

## bash/zsh


## zshの設定ファイル

[zshの設定ファイルの種類](zsh_setting.md)

[zsh特有の補完などの設定]

[コマンドの出力に色をつける](zsh_color.md)

[zshの外部プラグインまとめ - Qiita](https://qiita.com/mollifier/items/1220c0eeaa93e82f8afc)

## dotfiles

[dotfileの設定](dotfiles.md)


## tmux

[tmuxの設定](tmux.md)

## 設定ファイルの読み込み
```bash
source file_name

. file_name
```
環境変数とは，変数の中でもbashで`export`されたものを指す．


## 権限
権限には3種類，Read, Write, eXecuteがある．権限はuser,group,othersに対して割り当てられる．

権限の確認には`ls -l`が使える．1+3*3=10個の数字が出てくるが，ファイル種別(d:ディレクトリ，f:ファイル，など）+所有者権限3つ+所有グループ権限3つ+その他に対する権限3つになっている．


`chmod`で権限を変更するやり方は数字によるものと英字によるものがある．

英語でRWXを使用する方法場合

```bash
# UserにX権限を追加
chmod u+x test.sh

# User, Group, Others, Allの4つが使える．
```

一方数字でchmod 644などとするのは，所有者，所有グループ，その他に対する権限を6,4,4で割り当てることを表す．この数字は1:x,2:w,4:rとして足し算で計算する．例えば6=2+4より6=wr．7=1+2+4より7=wrx．


## ディレクトリの容量表示
```bash
# -dで深さ指定
# -hでわかりやすく表示
du -h -d 1 
```

## termの種類
 termの種類は環境変数$termに入っている．
```bash
echo $TERM
#xtermやlinuxなどと帰ってくる．
```

## ファイル，ディレクトリを見つけるfindコマンド
```bash
# find 探すdir -name "file name"
find /test -name "libpmi.so"

# 探すdirの深さは -maxdepthや-mindepthで指定可能．
```

## zero-padding
ワイルドカード展開（ブレース展開）を使う方法が一番楽だが，bash4以上のversionにしか入っていない．
```bash
for i in {001..010}
do 
   echo $i
done
```

## マシンスペックの確認
<!-- https://qiita.com/DaisukeMiyamoto/items/98ef077ddf44b5727c29 -->
```bash
#CPU
cat /proc/cpuinfo

#Memory
cat /proc/meminfo
sudo dmidecode -t memory

#マザーボード
sudo dmidecode -t baseboard

#グラフィック
lspci | grep VGA

#ディスク
df
sudo parted -l
lsblk
ls -la /dev/disk/by-uuid
lspci | grep Ethernet

#カーネルversion
uname -a

#distribution version
lsb_release -r
cat /etc/redhat-release
cat /etc/lsb-release
```


## 自分の環境で使えるシェルの一覧
```bash
cat /etc/shells
```


## ディレクトリ内のファイルの数
```bash
ls -1 | wc -l
```

## 文字コードを調べる
```bash
#https://qiita.com/pugiemonn/items/106749351991037fb606
file --mime hoge.php
```

## あるポート番号のプロセスの確認
```bash
lsof -i -P | grep 8080
```

## ssh-agent
<!-- https://laboradian.com/how-to-use-ssh-agent/#_exec -->


## 色付け
<!-- https://fhiyo.github.io/2017/11/14/colorize-terminal-output.html -->
シェルの出力を色付けする方法について．基本的にはhomebrewから新しくコマンドをinstallしてくる必要がある．

1. ls

まずは気に入ったカラーテーマの設定ファイルを設定ファイルをダウンロードしてくる必要がある．
```bash
dircolorsPATH=/path/to/dircolors.ansi-modify-dark
#以下で読み込み
if [ -f  ${dircolorsPATH} ];then
    if type dircolors >/dev/null 2>&1;then
        eval $(dircolors ${dircolorsPATH} )
    elif type gdircolors >/dev/null 2>&1;then
        eval $(gdircolors ${dircolorsPATH} )
    fi
else
    echo error DO NOT exist ${dircolorsPATH}
fi
```

デフォルトのbsd系のlsではなく，gnu-lsをインストールしてくる．
```
brew install gls
```
この状態で`ls`と打つと`gls`の方を実行してくれる．

2. cat 

ccat(colorlized cat)をインストールする．

```bash
brew install ccat
```

または，実行ファイルを[githubレポジトリ](https://github.com/owenthereal/ccat/releases)からダウンロードできる．実行ファイルへのpathを通し，catにaliasをはるようにする．後々色をカスタマイズすることを考えるとmacでもbrew管理よりgithubを使う方がpathのコントロールがしやすくて良いかもしれない．

```bash
# ccat
export PATH=$PATH:${path/tp/ccat}

# cat
if [[ -x `which ccat` ]]; then
  alias cat='ccat'
fi
```


3. [grc(ping/makeなど)](https://github.com/garabik/grc)

grcというパッケージがあり，これで多くのコマンドの出力に色をつけることができる．

```bash
brew install grc
```

grcコマンドとgrcatという二つのコマンドがインストールされ，
自動で各種コマンドへのAliasを通すには

```bash
[[ -s "${HOMEBREW_HOME}/etc/grc.zsh" ]] && source ${HOMEBREW_HOME}/etc/grc.zsh
```

を.zshrcに追記する．より細かいカスタマイズがやりたい場合はgithubページを参照．

ちなみにlinux上で（sudoがなく）githubレポジトリを直接配置した場合，`grc.conf`を`~/.grc/grc.conf`に配置した上で中身のファイル名に直接パスを指定する必要がある．

```bash
# grc.confを移動
cp grc.conf ~/.grc/grc.conf
# 中身のconf.diffのようなファイル名の部分に直接パスを指定する．
# 全てのconf.*に対して一括置換する．
conf.diff → (path/to)/grc/colourfiles/conf.diff

# bash_profileやzshrcではpathを通すのを忘れずに．
# grc
export PATH=$PATH:${path/to/grc}
```

4. diff

colordiffをインストールする．

```bash
brew install colordiff
```

または[githubレポジトリ](https://github.com/daveewart/colordiff)を使う．


5. less

<!-- https://atmarkit.itmedia.co.jp/flinux/rensai/linuxtips/357colorlsless.html
 -->
grcでサポートされておらず，source-highlightを利用する．

```bash
brew install source-highlight
```

公式のページは[こちら](https://www.gnu.org/software/src-highlite/)．[githubレポジトリ](https://github.com/scopatz/src-highlite)を使うこともできるが，公式ページの配布コードと違ってconfigureファイルを作成するために`autoreconf`コマンドが必要で，Linux上でコマンドの実行に失敗したので現在使っていない（2022/11/08）．
<!--
https://wiki.archlinux.jp/index.php/Zsh
https://qiita.com/minnsou/items/3e9f200f9f2cc9a92920
zsh: https://qiita.com/agotoh/items/e6b22bcfe63162f70e0d
-->


## ワンライナー

ワンライナーでなにかをやる時に便利なのは

- for文
- パイプやxargsコマンド

あたり．

```bash
# 複数ファイルに対する一括処理
for file in *.markdown ; do mv “$file” “${file%.markdown}.md” ; done

# awkで列挿入
cat in.txt | awk '{print $1 " " "add" " " $2}'

# xargsをつかって複数ファイルの行数をカウント
ls | xargs wc -l

## シンボリックリンクをたどって圧縮する
tar cfzh /backup/domain.tar.gz /home/aaa/www/domain/*
```
<!--
https://it-ojisan.tokyo/awk-add-insert/
-->
