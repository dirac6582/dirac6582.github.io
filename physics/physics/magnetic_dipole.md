磁気双極子モーメント
量子力学における時期双極子モーメントと，関連する物理量について紹介します．

電磁気における磁気双極子モーメント
まずは電磁気を軽くさらっておきましょう．電磁気では面積
S
を囲む電流
I
がある時，磁気双極子モーメント
m
を

m
=
I
S
n
  
(1)
 
で定義しました．ただし
n
は電流
I
から右ねじの向きの単位ベクトルです．（後で余裕があれば図を載せます．）この磁気双極子モーメントの作るベクトルポテンシャルは（電気双極子モーメントの作るスカラーポテンシャルと同じ形でかけて）

A
=
μ
0
4
π
m
×
r
r
3
となるのでした．また，これが重要なのですが，この磁気双極子モーメントが磁場
B
中に置かれた時のエネルギーは

U
=
−
m
⋅
B
になります．

軌道角運動量と磁気モーメント
次に，角運動量と磁気モーメントがつながる様子を確かめて見ましょう．半径
a
の円周上を速度
v
で等速円運動する電子のことを考えてみましょう．（これも後で図を追加します．）

そうすると，この電子の作る電流
I
は

I
=
e
v
2
π
a
ですから，円の面積
S
=
π
a
2
と合わせて，磁気モーメントの大きさは

m
=
S
I
=
π
a
2
⋅
e
v
2
π
a
=
e
v
a
2
になります．一方で電子の(
z
方向)軌道角運動量は

L
z
=
m
v
a
ですから，以上二つの式を見合わせて

m
=
e
2
m
L
z
  
(2)
 
と，磁気モーメントと軌道角運動量は単純な比例関係にあることがわかります．（係数に
a
や
I
が出てこないことに注目！）この比例係数のことを
γ
と書き，磁気回転比と言います． 名前の由来は初見だと戸惑いますが，磁気（モーメント）と回転（軌道角運動量）の比という意味です．
これでこの電子を地場の元に置いた時のエネルギーは

U
=
−
m
B
=
−
γ
L
z
B
  
(3)
 
と，軌道角運動量と磁場の積という，見慣れた形でかけることになります．
この結果は解析力学を使っても出てきます．ベクトルポテンシャル
A
の中にある電子のハミルトニアンは

H
=
1
2
m
(
p
−
e
A
)
2
とかけます．一定磁場
B
を生み出すベクトルポテンシャルとして対称ゲージ
A
=
(
−
y
B
/
2
,
−
x
B
/
2
,
0
)
を選択すると，細かい計算過程は省略しますが

H
=
p
2
2
m
−
e
2
m
B
L
z
+
e
2
B
2
8
m
(
x
2
+
y
2
)
とかけて
(3)
と一致します．最後の項は常識的な
B
の範囲で無視できます．

ボーア磁子
前の節では古典的に考えて軌道角運動量と磁気モーメントの関係を調べました．ここで少し量子力学の知識を用いて見ましょう．量子論では軌道角運動量（の
z
成分）は

L
z
=
m
ℏ
に量子化されます．ただし
m
は非負の整数です．したがって磁気モーメント
(2)
は

m
=
e
ℏ
2
m
と，
e
ℏ
/
2
m
の整数倍の値しかとらないことになります．この値をボーア磁子
μ
B
と言い，その値は

μ
B
=
e
ℏ
2
m
e
=
5.788
×
10
−
5
e
V
/
T
になります．量子力学や統計力学ではしばしば角運動量を無次元で書くことがあります．その時には
(2)
は

m
=
μ
B
L
z
とかける事になります．（つまり
L
z
=
0
,
1
,
2
,
⋯
という事になります．）本記事では以下この単位系を使う事にしましょう．

スピンと磁気モーメント
今までは，軌道角運動量についての話でしたので，ここからいよいよスピンについての話をしましょう．スピンは本質的に量子力学的な概念ですから，磁気モーメントも今までの
(1)
での定義で考えるのには無理があります．そこで発想を転換して，もしハミルトニアンに
(3)
のような
B
と"何か"の内積でかけるような量があった時，その"何か"をスピン磁気モーメントと定義することにします．では実際にそんな量が存在するのでしょうか，やって見ましょう．
ハミルトニアンとしては，ベクトルポテンシャルの元にある電子のハミルトニアン

H
=
1
2
m
e
(
^
p
−
e
A
)
2
に置き換え
^
p
→
^
p
⋅
σ
を施したもの

H
=
1
2
m
e
{
σ
⋅
(
^
p
−
e
A
)
}
2
を採用しましょう．ただし，
σ
はパウリのスピンベクトル
(
σ
1
,
σ
2
,
σ
3
)
，
m
e
は電子質量であることを明示しています．ここに公式

(
a
⋅
σ
)
(
b
⋅
σ
)
=
a
⋅
b
+
i
(
a
×
b
)
⋅
σ
を用いて変形して行きます．そうすると

H
=
1
2
m
e
(
^
p
−
e
A
)
2
−
e
ℏ
2
m
e
B
⋅
σ
となってめでたく，
(3)
と同じ形の項が出てきました．つまり磁気モーメントは

m
=
e
ℏ
2
m
e
σ
という事になります．さらにスピン角運動量
S
は，（無次元になる単位系を使っていることから）
S
=
σ
/
2
ですから

m
=
e
ℏ
m
e
S
=
2
μ
B
S
と書けます．これを軌道角運動量の場合の結果と見比べてみると，係数が
2
倍だけ違うことがわかります．後々のことも考えてこの係数
2
の事をg因子と名付けましょう．このg因子はさらに相対論的な効果を加味したりすることで他の値も取り得るからです．つまり，なんらかの角運動量を一般に
J
とかいて

m
=
g
μ
B
J
  
(4)
 
と表した時，gは色々な値を取りうるということです．私たちが今までで導いたことは，軌道角運動量に対しては
g
=
1
，スピン角運動量に対しては
g
=
2
となることです．他に例えば全角運動量 
J
=
L
+
S
に対してはランデのg因子

g
=
3
2
+
s
(
s
+
1
)
−
l
(
l
+
1
)
2
J
(
J
+
1
)
になることが知られています．

まとめ
私たちは角運動量が磁気モーメントを生み出すことについて考えてきました．その過程で磁気回転比
γ
やボーア磁子
μ
B
という物理量を紹介しました．結果として，磁気モーメント
m
と角運動量
J
の間に
(4)
なる関係式が成り立つことを示しました．ここに
g
はg因子と呼ばれる量です．