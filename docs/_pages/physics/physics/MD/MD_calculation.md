# MD計算(NVEアンサンブルとNVTアンサンブル)

<!--
MD計算の触りの部分を「密度汎関数理論入門-理論とその応用」で読んでみた．
-->

<!--
https://kaityo256.github.io/md2019/nosehoover/index.html
-->

古典MDは結局の所ニュートン方程式を解くということをやっている．これは単純なミクロカノニカルアンサンブルの場合で，この場合，自由度一つについて平均エネルギーが

$$
\frac{1}{2}m\bar{v^2}=\frac{k_BT}{2}
$$

で与えられることを用いて逆に温度を定義する． 運動エネルギーは保存量ではないので，シュミレーション中温度は揺らぐことになる．

## verletの方法

ベレの方法(Verlet algorithm）は分子動力学法などにおいて、原子間（粒子間）に働く力をもとに原子（粒子）を逐次的に動かす単純な差分法の一つ．

原子（粒子）の質量を M、座標を R、力を F とすると、運動方程式は
$$
\frac {d^{2}{\boldsymbol {R}}}{dt^{2}}}={\boldsymbol {F}} M{\frac {d^{2}{\boldsymbol {R}}}{dt^{2}}}={\boldsymbol {F}}
$$
である．加速度 d2R/dt2 を中心差分で近似すると、時間刻み幅を Δt として
$$
{\displaystyle {\frac {d^{2}{\boldsymbol {R}}(t)}{dt^{2}}}\approx {\frac {{\boldsymbol {R}}(t+\Delta t)-2{\boldsymbol {R}}(t)+{\boldsymbol {R}}(t-\Delta t)}{(\Delta t)^{2}}}}{\displaystyle {\frac {d^{2}{\boldsymbol {R}}(t)}{dt^{2}}}\approx {\frac {{\boldsymbol {R}}(t+\Delta t)-2{\boldsymbol {R}}(t)+{\boldsymbol {R}}(t-\Delta t)}{(\Delta t)^{2}}}}
$$
となる．以上から得られた
$$
{\displaystyle {\boldsymbol {R}}_{I}(t+\Delta t)=2{\boldsymbol {R}}_{I}(t)-{\boldsymbol {R}}_{I}(t-\Delta t)+{\frac {{\boldsymbol {F}}_{I}}{M_{I}}}(\Delta t)^{2}}{\displaystyle {\boldsymbol {R}}_{I}(t+\Delta t)=2{\boldsymbol {R}}_{I}(t)-{\boldsymbol {R}}_{I}(t-\Delta t)+{\frac {{\boldsymbol {F}}_{I}}{M_{I}}}(\Delta t)^{2}}
$$
によって原子の位置を更新する．ただし I は原子のインデックスである．QEに実装されているカー・パリネロ法はこのアルゴリズムを利用している．



## カノニカルアンサンブル（NVT）

一方で，系が周囲と熱のやりとりをしている場合はカノニカルアンサンブルでの取り扱いが必要になる．この時は温度Tを固定することになる．カノニカルアンサンブルを綺麗に扱う手法を能勢が開発した．能勢はミクロカノニカルな系のLagrangianを拡張した**拡張Lagrangian**

$$
L=\frac{1}{2}\sum_{i=1}^{3N}m_is(t)^2v_i^2-U+\frac{Q}{2}\left(\frac{ds}{dt}\right)^2-gk_BT\log(s)
$$

を定義した．ここでs(t)は新しく導入された関数．Qは新しく導入されたパラメータ，おそらくgもそう．ここでs(t)=1とすれば3,4項目が落ちてミクロカノニカルのLagrangianと一致する．

　Hooverは少しだけ異なる変数を導入して運動方程式を以下のように書き直した．

$$
\frac{dr_i}{dt}=v_i
$$

$$
\frac{dv_i}{dt}=-\frac{1}{m_i}\frac{\partial U}{\partial r_i}-\frac{d\xi}{dt}v_i
$$

$$
\frac{d\xi}{dt}=\frac{1}{Q}\left[\sum_{i=1}^{3N}m_iv_i^2-3Nk_BT\right]
$$

$$
\frac{d\log s}{dt}=\xi
$$

ここでgの代わりに新しくξが導入されている．2式が運動方程式だが，ξによって摩擦項が追加されている．その摩擦ξは3番目の式によって制御される．1項目がミクロカノニカルでの温度に対応しているから

$$
\frac{d\xi}{dt}=\frac{3Nk_B}{Q}\left[T_{MC}-T\right]
$$

ともかけて，これは粒子の各瞬間の（運動エネルギーによって計算された）温度と系の温度の差によってフィードバックされる形になっている．Qはフィードバックの大きさを定めている．

以上のような計算をNose-Hoover thermostat methodという．


## AIMD〜Car-Parrinello法

最初のAIMDは，原子のMD→電子のDFT→原子のMD→ と繰り返す方法だったが，car-parrinelloは電子と分子を同時に扱う方法を開発した． それは原子系のLに仮想的な電子の自由度が加わった拡張Lagrangianとして

$$
L=\frac{1}{2}\sum_{i=1}^{3N}m_iv_i^2-E[\psi(r)]+\frac{1}{2}\sum_j 2\mu\int dr |\psi(r)|^2+L_{ortho}
$$

ψは電子のKS波動関数，E[ψ]はその時のポテンシャル． 右辺の最初の2項は通常の原子のLだが，それに加えて3項目は電子の運動エネルギーの形．μは仮想的な質量．4項目はKS波動関数の直交性を維持するために加えられたもの．



## 参考文献
密度汎関数理論入門-理論とその応用