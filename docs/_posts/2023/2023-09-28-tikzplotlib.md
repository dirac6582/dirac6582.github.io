---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: matplotlibで作ったグラフをtikz(tex)で出力する
layout: single
date:   2023-9-28 21:00:00 +0900
categories: 
 - code
tags:
 - bash
description: matplotlibのグラフ作成コードを，latexのtikzのコードに変換するツールtikzplotlibの使い方の紹介．
---

matplotlibで作成したグラフを，tikzファイルに変換することができる`tikzplotlib`ライブラリの使い方．pypiのページは[こちら](https://pypi.org/project/tikzplotlib/)．

## インストール

インストールはpipまたはcondaで可能．

```python
pip install tikzplotlib
conda install -c conda-forge tikzplotlib
```

## 使い方

使い方はとても簡単で，matplotlibで通常のコードを書いたあと，最後に以下の2行を追加するだけで`test.tex`にコードが出力される．

```python
import tikzplotlib
tikzplotlib.save("test.tex")
```

例えば以下のような例が一例だ．ここではガウス関数をプロットするグラフを作成している．

```python
def f(x,mu,sigma):
    '''
    プロットする関数．ここではガウシアンを例にとる．
    mu : 平均値
    sigma : 分散
    '''
    import numpy as np
    return np.exp(-(x-mu)**2/(2*sigma**2))

import numpy as np
import matplotlib.pyplot as plt
fig, ax = plt.subplots(figsize=(8,5),tight_layout=True) # figure, axesオブジェクトを作成
x = np.linspace(-1,1,1000)
ax.plot(x,f(x,0,1)) #

# 各要素で設定したい文字列の取得
xlabel="x label"
ylabel="y label"

# 各要素の設定を行うsetコマンド
ax.set_xlabel(xlabel,fontsize=22)
ax.set_ylabel(ylabel,fontsize=22)

ax.grid()

ax.tick_params(axis='x', labelsize=20 )
ax.tick_params(axis='y', labelsize=20 )

lgnd=ax.legend(loc="upper left",fontsize=20)

ax.plot()
fig.savefig("test.pdf")

import tikzplotlib
tikzplotlib.save('test.tex')
```

このコードから生成されたtexファイルは以下のようになる．データ点が1000個並んでしまうのでそこは省いてある．

```tex
% This file was created with tikzplotlib v0.10.1.
\begin{tikzpicture}

\definecolor{darkgray176}{RGB}{176,176,176}
\definecolor{lightgray204}{RGB}{204,204,204}
\definecolor{steelblue31119180}{RGB}{31,119,180}

\begin{axis}[
legend style={
  fill opacity=0.8,
  draw opacity=1,
  text opacity=1,
  at={(0.03,0.97)},
  anchor=north west,
  draw=lightgray204
},
tick align=outside,
tick pos=left,
x grid style={darkgray176},
xlabel={x label},
xmajorgrids,
xmin=-1.1, xmax=1.1,
xtick style={color=black},
y grid style={darkgray176},
ylabel={y label},
ymajorgrids,
ymin=0.586857217748334, ymax=1.01967294096292,
ytick style={color=black}
]
\addplot [semithick, steelblue31119180, forget plot]
table {
-1 0.606530659712633
-0.997997997997998 0.607744933684566
-0.995995995995996 0.608959197911498
（以下中略）
0.997997997997998 0.607744933684566
1 0.606530659712633
};
\end{axis}

\end{tikzpicture}
```

あとはこのtexファイルをそのまま使うもよし，色々修正して利用するもよしだ．Tikzで図を作るということは対外的な発表や大事な文書などに使うケースが多いだろうから，基本的には追加で修正していくことになると思う．特に個人的には以下のような点に注意が必要だと思う．

- データが（おそらく）常に数値で保存されてしまうので，関数のプロットに直したり，ファイルからデータを読み込む形式に変更したりという作業は常に必要だと思う．
- この手のツールとしてはありがちだがたまに綺麗に変換されないケースがある．
- 3D plotでは使えない（公式マニュアルでも言及あり）．

## (追記) matplotlib.3.8.0以降で使えない問題

自分の環境に入っている`tikzplotlib     0.10.1`はmatplotlib3.8系とは互換性がなかった．matplotlibの3.8で`backend_pgf.common_texification`が廃止されてしまったのが原因．

## (追記) matplotlib.3.7.0で利用する．

そこで，別途tikzplotlib専用に仮想環境を作成し，matplotlib3.7.0系を利用するとうまくいく．

```bash
conda create -n tikzplotlib
conda activate tikzplotlib
pip install matplotlib==3.7.3
pip install tikzplotlib
```

ただし，このままだと実際にtikzplotlibを実行したときに以下のように怒られてしまった．

```python
/path/to/lib/python3.12/site-packages/tikzplotlib/_legend.py", line 81, in draw_legend
    if obj._ncol != 1:
AttributeError: 'Legend' object has no attribute '_ncol'. Did you mean: '_ncols'?
```

そこで，この`_legend.py`内のif文を

```python
if obj._ncols != 1:
```

と書き換えてやるとうまくいく．この問題はtikzplotlibのgithubのissueにも立てられているが今のところ修正されていないようだ．


## まとめ

完璧ではないものの，matplotlibのプロットを手軽にtikz形式に変換できるツールなので，普段の解析はpythonやjupyterでやってるけど最後にまとめる時はやっぱりtexが良いという人にはかなりおすすめできるツールだと思う．


## 参考文献

- [Pypiのページ](https://pypi.org/project/tikzplotlib/)
