# Tutorial 2: Conditioning and relationships {#b-ep02}



<div class="outcomes">
<span class="label">By the end of Tutorial 2, you can</span>
<ul>
<li>calculate variance as an expected squared deviation;</li>
<li>calculate and interpret conditional and joint probabilities;</li>
<li>apply independence, total probability, and Bayes' rule;</li>
<li>recover marginal distributions from a joint PMF;</li>
<li>interpret covariance and correlation without making causal claims.</li>
</ul>
</div>

::: {.course-phase .phase-before}

## Before class

Bring your after-class work from Lectures 4 and 5. Complete these statements
without reopening the chapters:

Review [Mathematics Refresher: fractions, products, and sums](#math-refresher)
if needed.

1. In \(P(A\mid B)\), the reference class is ...
2. Variance averages ...
3. Events \(A\) and \(B\) are independent when ...
4. A joint PMF records ...
5. Covariance averages ...

<details>
<summary>Check your preparation</summary>

1. The reference class is \(B\), the event after the vertical bar.
2. Variance averages squared deviations from a variable's mean.
3. \(P(A\cap B)=P(A)P(B)\).
4. A joint PMF records the probability of every possible value pair.
5. Covariance averages products of deviations from the two means.

</details>

:::

::: {.course-phase .phase-in-class}

## In class

Attempt each task before opening its answer. Use the formula and reference
class, verify the value, interpret it in context, and qualify the claim.

### Task 1 — Conditional probability and Bayes


```
##               Deal
## Period         No on-air deal On-air deal
##   Seasons 1-8             330         377
##   Seasons 9-16            229         505
```

1. Calculate and interpret \(P(D\mid L)\).
2. Calculate and interpret \(P(L\mid D)\).
3. Verify \(P(D\cap L)=P(D\mid L)P(L)\).
4. Use total probability across \(\{L^c,L\}\) to recover \(P(D)\).
5. Show how Bayes' rule recovers \(P(L\mid D)\).

<details>
<summary>Check your answer</summary>

\(P(D\mid L)=505/734=0.688\): among late-season records, 68.8% reached an
on-air deal. \(P(L\mid D)=505/882=0.573\): among deal records, 57.3% came from
late seasons. The joint probability is
\((505/734)(734/1441)=505/1441\).

\[
P(D)=\frac{377}{707}\frac{707}{1441}
     +\frac{505}{734}\frac{734}{1441}
     =\frac{882}{1441}.
\]

Bayes gives
\[
P(L\mid D)=\frac{P(D\mid L)P(L)}{P(D)}
=\frac{(505/734)(734/1441)}{882/1441}
=\frac{505}{882}.
\]

</details>

### Task 2 — Independence

R reports:


```
##           P_D   P_D_given_L     P_D_and_L P_D_times_P_L 
##     0.6120749     0.6880109     0.3504511     0.3117717
```

1. Use the conditional definition to assess empirical independence.
2. Use the product definition to reach the same conclusion.
3. Explain why “not independent” does not mean “late season causes a deal.”
4. Explain why the early and late events are disjoint but not independent.

<details>
<summary>Check your answer</summary>

The deal probability is about 0.612 overall and 0.688 within late seasons, so
conditioning changes it. Likewise, the observed joint probability is about
0.350 rather than the independent product of about 0.312. Thus the empirical
events are not independent. This is association in selected observational
records; a time-linked cause is not isolated. Early and late are disjoint
because they cannot occur together. Observing one makes the other impossible,
so positive-probability disjoint events are dependent.

</details>

### Task 3 — Joint PMF, covariance, and correlation

Let \(X\) be the 0/1 deal indicator and \(Y\) the 0/1 late-period indicator.


```
##    Y
## X           0         1
##   0 0.2290076 0.1589174
##   1 0.2616239 0.3504511
```

```
##         E_X         E_Y       Var_X       Var_Y        E_XY  covariance 
##  0.61207495  0.50936849  0.23743921  0.24991223  0.35045108  0.03867938 
## correlation 
##  0.15878503
```

1. Verify that the joint PMF sums to 1.
2. Recover the marginal PMF of \(X\) by summing rows.
3. Verify \(\operatorname{Var}(X)=E[X^2]-E[X]^2\).
4. Verify
   \(\operatorname{Cov}(X,Y)=E[XY]-E[X]E[Y]\).
5. Interpret the sign of covariance.
6. Explain what correlation changes and what it does not prove.

<details>
<summary>Check your answer</summary>

The four joint masses sum to 1. Summing across the two \(Y\) columns gives
\(P(X=0)=559/1441\) and \(P(X=1)=882/1441\). Because \(X\) is binary,
\(E[X^2]=E[X]\), so \(\operatorname{Var}(X)=E[X]-E[X]^2\). Here
\(E[XY]=P(X=1,Y=1)=505/1441\); subtracting
\((882/1441)(734/1441)\) gives a positive covariance. Positive covariance means
the two 1-coded values co-occur slightly more than under the product of their
marginal means. Correlation divides covariance by both SDs, making the result
unitless. A zero correlation would not establish independence; correlation
does not establish causality or practical importance.

</details>

:::

::: {.course-phase .phase-after}

## After class

### Timed individual practice — 10 minutes


```
##   early_deal_rate    late_deal_rate cor_season_equity   cor_equity_deal 
##         0.5332390         0.6880109        -0.4157650        -0.1128703
```

Write no more than 120 words interpreting all four values. Include denominators,
direction and rough strength, measurement, and the causal boundary.

<details>
<summary>Check a model answer</summary>

Among Seasons 1--8, 53.3% of records reached an on-air deal; among Seasons
9--16, 68.8% did so. The 15.5-percentage-point difference is descriptive and
does not identify a causal effect of season. Season and initially offered
equity have a moderate negative linear association (\(r\approx-0.42\)); offered
equity and the deal indicator have a weak negative linear association
(\(r\approx-0.11\)). Offered equity was not randomly assigned, and the outcome
is an on-air agreement rather than completed investment.

</details>

### Check your understanding

Complete from memory:

1. The conditioning event supplies ...
2. Independence means ...
3. Covariance averages ...
4. Correlation standardises ...

<details>
<summary>Check your answers</summary>

1. The conditioning event supplies the denominator or reference class.
2. Events \(A\) and \(B\) are independent when
   \(P(A\cap B)=P(A)P(B)\).
3. Covariance averages products of deviations from the two means.
4. Correlation standardises covariance by dividing by both standard
   deviations.

</details>

The next theory chapter, Lecture 6, extends the CDF framework to continuous random
variables and introduces PDFs, uniform distributions, and normal distributions.

:::
