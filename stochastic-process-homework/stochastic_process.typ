#set page(
  header: align(right)[随机过程习题精选],
  number-align: right,
  numbering: "1",
)
#let EX(x) = $EE\[#x\]$

_*1.*_ 令$(X_n)$是$d$维的随机游动,其中序列${xi_n}$满足$P(|xi_n|>=1)>0$.证明:
$ P{attach(sup, b: n>=0)|X_n|=infinity}=1 $
*证:*

设事件$A_i={xi_i>=1},forall i in ZZ^+$,因为$xi_i$是独立同分布,所以$P(A_i)=p>0$,
因此$attach(Sigma, t: infinity, b: i=1)P(A_i)=infinity$.
根据Borel–Cantelli定理,$xi_i>=1$无穷次发生.
因此可以取序列${n_k}_(k>=1)$满足$xi_(n_k)>=1 ,forall k in ZZ^+$.

下面使用反证法:假设$P{attach(sup, b: n>=0)|X_n|=infinity}!=1$,即$exists M>0,X_n in B(X_0,M) ,forall n in ZZ^+$.

则根据_levy连续性定理_,我们有$X_n$的特征函数$phi_n$收敛到在0处连续的特征函数,即
#set math.equation(numbering: "(1)")
$ phi_n->phi "and" lim_(x->0)phi(x) = phi(0) = 1 $ <f1>
然而,如果设$xi_i$的特征函数为$0<=Phi<=1$,则$phi_n=Phi^n$,结合 @f1 得,
#set math.equation(numbering: none)
$ exists delta>0,Phi=1 ,forall x in U(0,delta) $
这说明在某个领域内,$xi_i$为常数,即$xi_i=c$,

若$c=0$,与$P(xi_i>=1)>0$矛盾!

若$c!=0$,则$|X_n|=|X_0+attach(Sigma, t: n, b: i=1)xi_i| = |X_0+n c| in.not B(X_0,M)$,矛盾!

证毕!
#v(0.5em)
_*2.*_ 设($S_n:n>=0$)是从原点出发的对称简单随机游动.设$a,b in ZZ$满足$a<0<b$,定义
$tau_y = inf\{n>=0,S_n=y\}$,以及$tau = tau_a and tau_b$,

求$tau$的数学期望,并证明$ EX(tau_a)=EX(tau_b)=infinity $

*证:*

考虑$\{S_n^2-n\}_(n>=0)$,
$
  EX(S_n^2-n | cal(F)_(n-1)) & = EX(S_n^2 | cal(F)_(n-1))-n \
                             & = 1/2 ((S_(n-1)+1)^2+(S_(n-1)-1)^2) - n \
                             & = S_(n-1)^2+1-n = S_(n-1)^2-(n-1)
$
即其为鞅.

又$ \{tau <= n\}=\{tau_a<=n and tau_b<=n\} = \{tau_a<=n\} inter.big \{tau_b<=n\} = (union.big_(k=1)^n \{S_k = a\}) inter.big (union.big_(k=1)^n \{S_k = b\}) in cal(F)_n $
故$tau$为关于$cal(F)_n$的停时.

显然$\{S_n^2-n\}_(n>=0)$的差有界,并且$EX(tau)<infinity$,故其满足杜布可选停止定理.
$ EX(S_tau^2 - tau) = EX(S_0^2 - 0) = 0 $
因此,$EX(tau) = EX(S_tau^2)$.

_下面计算_ $EX(S_tau^2)$:

由于$S_(n and tau)$一致有界,根据杜布可选停止定理,
$ EX(S_tau) = EX(S_0) = 0 $
而
$ 0 = EX(S_tau) = a P(tau_a<tau_b) + b P(tau_a>tau_b) = a P(tau_a<tau_b) + b (1-P(tau_a<tau_b)) $
解得$ P(tau_a<tau_b)=frac(b-x, b-a),P(tau_a>tau_b)=frac(x-a, b-a) $.
故,
$ EX(S_tau^2) = frac(a^2 b-a b^2, b-a) = -a b $.

取$b=-N$,则$tau = tau_(-N) and tau_b$,且$EX(tau) = N b$,
$
  N b = EX(tau_b and tau_(-N)) = EX(tau_b bb(1)_(tau_b<tau_(-N))) + EX(tau_(-N) bb(1)_(tau_(-N)<tau_b))
$
当$N -> infinity$时,$bb(1)_(tau_(-N)<tau_b) limits(=)^"a.s."0$,
故,
$ infinity = EX(tau_b bb(1)_(tau_b<tau_(-N))) = EX(tau_b) $
同理,
$ EX(tau_a)=EX(tau_b)=infinity $
