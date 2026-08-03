# Basic Course Formula Sheet {#formula-sheet}

This is the cumulative formula sheet for the Basic course. Each section is
labelled by the lecture in which its material is first introduced. Use only
the sections reached so far:

| Session | Formula-sheet sections |
|---|---|
| Tutorial 1 | Lectures 1--3 |
| Tutorial 2 | Lectures 1--5 |
| Tutorial 3 | Lectures 1--8 |
| Tutorial 4 | Lectures 1--10 |
| Closed-book written exam | Lectures 1--10: the complete sheet |

The same complete version will be attached to the written exam. Definitions,
conditions, units, and interpretation remain examinable even when a formula is
provided.

Download the print-ready
[Basic Course Formula Sheet (PDF)](output/pdf/basic-course-formula-sheet.pdf).

::: {.formula-sheet}


## Notation used throughout {#formula-notation}

- \(\Omega\): sample space; \(A,B\): events; \(A^c\): complement.
- \(X,Y\): random variables; \(x_i,y_i\): observed values for row \(i\).
- \(n\): sample size; \(N\): population size.
- \(\mu=E[X]\), \(\sigma^2=\operatorname{Var}(X)\), and \(p\): population
  parameters.
- \(\bar X, S^2,\widehat P\): estimators; \(\bar x,s^2,\hat p\): realised
  estimates.
- \(\alpha\): significance level; \(df\): degrees of freedom.

Unless stated otherwise, tests on this sheet are **two-sided**.

## Lecture 1 - Data summaries and units {#formula-l1}

For a category with count \(n_A\) among \(n\) observations,

\[
\text{proportion}=\frac{n_A}{n},
\qquad
\text{percentage}=100\frac{n_A}{n}\%.
\]

For values \(x_1,\ldots,x_n\),

\[
\bar x=\frac{1}{n}\sum_{i=1}^{n}x_i,
\qquad
\text{range}=\max_i x_i-\min_i x_i.
\]

A change from \(a\%\) to \(b\%\) is \(b-a\) **percentage points**. Its
relative percentage change is

\[
100\frac{b-a}{a}\% \quad (a\ne0).
\]

Keep units throughout: a slope or rate has **outcome units per predictor
unit**.

## Lecture 2 - Probability foundations {#formula-l2}

\[
0\le P(A)\le1,
\qquad P(\Omega)=1,
\qquad P(A^c)=1-P(A).
\]

\[
P(A\cup B)=P(A)+P(B)-P(A\cap B).
\]

If \(A\cap B=\varnothing\), then

\[
P(A\cup B)=P(A)+P(B).
\]

For a finite sample space with equally likely outcomes,

\[
P(A)=\frac{|A|}{|\Omega|}.
\]

A random variable is a function \(X:\Omega\rightarrow\mathbb R\). An event is
a subset of \(\Omega\), not a numerical variable.

## Lecture 3 - PMFs, CDFs, and expectation {#formula-l3}

For a discrete random variable with support \(\mathcal X\),

\[
p_X(x)=P(X=x),
\qquad p_X(x)\ge0,
\qquad \sum_{x\in\mathcal X}p_X(x)=1.
\]

The cumulative distribution function (CDF) is

\[
F_X(a)=P(X\le a)=\sum_{x\le a}p_X(x).
\]

For any CDF,

\[
P(a<X\le b)=F_X(b)-F_X(a).
\]

Expectation and transformed expectation are

\[
E[X]=\sum_{x\in\mathcal X}x\,p_X(x),
\qquad
E[g(X)]=\sum_{x\in\mathcal X}g(x)p_X(x).
\]

If \(X\sim\operatorname{Bernoulli}(p)\),

\[
P(X=1)=p,\quad P(X=0)=1-p,\quad E[X]=p.
\]

## Lecture 4 - Variance and conditioning {#formula-l4}

Let \(\mu=E[X]\). Then

\[
\operatorname{Var}(X)=E[(X-\mu)^2]
=E[X^2]-\{E[X]\}^2,
\qquad
\operatorname{SD}(X)=\sqrt{\operatorname{Var}(X)}.
\]

For \(X\sim\operatorname{Bernoulli}(p)\),

\[
\operatorname{Var}(X)=p(1-p).
\]

The usual sample variance and SD are

\[
s^2=\frac{1}{n-1}\sum_{i=1}^{n}(x_i-\bar x)^2,
\qquad s=\sqrt{s^2}.
\]

For \(P(B)>0\),

\[
P(A\mid B)=\frac{P(A\cap B)}{P(B)},
\qquad
P(A\cap B)=P(A\mid B)P(B).
\]

If \(B_1,\ldots,B_k\) partition \(\Omega\),

\[
P(A)=\sum_{i=1}^{k}P(A\mid B_i)P(B_i).
\]

Bayes' rule is

\[
P(B_i\mid A)
=\frac{P(A\mid B_i)P(B_i)}
{\sum_{j=1}^{k}P(A\mid B_j)P(B_j)}.
\]

## Lecture 5 - Joint PMFs and correlation {#formula-l5}

For discrete \(X,Y\),

\[
p_{X,Y}(x,y)=P(X=x,Y=y).
\]

Marginal and conditional PMFs are

\[
p_X(x)=\sum_y p_{X,Y}(x,y),
\qquad
p_{X\mid Y}(x\mid y)=\frac{p_{X,Y}(x,y)}{p_Y(y)}.
\]

Discrete \(X\) and \(Y\) are independent when, for every \(x,y\),

\[
p_{X,Y}(x,y)=p_X(x)p_Y(y).
\]

For independent events \(A,B\) with \(P(B)>0\),
\(P(A\mid B)=P(A)\).

\[
\operatorname{Cov}(X,Y)
=E[(X-\mu_X)(Y-\mu_Y)]
=E[XY]-E[X]E[Y].
\]

\[
\rho_{XY}
=\frac{\operatorname{Cov}(X,Y)}
{\operatorname{SD}(X)\operatorname{SD}(Y)},
\qquad -1\le\rho_{XY}\le1.
\]

Sample covariance and correlation are

\[
s_{XY}=\frac{1}{n-1}\sum_{i=1}^{n}(x_i-\bar x)(y_i-\bar y),
\qquad
r_{XY}=\frac{s_{XY}}{s_Xs_Y}.
\]

Independence implies zero covariance when the relevant expectations exist;
zero covariance does not generally imply independence.

\newpage

## Lecture 6 - Continuous distributions {#formula-l6}

For a continuous random variable with PDF \(f_X\),

\[
f_X(x)\ge0,
\qquad \int_{-\infty}^{\infty}f_X(x)\,dx=1,
\qquad P(X=x)=0.
\]

\[
P(a<X\le b)=\int_a^b f_X(x)\,dx=F_X(b)-F_X(a).
\]

If \(X\sim U(a,b)\),

\[
f_X(x)=\frac{1}{b-a}\quad(a\le x\le b),
\qquad
P(c<X<d)=\frac{d-c}{b-a},
\]

\[
E[X]=\frac{a+b}{2},
\qquad
\operatorname{Var}(X)=\frac{(b-a)^2}{12}.
\]

If \(X\sim N(\mu,\sigma^2)\), then

\[
Z=\frac{X-\mu}{\sigma}\sim N(0,1).
\]

Approximately 68% lies within \(\mu\pm\sigma\), and 95% within
\(\mu\pm1.96\sigma\).

## Lecture 7 - Samples and estimators {#formula-l7}

\[
\bar X=\frac{1}{n}\sum_{i=1}^{n}X_i,
\qquad
\widehat P=\frac{1}{n}\sum_{i=1}^{n}X_i
\quad\text{for a 0/1 variable}.
\]

\[
S^2=\frac{1}{n-1}\sum_{i=1}^{n}(X_i-\bar X)^2,
\qquad df=n-1.
\]

The degrees of freedom follow from the constraint

\[
\sum_{i=1}^{n}(X_i-\bar X)=0.
\]

For sampling without replacement, the course's independence approximation
uses the 10% condition:

\[
n\le0.10N.
\]

Random sampling supports generalisation to the sampling frame; random
assignment supports causal treatment comparisons.

## Lecture 8 - Sampling distributions and SEs {#formula-l8}

For independent, identically distributed observations with mean \(\mu\) and
variance \(\sigma^2\),

\[
E[\bar X]=\mu,
\qquad
\operatorname{Var}(\bar X)=\frac{\sigma^2}{n},
\qquad
\operatorname{SE}(\bar X)=\frac{\sigma}{\sqrt n}
\approx\frac{S}{\sqrt n}.
\]

The CLT gives, for sufficiently large \(n\),

\[
\frac{\bar X-\mu}{\sigma/\sqrt n}\ \dot\sim\ N(0,1),
\qquad
\bar X\ \dot\sim\ N\!\left(\mu,\frac{\sigma^2}{n}\right).
\]

For an independent normal sample with unknown \(\sigma\),

\[
T=\frac{\bar X-\mu}{S/\sqrt n}\sim t_{n-1}.
\]

For a sample proportion,

\[
E[\widehat P]=p,
\qquad
\operatorname{SE}(\widehat P)=\sqrt{\frac{p(1-p)}{n}}.
\]

Normal approximation working condition:

\[
np\ge10,
\qquad n(1-p)\ge10.
\]

Multiplying \(n\) by \(c^2\) divides the SE by \(c\).

## Lecture 9 - Confidence intervals and zero tests {#formula-l9}

General confidence-interval form:

\[
\text{estimate}\ \pm\ \text{critical value}\times\text{SE}.
\]

For a population mean with unknown \(\sigma\),

\[
\bar X\pm t_{1-\alpha/2,n-1}\frac{S}{\sqrt n}.
\]

For 95% procedures, \(z_{0.975}=1.960\). Selected critical values are

\[
\begin{array}{c|rrrrrr}
df&5&10&20&30&60&\infty\\ \hline
t_{0.975,df}&2.571&2.228&2.086&2.042&2.000&1.960
\end{array}
\]

For a contrast \(\delta=\mu-\mu_0\),

\[
\widehat\delta=\bar X-\mu_0,
\qquad
T=\frac{\widehat\delta-0}{S/\sqrt n},
\qquad df=n-1.
\]

\[
H_0:\delta=0
\qquad\text{versus}\qquad
H_1:\delta\ne0.
\]

The two-sided p-value is

\[
p=P\!\left(|T_{df}|\ge|t_{obs}|\mid H_0\right).
\]

Decision at level \(\alpha\): reject \(H_0\) if \(p\le\alpha\); otherwise do
not reject. For the same two-sided t procedure, the level-\(\alpha\) test
rejects zero exactly when the \(100(1-\alpha)\%\) interval excludes zero.

## Lecture 10 - Tests, errors, and power {#formula-l10}

For \(H_0:p=p_0\) against \(H_1:p\ne p_0\), define
\(\delta_p=p-p_0\). The null test statistic is

\[
Z=\frac{\hat p-p_0}{\sqrt{p_0(1-p_0)/n}},
\qquad
p\text{-value}=2P(Z\ge|z_{obs}|).
\]

Check \(np_0\ge10\) and \(n(1-p_0)\ge10\) for the test. A large-sample
proportion interval is

\[
\hat p\pm z_{1-\alpha/2}
\sqrt{\frac{\hat p(1-\hat p)}{n}}.
\]

The equivalent interval for \(p-p_0\) subtracts \(p_0\) from both endpoints.

\[
\begin{aligned}
\text{Type I error: }&\text{reject }H_0\text{ when }H_0\text{ is true},\\
P(\text{Type I error})&=\alpha,\\
\text{Type II error: }&\text{do not reject }H_0\text{ when a specified }H_1
\text{ is true},\\
\text{Power}&=P(\text{reject }H_0\mid H_1\text{ is true}).
\end{aligned}
\]

For a regression coefficient row,

\[
t=\frac{b_j-0}{\operatorname{SE}(b_j)},
\qquad
b_j\pm t_{1-\alpha/2,df}\operatorname{SE}(b_j),
\]

tests \(H_0:\beta_j=0\) against \(H_1:\beta_j\ne0\). In R output:
`Estimate` is \(b_j\), `Std. Error` is \(\operatorname{SE}(b_j)\), `t value`
is their ratio, and `Pr(>|t|)` is the two-sided p-value.

Always report the estimate and units, uncertainty, decision, population/model
scope, practical importance, and causal limit.

:::

