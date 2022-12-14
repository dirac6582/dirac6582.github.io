---
layout: single
title:  "2原子モデルにおけるLOTO分裂のマクロな理論"
date:   2022-09-04 10:03:40 +0900
categories: physics
mathjax: true
---


## 2原子モデルにおけるLO-TO分裂のマクロな理論

(Born Fuangの$7，P82，)

ローレンツモデルでは調和振動子に外部電場をかけたときの誘電応答を調べた．本節では2原子モデルに外部電場をかけることで同様の誘電応答について考え，そこからLO-TO分裂がどのように発生するかを調べる．

2原子モデルを考えて，それぞれのイオン質量を$M$とする．二原子の換算質量は

$$
M=\frac{M_{+}M_{-}}{M_{+}+M_{-}}
$$

二原子モデルを記述するパラメータを基準座標の一つにとって$w$とする．

$$
w=\sqrt{M/V}(x_{+}-x_{-})
$$

この時，$w$は電場$E$，分極$P$と以下の関係にある．

$$
w'' = b_{11} w+b_{12} E \\
P = b_{21} w+b_{22} E
$$

一つ目は外場$E$の中での運動方程式，二つ目は分極$P$を電場と$w$で表した式である．ここで，係数$b$には$b_{21}=b_{12}$なる関係があることが知られている．振動解を

$$
w=w_0e^{-i\omega t} \\
P=P_0e^{-i\omega t} \\
E=E_0e^{-i\omega t} 
$$

とおく．これを関係式に代入すると

$$
(-i\omega)^2w_0=b_{11}w_0+b_{12}E_0 \\
P_0=b_{21}w_0+b_{22}E_0 
$$

となって，$w$を除去すると

$$
P=(b_{22}+\frac{b_{21}b_{12}}{-b_{11}-\omega^2})E
$$

を得る．一方で誘電関数の定義は$D=E+4\pi P=\epsilon E$つまり$P=(\epsilon-1)/4\pi$だから

$$
\epsilon=1+4\pi(b_{22}+\frac{b_{21}b_{12}}{-b_{11}-\omega^2})
$$

を得る．これでまたローレンツ型の誘電関数が導出された．そこで便利さのために再び

$$
\epsilon=\epsilon^{\infty}+\frac{\epsilon^{0}-\epsilon^{\infty}}{1-(\omega/\omega_{0})^2}
$$

と書くことにすると，係数間の関係は

$$
b_{11}=-\omega_0^2 \\
b_{12}=b_{21}=\sqrt{\frac{\epsilon^{0}-\epsilon^{\infty}{4\pi}}\omega_{0} \\
b_{22}=\frac{\epsilon^{\infty}-1}{4\pi}
$$

となる．


長波長極限の光学フォノンについて考える．静的なMaxwell方程式を使えると仮定すると[^2]，

$$
\Delta D = \Delta (E+4\pi P) =0
$$

ただし$E$は静的Maxwell方程式より偏光していない（irrotational）と仮定する．すなわち$\Delta \times E = 0$ を満たすとする．運動方程式の二つ目からPを除去すると

$$
\Delta E = \frac{-4\pi b_{21}}{1+4\pi b_{22}}\Delta w
$$

となる．ここで$w$を横波成分と縦波成分に分けて

$$
w=w_{t}+w_{l} \\
\Delta \time w_{l}= 0  (irrotational) \\
\Delta w_{t}= 0 (solenoidal) \\
$$

と分解する．条件式から右辺には成分だけが残って

$$
\Delta E = \frac{-4\pi b_{21}}{1+4\pi b_{22}}\Delta w_{l}
$$

ここで$E$もirrotatinalだから，解としては自明な

$$
E=\frac{-4\pi b_{21}}{1+4\pi b_{22}} w_{l}
$$

のみが許される[^1]．この式を$w$の運動方程式に代入すると

$$
w'' = b_{11} w+b_{12} \frac{-4\pi b_{21}}{1+4\pi b_{22}} w_{l}
$$

横波も縦波も時間微分してもそのまま横波と縦波だから，$w=w_{t}+w_{l}$と分解するとその微分も$w''=w''_{t}+w''_{l}$と分解できる．従って運動方程式を縦波成分と横波成分に分解したものは

$$
w''_{t}=b_{11}w_{t}=-\omega_0^2w_{t} \\
w''_{l}=b_{11}w_{l}+b_{12} \frac{-4\pi b_{21}}{1+4\pi b_{22}} w_{l} = -(\epsilon^{0}/\epsilon^{\infty})\omega_0^2 w_{l}
$$

となり，$w_{t}$は固有振動数$\omega_0$，$w_{l}$は固有振動数$\omega_l=\sqrt{\epsilon^{0/\epsilon^{\infty}}\omega_0$で振動する波ということがわかる．

ここで$\epsilon^{0}>\epsilon^{\infty}$だから$\omega_{t}\le \omega_{l}$が常に満たされていることに気をつける．この違いの起源は明確で，横波の場合には電場による力が消失するのに対して，縦波の場合には振動する際に電場による力が残留するからだ．こう考えると縦波の場合のみ振動数がずれることも理解しやすい．


[^1]: ここにsolenoidalな成分$E_{t}$を加えることが許されないから．逆にirrotationalな成分を加えるとこの式が満たされないのは自明だ．

[^2]: ここでは遅延効果は考えていない．