# Tutorial 1: Simple regression and model usefulness {#i-ep01}



<div class="outcomes">
<span class="label">By the end of Tutorial 1, you can</span>
<ul>
<li>fit and interpret a simple regression in R;</li>
<li>diagnose basic assumption problems from residual plots;</li>
<li>interpret coefficient inference, \(R^2\), and the F-test together;</li>
<li>produce a concise TestVision-ready model interpretation.</li>
</ul>
</div>

::: {.course-phase .phase-before}

## Before class

Complete the after-class practice from Intermediate Lectures 1--3. Review
[Mathematics Refresher: lines, squares, and standardisation](#math-refresher)
if needed.

Write from memory:

1. the SLR model;
2. the fitted line;
3. the residual;
4. the formula for \(R^2\);
5. the null hypothesis of the model F-test.

<details>
<summary>Check your preparation</summary>

1. \(Y_i=\beta_0+\beta_1X_i+\varepsilon_i\).
2. \(\hat Y_i=b_0+b_1X_i\).
3. \(e_i=Y_i-\hat Y_i\).
4. \(R^2=1-\text{SSE}/\text{SST}\).
5. \(H_0:\beta_1=0\) in simple regression.

</details>

:::

::: {.course-phase .phase-in-class}

## In class

Attempt each task in R before opening the answer.

### Task 1 — Fit and interpret

Fit `deal_100k ~ ask_100k` among on-air deal records. Report the sample,
equation, slope interpretation, and intercept limitation.

<details>
<summary>Check your answer</summary>

```r
deals <- subset(sharks, deal_on_show == 1)
deals$ask_100k <- deals$ask_amount_usd / 100000
deals$deal_100k <- deals$deal_amount_usd / 100000
m <- lm(deal_100k ~ ask_100k, data = deals)
coef(m)
```

Among 882 on-air deals, the fitted equation is
\(\hat y=0.276+1.009x\), with money in $100,000s. One additional $100,000
requested is associated with about $100,900 more in fitted agreed amount. A
zero request is outside the observed range, so the intercept lacks a useful
standalone business interpretation.

</details>

### Task 2 — Fitted value and residual

A pitch requested $500,000 and agreed $450,000.

1. Calculate its fitted value.
2. Calculate its residual.
3. Interpret the sign of the residual.

<details>
<summary>Check your answer</summary>

With \(x=5\), \(\hat y=0.276+1.009(5)\approx5.318\), or $531,800. The
observed \(y=4.5\), so \(e=4.5-5.318=-0.818\), or about \(-\$81{,}800\). The
observed agreement is below the line's fitted amount.

</details>

### Task 3 — Inference and diagnostics

Use `summary()`, `confint()`, a residual-versus-fitted plot, and a normal Q--Q
plot.

1. Test \(H_0:\beta_1=0\).
2. Report the 95% interval for \(\beta_1\).
3. Identify two visible assumption concerns.
4. State whether robust SEs would solve both.

<details>
<summary>Check your answer</summary>

The classical t statistic is about 55.4 and the p-value is below 0.001, so
reject a zero slope. The 95% interval is approximately \((0.973, 1.044)\).
Residual spread increases at high fitted values and several observations are
unusually influential/non-normal. Robust SEs address unequal variance, but do
not remove influential observations, selection, or a misspecified mean.

</details>

### Task 4 — \(R^2\) and F

1. Calculate SST, SSE, SSR, and \(R^2\) manually.
2. Verify them against `summary()`.
3. Verify \(F=t^2\).
4. Write one sentence that does not overclaim.

<details>
<summary>Check your answer</summary>

```r
y <- deals$deal_100k
yhat <- fitted(deal_model)
SST <- sum((y - mean(y))^2)
SSE <- sum((y - yhat)^2)
SSR <- sum((yhat - mean(y))^2)
1 - SSE / SST
```

The values satisfy \(SST=SSR+SSE\), and \(R^2\approx0.777\). The model F
statistic is about 3069, equal to the squared slope t statistic. Requested
amount explains a large share of observed variation in agreed amount among
on-air deals, but the selected observational relationship is not a causal
effect of changing an ask.

</details>

:::

::: {.course-phase .phase-after}

## After class

### Timed individual practice — 20 minutes

Fit `equity_offered_pct ~ season` using all 1,441 records.

1. Make and interpret the scatterplot and fitted line.
2. Report the fitted equation and units.
3. Report the slope SE, t statistic, p-value, and 95% interval.
4. Report \(R^2\) and the overall F-test.
5. Inspect residual plots and write a 120-word model conclusion.

<details>
<summary>Check a model answer</summary>

The fitted equation is
\(\widehat{equity}=20.457-0.824\,season\). One later season is associated
with 0.824 percentage points less equity initially offered on average. The
classical SE is about 0.0475, \(t\approx-17.34\), and the p-value is below
0.001; the 95% interval excludes zero. \(R^2\approx0.173\), so season explains
about 17.3% of observed equity-offer variation. The overall F-test reaches the
same conclusion as the slope test. The points are bounded, unevenly spread,
and contain high-offer outliers. This is an observational time association,
not a causal effect of progressing to a later season.

</details>

Continue to [Lecture 4: Multiple linear regression and controls](#i04).

:::
