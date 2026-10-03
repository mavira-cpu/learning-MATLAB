# MATLAB & Signal Processing Explorations

A repository of verified MATLAB and GNU Octave scripts covering core concepts in **Signal Processing**, **Linear Systems**, **Fourier Analysis**, and **Symbolic Computation**. This library serves as an educational reference for understanding signal generation, convolution mechanics, frequency domain analysis, and transfer function decomposition.

---

## 📚 Topics Covered & Key MATLAB Functions

### 1. Elementary Signals & Signal Generation
* **Script**: `elementary_signals.m`
* **Concepts**: Generation of foundational deterministic signals (rectangular, triangular, ramp, step, signum, Dirac delta, sinc, sawtooth, and continuous sinusoids).
* **Key Commands**:
  * `sinc(t)` — Computes the normalized cardinal sine function $\frac{\sin(\pi t)}{\pi t}$.
  * `mod(t, T)` — Generates periodic saw/triangular waveforms by modulo arithmetic.
  * `stem(t, x)` — Plots discrete sequence data or impulses.
  * `findall(gcf, 'type', 'axes')` — Mass-modifies axis properties across multiple subplots.

---

### 2. Time-Domain Convolution & Case Studies
* **Scripts**: 
  * `discrete_convolution_scaling.m`
  * `convolution_trapezoid_simulation.m`
  * `step_exponential_convolution.m`
* **Concepts**: Numerical and graphical continuous-time convolution ($y(t) = x(t) * h(t)$), demonstrating moving-block overlaps, scaling discrete sums by $dt$, and handling piecewise exponential responses.
* **Key Commands**:
  * `conv(x, h) * dt` — Performs discrete convolution scaled by sample spacing $dt$ to approximate Riemann continuous integration.
  * `integral(fun, a, b)` — Performs adaptive numerical integration over specified bounds.
  * `fill(x, y, color)` — Fills 2D polygonal regions to visualize integrand overlap areas.

---

### 3. Fourier Series & Fourier Transform Analysis
* **Scripts**:
  * `plot_fourier_rect.m`
  * `rect_fourier_transform_analysis.m`
  * `rect_fourier_fft_vs_integral.m`
  * `cosine_fourier_transform_analysis.m`
* **Concepts**: Harmonic synthesis of periodic square waves (Gibbs phenomenon), continuous Fourier transform via numerical integration versus discrete `fft()`, and spectral zero-crossing phase cleaning.
* **Key Commands**:
  * `fft(x)` & `ifft(X)` — Discrete Fourier Transform and its inverse.
  * `fftshift(X)` / `ifftshift(x)` — Shifts zero-frequency component to the center of the spectrum for accurate double-sided plotting and phase alignment.
  * `angle(X)` & `abs(X)` — Extracts phase angle (radians) and magnitude from complex frequency vectors.
  * `rad2deg(rad)` — Converts phase angles from radians to degrees.

---

### 4. Noise Generation & Statistical Signal Processing
* **Script**: `add_noise_to_sine.m`
* **Concepts**: Corrupting deterministic sinusoidal signals with Additive White Gaussian Noise (AWGN) and analyzing the resulting Signal-to-Noise Ratio (SNR).
* **Key Commands**:
  * `randn(1, N)` — Generates pseudorandom values drawn from a standard normal distribution $\mathcal{N}(0, 1)$.

---

### 5. Symbolic Computation & Linear Systems
* **Scripts**:
  * `partial_fraction_expansion.m`
  * `symbolic_laplace_transforms.m`
* **Concepts**: Computing partial fraction decompositions (residues, poles, direct terms) of rational Laplace transfer functions $H(s)$, and executing analytical forward Laplace transforms.
* **Key Commands**:
  * `residue(num, den)` — Computes partial fraction expansion $[r, p, k]$ for rational polynomials.
  * `syms s t w x` — Declares symbolic variables (via Symbolic Math Toolbox or Octave Symbolic package).
  * `laplace(f, t, s)` — Computes analytical Laplace transform of symbolic expression $f(t)$.
  * `pkg load symbolic` — Loads the SymPy wrapper interface in GNU Octave environments.
