import matplotlib.pyplot as plt
import control as ct

R = 1.44
L = 5.61 * 10 ** (-4)
J = 1.29 * 10 ** (-4)
f = 7.2 * 10 ** (-5)
Kem = 0.10

K = Kem / (R * f + Kem ** 2)
Zem = (R * J) / (R * f + Kem ** 2)
Zel = L / R

G = ct.TransferFunction([K], [Zel * Zem, Zel + Zem, 1])

fig, axes = plt.subplots(1, 2, figsize=(12, 4))

ct.step_response(G, T=None, output=None, X0=None)
ct.step_response(G)
ct.step_response(G, plot=True, ax=axes[0])
ct.bode_plot(G, ax=axes[1], dB=True, plot=True)

axes[0].set_title("Step Response")
axes[1].set_title("Bode Plot")

plt.tight_layout()
plt.show()
