"""一阶导数对比: sigmoid / tanh / LeakyReLU / ELU / softplus   (gamma = 0.2)

运行: code/py activations.py     (或 .venv/bin/python activations.py)
输出: gradients.svg (函数图 + 导数图) 和一张数值对照表。
"""

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt

GAMMA = 0.2
XMIN, XMAX = -6.0, 6.0


# ---------- 激活函数 (数值稳定写法) ----------
def sigmoid(x):
    x = np.asarray(x, dtype=float)
    e = np.exp(-np.abs(x))
    return np.where(x >= 0, 1 / (1 + e), e / (1 + e))


def tanh(x):
    return np.tanh(x)


def leaky_relu(x):
    x = np.asarray(x, dtype=float)
    return np.where(x > 0, x, GAMMA * x)


def elu(x):
    x = np.asarray(x, dtype=float)
    return np.where(x > 0, x, GAMMA * np.expm1(np.minimum(x, 0)))


def softplus(x):
    x = np.asarray(x, dtype=float)
    return np.log1p(np.exp(-np.abs(x))) + np.maximum(x, 0)


# ---------- 一阶导数 ----------
def d_sigmoid(x):
    s = sigmoid(x)
    return s * (1 - s)


def d_tanh(x):
    t = np.tanh(x)
    return 1 - t * t


def d_leaky_relu(x):
    return np.where(np.asarray(x, dtype=float) > 0, 1.0, GAMMA)


def d_elu(x):
    x = np.asarray(x, dtype=float)
    return np.where(x > 0, 1.0, GAMMA * np.exp(np.minimum(x, 0)))


def d_softplus(x):
    # d/dx log(1+e^x) = sigmoid(x)，恒等
    return sigmoid(x)


FUNCS = [
    ("sigmoid", sigmoid, d_sigmoid, "#1f77b4", "-"),
    ("tanh", tanh, d_tanh, "#d62728", "-"),
    ("LeakyReLU", leaky_relu, d_leaky_relu, "#2ca02c", "-"),
    ("ELU", elu, d_elu, "#9467bd", "-"),
    ("softplus", softplus, d_softplus, "#ff7f0e", "--"),
]


# ---------- 自检: 解析导数 vs 中心差分 ----------
def check():
    h, worst = 1e-5, 0.0
    x = np.linspace(-5, 5, 401)
    x = x[np.abs(x) > 1e-9]  # 跳过 0 附近的不可导点
    for _, f, df, _, _ in FUNCS:
        worst = max(worst, np.max(np.abs(df(x) - (f(x + h) - f(x - h)) / (2 * h))))
    assert worst < 1e-6, f"导数与有限差分不符: {worst}"
    print(f"[check] 解析导数 vs 中心差分, 最大误差 = {worst:.2e}")


check()
assert abs(softplus(1.7 + 1e-6) - softplus(1.7 - 1e-6)) / 2e-6 - sigmoid(1.7) < 1e-8
assert abs(float(d_tanh(0)) - 1) < 1e-15 and abs(float(d_sigmoid(0)) - 0.25) < 1e-15
print("[check] softplus' == sigmoid(x), sigmoid'(0)=0.25, tanh'(0)=1  OK")


# ---------- 数值对照表 ----------
xs = np.linspace(XMIN, XMAX, 40001)
print("\n函数       f'(0)      max f'    f'(-3)     f'(3)      梯度>0.1的区间宽")
for name, f, df, _, _ in FUNCS:
    d = df(xs)
    width = float(np.sum(d > 0.1) * (xs[1] - xs[0]))
    print(f"{name:<10} {float(df(0)):<10.4f} {d.max():<9.4f} {float(df(-3)):<10.5f} {float(df(3)):<10.5f} {width:.2f}")

print("\n深层缩放因子 (n 层每层同一导数):")
for name, _, df, _, _ in FUNCS:
    for tag, x in (("x=0", 0.0), ("x=-3", -3.0)):
        g = float(df(x))
        print(f"  {name:<10} f'({tag})={g:.5f}   ^10={g**10:.3e}   ^20={g**20:.3e}")


# ---------- 画图 ----------
plt.rcParams.update({
    "svg.fonttype": "path",  # 文字转路径，避免嵌入 Typst 时字体对不上
    "font.size": 11,
    "axes.linewidth": 0.9,
})

fig, (ax_f, ax_d) = plt.subplots(1, 2, figsize=(8.6, 3.0), dpi=200)
x = np.linspace(XMIN, XMAX, 1201)

for ax, get, title, ylim in ((ax_f, lambda f, df: f(x), "f(x)", (-1.5, 2.5)),
                             (ax_d, lambda f, df: df(x), "f'(x)", (-0.30, 1.2))):
    for name, f, df, color, ls in FUNCS:
        ax.plot(x, get(f, df), color=color, linestyle=ls, linewidth=1.8, label=name)
    ax.set_xlim(XMIN, XMAX)
    ax.set_ylim(*ylim)
    ax.set_xticks(range(int(XMIN), int(XMAX) + 1, 2))
    ax.axhline(0, color="#999", linewidth=1)
    ax.axvline(0, color="#999", linewidth=1)
    ax.grid(True, color="#e8e8e8", linewidth=0.7)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.set_title(title, loc="left", fontsize=12)
    ax.legend(loc="upper left", fontsize=9.5, frameon=False, handlelength=2.0)

# 导数图上标出 sigmoid 的梯度上界 0.25
ax_d.axhline(0.25, color="#1f77b4", linewidth=1, linestyle=":", alpha=0.8)
ax_d.text(XMAX - 0.1, 0.25 + 0.03, "0.25", color="#1f77b4", fontsize=9, ha="right")

fig.tight_layout()
fig.savefig("gradients.svg", format="svg", bbox_inches="tight")
print("\n[out] gradients.svg")
