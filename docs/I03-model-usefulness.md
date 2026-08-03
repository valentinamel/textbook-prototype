# Lecture 3: Model fit and overall usefulness {#i03}



<div class="outcomes">
<span class="label">By the end of Lecture 3, you can</span>
<ul>
<li>decompose outcome variation into explained and residual components;</li>
<li>calculate and interpret \(R^2\);</li>
<li>state and interpret the overall F-test for model usefulness;</li>
<li>connect the simple-regression F-test to the slope t-test;</li>
<li>distinguish fit, statistical evidence, prediction, and causality.</li>
</ul>
</div>

::: {.course-phase .phase-before}

## Before class

<div class="video-prep">
<span class="label">Video preparation</span><br>
Watch Stanford Statistical Learning
<a href="https://www.youtube.com/watch?v=50sv4UTjE90&list=PLoROMvodv4rOzrYsAxzQyHb8n_RWNuS1e&index=12">3.4
Some Important Questions</a>. Focus on the questions “Is there a relationship?”
and “How accurately can we predict the response?”
</div>

If squared terms or ratios are not secure, review
[Mathematics Refresher: squares and proportions](#math-refresher).

Decide whether each quantity should be small or large for a useful model:
SSE, SSR, and \(R^2\).

<details>
<summary>Check your preparation</summary>

For a useful model, SSE should be relatively small, SSR relatively large, and
\(R^2\) relatively large. These are comparisons to total outcome variation,
not universal cut-offs.

</details>

:::

::: {.course-phase .phase-in-class}

## In class

<p class="concept-video"><strong>Stanford explanation (review):</strong>
<a href="https://www.youtube.com/watch?v=50sv4UTjE90">3.4 Some Important Questions</a>.</p>

### Three sums of squares

The intercept-only prediction for every observation is \(\bar y\). Regression
compares that baseline with fitted values \(\hat y_i\).

\[
\underbrace{\sum_i(y_i-\bar y)^2}_{\text{SST: total}}
=
\underbrace{\sum_i(\hat y_i-\bar y)^2}_{\text{SSR: explained}}
+
\underbrace{\sum_i(y_i-\hat y_i)^2}_{\text{SSE: residual}}.
\]

For ordinary least squares with an intercept,
\(\text{SST}=\text{SSR}+\text{SSE}\).


``` r
y <- deals$deal_100k
yhat <- fitted(deal_model)

SST <- sum((y - mean(y))^2)
SSE <- sum((y - yhat)^2)
SSR <- sum((yhat - mean(y))^2)

c(SST = SST, SSR = SSR, SSE = SSE, check = SSR + SSE)
```

```
##       SST       SSR       SSE     check 
## 10350.932  8044.112  2306.820 10350.932
```

### The coefficient of determination

\[
R^2=\frac{\text{SSR}}{\text{SST}}
=1-\frac{\text{SSE}}{\text{SST}}.
\]

It is the proportion of observed sample variation in \(Y\) explained by the
fitted values from the model.


``` r
c(
  manual = 1 - SSE / SST,
  from_R = summary(deal_model)$r.squared,
  correlation_squared = cor(deals$ask_100k, deals$deal_100k)^2
)
```

```
##              manual              from_R correlation_squared 
##           0.7771389           0.7771389           0.7771389
```

Here \(R^2\approx0.777\): about 77.7% of the variation in agreed on-air deal
amount among deal records is explained by its linear association with amount
requested.

In simple linear regression with an intercept, \(R^2=r_{XY}^2\). The sign of
the relationship is lost by squaring; inspect the slope or correlation for
direction.

\(R^2\) is not:

- the percentage of predictions that are correct;
- proof that assumptions hold;
- proof that the predictor causes the outcome;
- evidence that the model will perform equally well on new data.

### The overall F-test

For a regression with \(k\) predictors, the overall usefulness test is

\[
H_0:\beta_1=\cdots=\beta_k=0
\]

against the alternative that at least one slope is non-zero. The statistic is

\[
F=\frac{\text{SSR}/k}{\text{SSE}/(n-k-1)}.
\]

Large \(F\) means the explained variation per predictor is large relative to
the residual variation per residual degree of freedom.


``` r
summary(deal_model)
```

```
## 
## Call:
## lm(formula = deal_100k ~ ask_100k, data = deals)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.3438 -0.3012 -0.2885 -0.2821 28.2115 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  0.27571    0.07241   3.808  0.00015 ***
## ask_100k     1.00851    0.01821  55.395  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.619 on 880 degrees of freedom
## Multiple R-squared:  0.7771,	Adjusted R-squared:  0.7769 
## F-statistic:  3069 on 1 and 880 DF,  p-value: < 2.2e-16
```

The output reports \(F\approx3069\) on 1 and 880 degrees of freedom, with a
very small p-value. Rejecting the null says the model with requested amount
fits better than an intercept-only model under the inferential conditions.

### In simple regression, F and t answer the same slope question

With one predictor and a two-sided alternative,

\[
F=t^2.
\]


``` r
t_slope <- summary(deal_model)$coefficients["ask_100k", "t value"]
f_model <- unname(summary(deal_model)$fstatistic["value"])
c(t_squared = t_slope^2, F = f_model)
```

```
## t_squared         F 
##  3068.648  3068.648
```

This equivalence disappears when a multiple-regression F-test evaluates
several slopes jointly.

### Usefulness has more than one meaning

A model can have:

- a statistically non-zero slope but low \(R^2\);
- high \(R^2\) but poor causal interpretation;
- good in-sample fit but fragile predictions outside the observed data;
- accurate predictions but coefficients that do not support a structural
  explanation.

Always align the evaluation with the goal: explanation, prediction, or
decision support.

### Read the complete R summary


``` r
summary(deal_model)
```

```
## 
## Call:
## lm(formula = deal_100k ~ ask_100k, data = deals)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.3438 -0.3012 -0.2885 -0.2821 28.2115 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  0.27571    0.07241   3.808  0.00015 ***
## ask_100k     1.00851    0.01821  55.395  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.619 on 880 degrees of freedom
## Multiple R-squared:  0.7771,	Adjusted R-squared:  0.7769 
## F-statistic:  3069 on 1 and 880 DF,  p-value: < 2.2e-16
```

Read it in this order:

1. formula and analysis sample;
2. coefficient estimates and units;
3. standard errors, t statistics, and p-values;
4. residual scale;
5. \(R^2\) and adjusted \(R^2\);
6. overall F-test;
7. assumptions and design limits outside the printed table.

:::

::: {.course-phase .phase-after}

## After class

### Retrieval

1. What do SST, SSR, and SSE measure?
2. Why is \(R^2\) between 0 and 1 in an OLS model with an intercept?
3. What is the null hypothesis of the overall F-test?
4. Why do the simple-regression slope t-test and F-test agree?
5. Why can a high \(R^2\) coexist with a weak causal claim?

<details>
<summary>Check your answers</summary>

1. Total, fitted/explained, and residual sample variation in the outcome.
2. SSE is non-negative and no larger than SST for that model, so
   \(1-\text{SSE}/\text{SST}\) lies from 0 to 1.
3. All population slope coefficients equal zero.
4. With one predictor, both test \(H_0:\beta_1=0\), and \(F=t^2\).
5. Fit measures association in the observed data; causality depends on design
   and assumptions about confounding and selection.

</details>

### Practice

1. If SST = 500 and SSE = 125, calculate SSR and \(R^2\).
2. Interpret \(R^2=0.20\) without calling the model “80% wrong.”
3. A model has \(k=3\), \(n=104\), SSR = 300, and SSE = 500. Calculate F.
4. Explain why adding a predictor cannot increase training SSE in OLS.
5. Read `summary(lm(equity_offered_pct ~ season, data = sharks))`: report the
   slope, \(R^2\), F-test conclusion, and causal boundary.

<details>
<summary>Check your answers</summary>

1. SSR = 375 and \(R^2=375/500=0.75\).
2. The fitted values explain 20% of observed outcome variation; 80% remains in
   residual variation around the fitted line.
3. \(F=(300/3)/(500/(104-3-1))=100/5=20\).
4. The expanded model can reproduce the old fit by assigning the new slope
   zero, so least squares cannot find a worse minimum SSE.
5. The slope is about \(-0.824\) percentage points per season,
   \(R^2\approx0.173\), and the overall F-test rejects a zero slope. The
   observational time trend does not establish a causal effect of season.

</details>

Continue to [Tutorial 1: Simple regression and model usefulness](#i-ep01).

For a more formal treatment, see James et al., *An Introduction to Statistical
Learning*, 2nd ed., Section 3.1.3, and
[Nieuwenhuis, *Statistical Methods for Business and Economics*](https://tilburguniversity.on.worldcat.org/oclc/317545871),
Chapters 19--20.

:::
