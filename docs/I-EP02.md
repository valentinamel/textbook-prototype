# Tutorial 2: Multiple regression and extensions {#i-ep02}



<div class="outcomes">
<span class="label">By the end of Tutorial 2, you can</span>
<ul>
<li>fit and interpret multiple regression in R;</li>
<li>test individual and grouped coefficients against zero;</li>
<li>interpret dummy, interaction, and polynomial terms correctly;</li>
<li>compare nested models;</li>
<li>write a complete TestVision-ready analysis with design limits.</li>
</ul>
</div>

::: {.course-phase .phase-before}

## Before class

Complete the after-class practice from Intermediate Lectures 4--6. Review
[Mathematics Refresher: multivariable equations, indicators, products, and powers](#math-refresher)
if needed.

Complete from memory:

1. A multiple-regression slope is interpreted while ...
2. A dummy coefficient compares ...
3. An interaction coefficient is a difference in ...
4. A partial F-test compares ...

<details>
<summary>Check your preparation</summary>

1. Holding the other included predictors fixed.
2. A category with the reference category.
3. Slopes.
4. A reduced nested model with a complete model on the same observations.

</details>

:::

::: {.course-phase .phase-in-class}

## In class

Attempt each task in R before opening the answer.

### Task 1 — Multiple-regression coefficients

Fit:


``` r
m1 <- lm(
  equity_offered_pct ~ season + ask_100k + description_words,
  data = sharks
)
summary(m1)
```

```
## 
## Call:
## lm(formula = equity_offered_pct ~ season + ask_100k + description_words, 
##     data = sharks)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -15.295  -4.776  -1.283   3.288  82.106 
## 
## Coefficients:
##                   Estimate Std. Error t value Pr(>|t|)    
## (Intercept)       22.02493    0.88785  24.807  < 2e-16 ***
## season            -0.83615    0.05098 -16.401  < 2e-16 ***
## ask_100k          -0.28975    0.05771  -5.021 5.79e-07 ***
## description_words -0.12834    0.11375  -1.128    0.259    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 7.619 on 1437 degrees of freedom
## Multiple R-squared:  0.1876,	Adjusted R-squared:  0.1859 
## F-statistic: 110.6 on 3 and 1437 DF,  p-value: < 2.2e-16
```

1. Interpret all three slopes.
2. Identify which 95% coefficient interval includes zero.
3. Interpret adjusted \(R^2\) and the overall F-test.
4. State two threats to causal interpretation.

<details>
<summary>Check your answer</summary>

At fixed values of the other included predictors, one later season is
associated with about 0.836 percentage points less initial equity; an extra
$100,000 requested with about 0.290 percentage points less equity; and one
additional description word with about 0.128 percentage points less equity.
The description-word interval includes zero. Adjusted \(R^2\approx0.186\), and
the overall F-test rejects the joint zero-slope null. Selection into the show,
unmeasured venture quality, reverse relationships, and measurement choices are
possible causal threats.

</details>

### Task 2 — Dummy variables and a partial F-test


``` r
reduced <- lm(equity_offered_pct ~ season + ask_100k,
              data = known_gender)
complete <- lm(equity_offered_pct ~ season + ask_100k + gender,
               data = known_gender)
summary(complete)
```

```
## 
## Call:
## lm(formula = equity_offered_pct ~ season + ask_100k + gender, 
##     data = known_gender)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -16.118  -4.778  -1.100   3.220  82.590 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     20.83883    0.50649  41.143  < 2e-16 ***
## season          -0.82389    0.04780 -17.238  < 2e-16 ***
## ask_100k        -0.26613    0.05822  -4.571 5.28e-06 ***
## genderall_women  1.28352    0.48102   2.668  0.00771 ** 
## gendermixed      0.12093    0.54115   0.223  0.82320    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 7.612 on 1429 degrees of freedom
## Multiple R-squared:  0.1913,	Adjusted R-squared:  0.189 
## F-statistic: 84.49 on 4 and 1429 DF,  p-value: < 2.2e-16
```

``` r
anova(reduced, complete)
```

```
## Analysis of Variance Table
## 
## Model 1: equity_offered_pct ~ season + ask_100k
## Model 2: equity_offered_pct ~ season + ask_100k + gender
##   Res.Df   RSS Df Sum of Sq      F Pr(>F)  
## 1   1431 83228                             
## 2   1429 82792  2    436.25 3.7649 0.0234 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

1. Name the reference category.
2. Interpret both dummy coefficients.
3. State and decide the partial F-test.
4. Explain why the partial test and individual t-tests answer different
   questions.

<details>
<summary>Check your answer</summary>

The reference is all-men. At fixed season and request, all-women teams are
fitted about 1.28 percentage points higher and mixed teams about 0.12 points
higher than all-men teams. The partial null is that both dummy coefficients
equal zero; \(p\approx0.023\), so reject at 5%. The F-test asks whether the two
terms are jointly useful; each t-test asks about one reference-group contrast.
The source coding and observational design prohibit a causal gender claim.

</details>

### Task 3 — Interaction


``` r
m_interaction <- lm(
  equity_offered_pct ~ season_c * women + ask_100k,
  data = known_gender
)
summary(m_interaction)
```

```
## 
## Call:
## lm(formula = equity_offered_pct ~ season_c * women + ask_100k, 
##     data = known_gender)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -15.871  -4.742  -1.290   3.412  82.689 
## 
## Coefficients:
##                Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    13.62479    0.33545  40.616  < 2e-16 ***
## season_c       -0.79938    0.06632 -12.053  < 2e-16 ***
## women           0.80697    0.41171   1.960   0.0502 .  
## ask_100k       -0.26776    0.05834  -4.590 4.83e-06 ***
## season_c:women -0.06146    0.09557  -0.643   0.5203    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 7.62 on 1429 degrees of freedom
## Multiple R-squared:  0.1894,	Adjusted R-squared:  0.1871 
## F-statistic: 83.47 on 4 and 1429 DF,  p-value: < 2.2e-16
```

1. Write the fitted line for `women = 0` and `women = 1` at a fixed request.
2. Calculate both season slopes.
3. Interpret the interaction estimate and p-value.
4. Explain the role of centering.

<details>
<summary>Check your answer</summary>

For all-men teams, the season slope is about \(-0.799\). For teams with women
represented, it is \(-0.799-0.061=-0.861\). The estimated slope difference is
\(-0.061\) percentage points per season, with \(p\approx0.520\); this model does
not provide evidence of different season trends. Centering makes the lower-order
group coefficient compare groups at the average season instead of Season 0.

</details>

### Task 4 — Polynomial term


``` r
m_linear <- lm(equity_offered_pct ~ season + ask_100k, data = sharks)
m_quadratic <- lm(
  equity_offered_pct ~ season + I(season^2) + ask_100k,
  data = sharks
)
summary(m_quadratic)
```

```
## 
## Call:
## lm(formula = equity_offered_pct ~ season + I(season^2) + ask_100k, 
##     data = sharks)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -16.154  -4.549  -1.011   3.390  82.000 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 24.17168    0.82057  29.457  < 2e-16 ***
## season      -1.71323    0.20567  -8.330  < 2e-16 ***
## I(season^2)  0.05103    0.01137   4.489 7.74e-06 ***
## ask_100k    -0.27108    0.05740  -4.723 2.56e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 7.57 on 1437 degrees of freedom
## Multiple R-squared:  0.1981,	Adjusted R-squared:  0.1965 
## F-statistic: 118.3 on 3 and 1437 DF,  p-value: < 2.2e-16
```

``` r
anova(m_linear, m_quadratic)
```

```
## Analysis of Variance Table
## 
## Model 1: equity_offered_pct ~ season + ask_100k
## Model 2: equity_offered_pct ~ season + I(season^2) + ask_100k
##   Res.Df   RSS Df Sum of Sq      F    Pr(>F)    
## 1   1438 83493                                  
## 2   1437 82338  1    1154.5 20.149 7.737e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

1. Why must `I(season^2)` be used in the R formula?
2. Decide whether the quadratic term adds fit under the classical test.
3. Calculate the fitted change from Season 10 to 11.
4. State why the curve should not be extrapolated beyond Season 16.

<details>
<summary>Check your answer</summary>

`I()` tells R to treat the expression arithmetically rather than as formula
syntax. The partial F-test has \(p<0.001\), so the quadratic term adds detectable
fit. With \(b_1\approx-1.713\) and \(b_2\approx0.0510\), the change from 10 to
11 is \(b_1+b_2(21)\approx-0.642\) percentage points. Quadratics can turn
sharply outside the observed range and have no data support there.

</details>

:::

::: {.course-phase .phase-after}

## After class

### Timed integrated task — 30 minutes

Develop one model of `equity_offered_pct` using season, requested amount, the
three known source gender groups, and one justified extension.

Your submission must include:

1. a precise research question;
2. reproducible data preparation;
3. one pre-model visual;
4. the R formula and model summary;
5. coefficient interpretations with units and reference groups;
6. an individual t-test and an overall or partial F-test;
7. \(R^2\), adjusted \(R^2\), and residual diagnostics;
8. one graph of fitted conditional predictions;
9. a 150-word conclusion separating association, uncertainty, and causal
   limits.

<details>
<summary>Check a model structure</summary>

A defensible solution could fit

```r
m <- lm(
  equity_offered_pct ~ season * gender + ask_100k,
  data = known_gender
)
```

or a quadratic-season model with group dummies. Keep lower-order terms, name
the reference group, interpret combined slopes or fitted contrasts, compare a
nested reduced model with `anova(reduced, complete)`, inspect residuals, and
plot predictions within Seasons 1--16. The conclusion must state that the
source's broad presenter classification and selected televised records do not
identify a causal effect of gender or season.

</details>

The Intermediate course is complete. Return to the
[R Refresher](#r-refresher), [Mathematics Refresher](#math-refresher), or
[External Video Guide](#videos) whenever you need a targeted review.

:::
