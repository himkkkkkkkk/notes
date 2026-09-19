#import "@preview/homiework:0.1.0": homework

#show: homework.with(
course: "Deep Learning",
  semester: "秋 2026",
  number: "1",
  author: "冯裕凯",
  date: datetime.today(),
)

= Problem 1.1
$ (partial L)/(partial omega_(1 1)^(1)) &= (partial L)/(partial h_3) ((partial h_3)/(partial h_2^(1))(partial h_2^(1))/(partial h_1^(1)) + (partial h_3)/(partial h_2^(2))(partial h_2^(2))/(partial h_1^(1)))(partial h_1^(1))/(partial omega_(11)^(1)) \ &= (y-hat(y))sigma(z_3)(1-sigma(z_3))sigma(z_1^(1))(1-sigma(z_1^(1)))(omega_1^(3)omega_(11)^(2)sigma(z_2^(1))(1-sigma(z_2^(1))) + omega_2^(3)omega_(21)^(2)sigma(z_2^(2))(1-sigma(z_2^(2)))) x_1 \ $ 
其中， $h_(i)^(j)$ 表示第$i$ 层第$j$ 个神经元的输出，$z_(i)^(j)$表示没有激活的值。
其中，$z$可以继续进行展开，我使用haskell语言基于递归编写了求导数的代码，展开结果如下:

#raw(
  "(0.5 * (((0 - ((sigmoid((((w1_3 * sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2))) + (w2_3 * sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)))) + b3)) * (1 - sigmoid((((w1_3 * sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2))) + (w2_3 * sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)))) + b3)))) * ((w1_3 * ((sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2)) * (1 - sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2)))) * (w11_2 * ((sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1)) * (1 - sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1)))) * x1)))) + (w2_3 * ((sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)) * (1 - sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)))) * (w21_2 * ((sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1)) * (1 - sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1)))) * x1))))))) * (y - sigmoid((((w1_3 * sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2))) + (w2_3 * sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)))) + b3)))) + ((y - sigmoid((((w1_3 * sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2))) + (w2_3 * sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)))) + b3))) * (0 - ((sigmoid((((w1_3 * sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2))) + (w2_3 * sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)))) + b3)) * (1 - sigmoid((((w1_3 * sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2))) + (w2_3 * sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)))) + b3)))) * ((w1_3 * ((sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2)) * (1 - sigmoid((((w11_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w12_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b1_2)))) * (w11_2 * ((sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1)) * (1 - sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1)))) * x1)))) + (w2_3 * ((sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)) * (1 - sigmoid((((w21_2 * sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1))) + (w22_2 * sigmoid((((w21_1 * x1) + (w22_1 * x2)) + b2_1)))) + b2_2)))) * (w21_2 * ((sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1)) * (1 - sigmoid((((w11_1 * x1) + (w12_1 * x2)) + b1_1)))) * x1))))))))))"
)

代码如下:
```hs
data Expr = Var String
            | Const Double
            | Add Expr Expr
            | Sub Expr Expr 
            | Mul Expr Expr
            | Sigmoid Expr
            deriving (Show,Eq)

diff :: String -> Expr -> Expr
diff x (Var v) 
             | x==v = Const 1
             | otherwise = Const 0

diff _ (Const _) = Const 0
diff x (Add a b) = Add (diff x a) (diff x b)
diff x (Sub a b) = Sub (diff x a) (diff x b)
diff x (Mul a b) = Add (Mul (diff x a) b) (Mul a (diff x b)) 
diff x (Sigmoid a) = Mul (Mul (Sigmoid a) (Sub (Const 1) (Sigmoid a))) (diff x a)

v :: String -> Expr
v = Var

-- 第一层
z11 :: Expr
z11 =
    Add
        (Add
            (Mul (v "w11_1") (v "x1"))
            (Mul (v "w12_1") (v "x2")))
        (v "b1_1")

z21 :: Expr
z21 =
    Add
        (Add
            (Mul (v "w21_1") (v "x1"))
            (Mul (v "w22_1") (v "x2")))
        (v "b2_1")

h11 :: Expr
h11 = Sigmoid z11

h21 :: Expr
h21 = Sigmoid z21


-- 第二层
z12 :: Expr
z12 =
    Add
        (Add
            (Mul (v "w11_2") h11)
            (Mul (v "w12_2") h21))
        (v "b1_2")

z22 :: Expr
z22 =
    Add
        (Add
            (Mul (v "w21_2") h11)
            (Mul (v "w22_2") h21))
        (v "b2_2")

h12 :: Expr
h12 = Sigmoid z12

h22 :: Expr
h22 = Sigmoid z22


-- 输出层
z3 :: Expr
z3 =
    Add
        (Add
            (Mul (v "w1_3") h12)
            (Mul (v "w2_3") h22))
        (v "b3")

yhat :: Expr
yhat = Sigmoid z3


-- 损失函数
loss :: Expr
loss =
    Mul
        (Const 0.5)
        (Mul
            (Sub (v "y") yhat)
            (Sub (v "y") yhat))

simplify :: Expr -> Expr
simplify (Add a b) = case (simplify a, simplify b) of
                    (Const 0 ,b ) -> b
                    (a, Const 0 ) -> a
                    (a,b) -> Add a b
simplify (Sub a b) | a==b = Const 0
                   |otherwise = case (simplify a,simplify b) of 
                    (a,Const 0)->a
                    (x,y)->Sub x y
simplify (Mul a b) = case (simplify a, simplify b) of
                    (Const 0 , _) -> Const 0
                    (_,Const 0) -> Const 0
                    (Const 1 , b) -> b
                    (a,Const 1) -> a
                    (a,b) -> Mul a b
simplify (Sigmoid a) = Sigmoid (simplify a)

simplify a = a

pretty :: Expr -> String

pretty (Var x) =
    x

pretty (Const x)
    | x == 0 = "0"
    | x == 1 = "1"
    | otherwise = show x

pretty (Add a b) =
    "(" ++ pretty a ++ " + " ++ pretty b ++ ")"

pretty (Sub a b) =
    "(" ++ pretty a ++ " - " ++ pretty b ++ ")"

pretty (Mul a b) =
    "(" ++ pretty a ++ " * " ++ pretty b ++ ")"

pretty (Sigmoid x) =
    "sigmoid(" ++ pretty x ++ ")" 

main = print $ pretty $ simplify $ diff "w11_1" loss
--main = print $ pretty $ simplify $ diff "x" $ Mul ( v "x"  ) (Sub (v "x") (v "y"))
```

#pagebreak()

= Problem 1.2

五个激活函数的一阶导数，其中 $gamma = 0.2$：

$ sigma(x) = 1/(1+e^(-x)), quad sigma'(x) = sigma(x)(1-sigma(x)), quad sigma'(0) = 0.25 $

$ tanh(x) = (e^x - e^(-x))/(e^x + e^(-x)), quad tanh'(x) = 1 - tanh^2 x, quad tanh'(0) = 1 $

$ "LeakyReLU"(x) = cases(x & x > 0, gamma x quad & x <= 0), quad "LeakyReLU"'(x) = cases(1 & x > 0, gamma quad & x < 0) $

$ "ELU"(x) = cases(x quad & x > 0, gamma(e^x - 1) quad & x <= 0), quad "ELU"'(x) = cases(1 & x > 0, gamma e^x quad & x < 0) = cases(1 & x > 0, "ELU"(x) + gamma quad & x < 0) $

$ "softplus"(x) = ln(1 + e^x), quad "softplus"'(x) = 1/(1+e^(-x)) = sigma(x) $

#figure(
  image("code/gradients.svg", width: 100%),
  caption: [左：激活函数 $f(x)$；右：一阶导数 $f'(x)$。虚线 $0.25$ 为 sigmoid 的梯度上界。],
)

各函数导数在截断下的区间宽，区间越宽，则梯度消失的可能性越小：

#align(center, table(
  columns: 5,
  stroke: none,
  inset: 6pt,
  [函数], [$f'(0)$], [$max f'$], [$f'(-3)$], [$f' > 0.1$ 的区间宽],
  [sigmoid], [0.2500], [0.2500], [0.0452], [4.13],
  [tanh], [1.0000], [1.0000], [0.0099], [3.64],
  [LeakyReLU], [0.2 / 1], [1.0000], [0.2000], [12.00],
  [ELU], [0.2 / 1], [1.0000], [0.0100], [6.69],
  [softplus], [0.5000], [1.0000], [0.0474], [8.20],
))

其中 LeakyReLU 与 ELU 在 $x = 0$ 处不可导，表中 $0.2 \/ 1$ 分别表示左导数与右导数。

把每层的导数看作一次梯度缩放，$n$ 层复合后的缩放因子为 $product_(i=1)^n f'(x_i)$，取两处典型工作点（$x = 0$ 处 LeakyReLU 与 ELU 取左导数 $gamma$）：

#align(center, table(
  columns: 3,
  stroke: none,
  inset: 6pt,
  [函数], [$[f'(0)]^10$], [$[f'(-3)]^10$],
  [sigmoid], [$9.5 times 10^(-7)$], [$3.5 times 10^(-14)$],
  [tanh], [$1$], [$8.7 times 10^(-21)$],
  [LeakyReLU], [$1.0 times 10^(-7)$], [$1.0 times 10^(-7)$],
  [ELU], [$1.0 times 10^(-7)$], [$9.6 times 10^(-21)$],
  [softplus], [$9.8 times 10^(-4)$], [$5.8 times 10^(-14)$],
))

= Problem 1.3
假设网络是全链接的，则一层输入为$m$输出为 $n$的网络需要的参数为$m n + n$,其中 $m n$为权重参数，而 $n$为偏置参数
则总共需要参数
 $ N = M (N)/(L) + (N)/(L) + (L-1) (((N)/(L)) ^(2) + (N)/(L)) + (N)/(L) + 1 = -(N^(2))/(L^(2)) + (N^(2) + (M+1) N)/(L) + N + 1 $

#figure(
  image("code/param_vs_depth.svg", width: 74%),
  caption: [$N$ 固定为 $1000$、输入 $M = 2$、每层宽度 $N/L$ 时，参数总量随层数 $L$ 的变化。],
)

