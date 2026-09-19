"""MLP 参数总量关于层数 L 的图像 (N 固定, L 为变量)。

网络: 输入 M -> L 个隐层(每层 W = N/L 个神经元) -> 输出 1 个神经元
参数总量 = MW + W + (L-1)(W^2 + W) + W + 1,  W = N/L
        = M(N/L) + (N/L) + (L-1)((N/L)^2 + (N/L)) + (N/L) + 1
        = (L-1)(N/L)^2 + (M+2)(N/L) + 1

要换 N 改 N_TOTAL 一行即可。

运行: code/py param_vs_depth.py
输出: param_vs_depth.svg
"""

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import torch

M = 2          # 输入维度
N_TOTAL = 1000  # 神经元总数 N (固定)
L = np.arange(1, 31)  # 层数 L (变量)


def params_formula(M, L, W):
    return M * W + W + (L - 1) * (W**2 + W) + W + 1


def params_torch(M, L, W):
    """输入 M -> L 个宽度 W 的隐层 -> 1 个输出"""
    layers = [torch.nn.Linear(M, W), torch.nn.ReLU()]
    for _ in range(L - 1):
        layers += [torch.nn.Linear(W, W), torch.nn.ReLU()]
    layers += [torch.nn.Linear(W, 1)]
    return sum(p.numel() for p in torch.nn.Sequential(*layers).parameters())


# ---------- 自检: 公式 == PyTorch 实际参数量 ----------
for l in (1, 2, 3, 5, 10):
    for w in (8, 32, 100):
        assert params_formula(M, l, w) == params_torch(M, l, w), f"L={l} W={w}"
print(f"[check] 公式 == PyTorch 参数量 (M={M}, L in 1/2/3/5/10, W in 8/32/100) OK")

# 用 torch 在真实 W = N/L 上再对一遍 (W 需为整数)
for l in (2, 4, 5, 10, 20, 25):
    assert N_TOTAL % l == 0
    a, b = params_formula(M, l, N_TOTAL // l), params_torch(M, l, N_TOTAL // l)
    assert a == b, f"L={l}: {a} != {b}"
print(f"[check] N={N_TOTAL}, W=N/L 为整数的各 L 上 torch 实数一致 OK")


# ---------- 画图 ----------
plt.rcParams.update({
    "svg.fonttype": "path",
    "font.size": 11,
    "axes.linewidth": 0.9,
    "font.sans-serif": ["Noto Sans CJK SC", "DejaVu Sans"],  # 中文字体
    "font.family": "sans-serif",
    "axes.unicode_minus": False,
})
fig, ax = plt.subplots(figsize=(5.6, 3.3), dpi=200)

y = params_formula(M, L, N_TOTAL / L)
ax.plot(L, y, color="#1f77b4", linewidth=1.9, marker="o", markersize=4)
ax.set_yscale("log")
ax.set_xlabel("层数 L")
ax.set_ylabel("参数总量")
ax.set_title(f"N = {N_TOTAL:,} 固定,  每层宽度 W = N/L,  输入 M = {M}", loc="left", fontsize=10)
ax.set_yticks([5e3, 1e4, 2e4, 5e4, 1e5, 2e5])
ax.set_yticklabels(["5千", "1万", "2万", "5万", "10万", "20万"])

ax.grid(True, color="#e8e8e8", linewidth=0.7)
ax.set_axisbelow(True)
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)
ax.set_xticks(range(0, 31, 5))

fig.tight_layout()
fig.savefig("param_vs_depth.svg", format="svg", bbox_inches="tight")
print("[out] param_vs_depth.svg")

print(f"\nM={M}, N={N_TOTAL}:")
for l in (1, 2, 3, 4, 5, 10, 20, 30):
    print(f"  L={l:<3} W={N_TOTAL/l:7.1f}  参数量={params_formula(M, l, N_TOTAL/l):10.0f}")
