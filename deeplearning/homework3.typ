#import "@preview/homiework:0.1.0": homework

#show: homework.with(
course: "Deep Learning",
  semester: "秋 2026",
  number: "3",
  author: "冯裕凯",
  date: datetime.today(),
)

= 3.1
$ D_(f) &= integral q(-((p)/q + 1)log ((p)/q + 1)/(2) + (p)/q log (p)/q) \ &= integral q(-(p)/q log (((p)/q + 1)/(2))/((p)/q) - log (1+(p)/q)/(2) ) \ &= integral q (-(p)/q log (p+q)/(2p) - log (p+q)/(2q)) \ &= integral p log (p)/((p+q)/(2)) + q log (q)/((p+q)/(2)) \ &= "JS"(p,q) \ $ 

= 3.2
$ f((p_(X))/(p_(G))) = sup {(p_(X))/(p_(G)) t - f^(*)(t)} = (p_(X))/(p_(G)) D^(*) - f^(*)D^(*) $ 
thus, $D^(*)$ follows above equation.

= 3.3
$ f^(*)(t) = sup {x t - f(x)} = x^(*) t - f(x^(*)) $ 
$ (partial (x t - f(x)))/(partial x) = t-(log x - log (x+1)) => x^(*) = (e^(t))/(1-e^(t)) $
thus,
$ f^(*)(t) &= x^(*) t - f(x^(*)) \ &= -log(1-e^(t)) \ $ 
$ f((p_(X))/(p_(G))) = (p_(X))/(p_(G))log (p_(X))/(p_(X) + p_(G)) + log (p_(G))/(p_(G)+p_(X)) $ 
thus,$D^(*) = log (p_(X))/(p_(X) + p_(G))$ 
set f in $V(G,D^(*))$,we have
$V(G,D^(*)) = "JS"(p,q)$

= 3.4
$ C^(tack.b) = mat(omega_(1),0;omega_(2),0;omega_3,omega_1;0,omega_2;0,omega_3) $ 

= 3.5
$ "KL"(p(x,y),p_(c)(x,y)) &= EE_(p) (log (p(x,y))/(p_(c)(x,y))) \ &= EE_(p) (log (p(x)p(y|x))/(p_(c)(x)p_(c)(y|x))) \ &= EE_(p) log (p(y|x))/(p_(c)(y|x)) \ &= "Constant" - EE_(p) log p_(c)(y|x) \ $ 

= 3.6
关于C最小化$R_(p)$ 等价与最小化$"KL"(p_(g),p_(c))$.因此最小化该项等价与$ min_(p_(g))min_(p_(c)) R_(p) = min_(p_(g)) R_(p)|_(p_(c) = p_(g)) $
因此最终$p=p_(c)=p_(g)$
