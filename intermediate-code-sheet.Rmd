# QM Intermediate Code Sheet {#intermediate-code-sheet}

This cumulative sheet collects the R commands and formulas used in QM
Intermediate. Adapt the placeholder names—such as `y`, `x`, `group`, and
`df`—to the variables and dataset defined in the exam question.

| Session | Sections to use |
|---|---|
| Tutorial 1 | Workflow and Lectures 1--3 |
| Tutorial 2 | Complete sheet, Lectures 1--6 |
| Final TestVision exam | Complete sheet, Lectures 1--6 |

The sheet supports syntax and calculation. You must still define the sample,
check assumptions, interpret units and reference categories, and distinguish
association from causation.

::: {.formula-sheet}

## Workflow and data checks

```r
df <- read.csv("data.csv")

dim(df)
names(df)
head(df)
str(df)
summary(df)
colSums(is.na(df))
table(df$group, useNA = "ifany")
```

Create variables explicitly and retain a common analysis sample when comparing
models:

```r
df$x_10k <- df$x_euros / 10000
df$group <- factor(df$group)
df$group <- relevel(df$group, ref = "reference")

needed <- c("y", "x1", "x2", "group")
analysis <- df[complete.cases(df[needed]), ]
```

For every exam analysis:

1. identify the observational unit, outcome, predictors, units, and sample;
2. inspect values and missingness;
3. make a graph appropriate to the variables;
4. fit and diagnose the model;
5. report estimates, uncertainty, fit, and the relevant test;
6. interpret in context and state sampling and causal limits.

## Lecture 1: Simple linear regression

The population model and fitted line are

\[
Y_i=\beta_0+\beta_1X_i+\varepsilon_i,
\qquad
\widehat Y_i=b_0+b_1X_i.
\]

For simple OLS,

\[
b_1=
\frac{\sum_i(X_i-\bar X)(Y_i-\bar Y)}
{\sum_i(X_i-\bar X)^2}
=\frac{s_{XY}}{s_X^2},
\qquad
b_0=\bar Y-b_1\bar X.
\]

The residual and least-squares criterion are

\[
e_i=Y_i-\widehat Y_i,
\qquad
\operatorname{SSE}=\sum_{i=1}^{n}e_i^2.
\]

Fit and inspect a simple regression:

```r
m <- lm(y ~ x, data = df)
coef(m)
summary(m)

fitted(m)
residuals(m)
```

Plot the observations and fitted line:

```r
plot(y ~ x, data = df,
     xlab = "Predictor (unit)", ylab = "Outcome (unit)")
abline(m, col = "blue", lwd = 2)
```

Calculate a fitted value or ask R for fitted conditional means:

```r
b <- coef(m)
b[1] + b[2] * x0

new_cases <- data.frame(x = c(x0, x1))
predict(m, newdata = new_cases)
predict(m, newdata = new_cases, interval = "confidence")
```

Interpret \(b_1\) as the fitted change in the outcome for a one-unit increase
in the predictor. State both units and use associational language unless the
design supports a causal claim.

## Lecture 2: Coefficient inference and diagnostics

For a two-sided test against zero,

\[
H_0:\beta_j=0,
\qquad
H_1:\beta_j\ne0,
\qquad
t=\frac{b_j}{\operatorname{SE}(b_j)}.
\]

With \(k\) slopes and an intercept,

\[
df_{\text{residual}}=n-k-1,
\qquad
b_j\pm t_{1-\alpha/2,df}\operatorname{SE}(b_j)
\]

is the classical \(100(1-\alpha)\%\) confidence interval.

```r
summary(m)                 # estimates, SEs, t tests, p-values, fit
confint(m, level = 0.95)   # coefficient confidence intervals
df.residual(m)
nobs(m)
```

To verify R's two-sided test against zero:

```r
tab <- summary(m)$coefficients
t_value <- tab["x", "Estimate"] / tab["x", "Std. Error"]
p_value <- 2 * pt(-abs(t_value), df = df.residual(m))
```

Make the two central diagnostic plots:

```r
plot(fitted(m), residuals(m),
     xlab = "Fitted value", ylab = "Residual")
abline(h = 0, lty = 2)

qqnorm(rstandard(m))
qqline(rstandard(m))
```

- Curvature challenges a linear conditional mean.
- A fan shape challenges constant conditional variance.
- Large standardised residuals or Cook's distances flag observations requiring
  investigation.
- Independence, zero conditional mean, measurement quality, and causality
  require design and subject-matter information; plots cannot establish them.

```r
rstandard(m)
cooks.distance(m)
plot(m, which = 1)  # residuals versus fitted
plot(m, which = 2)  # normal Q--Q
plot(m, which = 4)  # Cook's distance
```

If robust standard errors are requested and the packages are available:

```r
lmtest::coeftest(
  m,
  vcov. = sandwich::vcovHC(m, type = "HC1")
)
```

Robust standard errors address heteroskedasticity in uncertainty estimation;
they do not repair a wrong functional form, remove confounding, or make a
coefficient causal.

## Lecture 3: Variation, \(R^2\), and the overall F-test

\[
\text{SST}=\sum_i(y_i-\bar y)^2,\qquad
\text{SSE}=\sum_i(y_i-\hat y_i)^2,\qquad
\text{SSR}=\sum_i(\hat y_i-\bar y)^2,
\]

\[
\text{SST}=\text{SSR}+\text{SSE},
\qquad
R^2=1-\frac{\text{SSE}}{\text{SST}}
=\frac{\text{SSR}}{\text{SST}}.
\]

Calculate the components:

```r
y <- model.response(model.frame(m))
yhat <- fitted(m)

SST <- sum((y - mean(y))^2)
SSE <- sum(residuals(m)^2)
SSR <- SST - SSE
R2 <- 1 - SSE / SST
```

Extract fit statistics:

```r
summary(m)$r.squared
summary(m)$adj.r.squared
summary(m)$fstatistic
sigma(m)                    # residual standard error
```

The residual standard error and adjusted \(R^2\) are

\[
s=\sqrt{\frac{\text{SSE}}{n-k-1}},
\qquad
R^2_{\text{adjusted}}
=1-(1-R^2)\frac{n-1}{n-k-1}.
\]

For \(k\) slopes,

\[
F=\frac{\text{SSR}/k}{\text{SSE}/(n-k-1)}
\]

tests

\[
H_0:\beta_1=\cdots=\beta_k=0
\]

against the alternative that at least one slope is non-zero. In simple
regression, the overall \(F\) statistic equals the squared slope t statistic.
\(R^2\) describes in-sample variation explained; it is not causal evidence or
out-of-sample validation.

## Lecture 4: Multiple linear regression

\[
Y_i=\beta_0+\beta_1X_{i1}+\cdots+\beta_kX_{ik}+\varepsilon_i.
\]

```r
m_multi <- lm(y ~ x1 + x2 + x3, data = analysis)
summary(m_multi)
confint(m_multi)
```

Interpret \(b_j\) as the fitted outcome change for a one-unit increase in
\(X_j\), holding the other included predictors fixed. Include:

- estimate and direction;
- predictor step and unit;
- outcome unit;
- held-fixed predictors;
- analysed sample and causal boundary.

For changes \(\Delta x_1,\ldots,\Delta x_k\), the additive fitted difference is

\[
\Delta\widehat Y=b_1\Delta x_1+\cdots+b_k\Delta x_k.
\]

Use `predict()` to combine terms without manual arithmetic:

```r
cases <- data.frame(
  x1 = c(x1_A, x1_B),
  x2 = c(x2_A, x2_B),
  x3 = c(x3_A, x3_B)
)
fits <- predict(m_multi, newdata = cases)
fits[2] - fits[1]
```

## Lecture 5: Factors, reference categories, and partial F-tests

Set a reference category before fitting:

```r
analysis$group <- relevel(factor(analysis$group), ref = "reference")

m_group <- lm(y ~ x1 + x2 + group, data = analysis)
summary(m_group)
coef(m_group)
confint(m_group)
```

Each printed group coefficient compares that category with the reference
category, holding the other included predictors fixed. Releveling changes the
reported contrasts, not the fitted values:

```r
analysis$group_alt <- relevel(analysis$group, ref = "other")
m_alt <- lm(y ~ x1 + x2 + group_alt, data = analysis)
all.equal(fitted(m_group), fitted(m_alt))
```

Compare nested models fitted to the same observations:

```r
reduced <- lm(y ~ x1 + x2, data = analysis)
complete <- lm(y ~ x1 + x2 + group, data = analysis)
anova(reduced, complete)
```

The partial F-test asks whether all terms removed from the complete model equal
zero jointly. The reduced model must be obtainable by deleting terms from the
complete model, and both models must use the same outcome and rows.

If the complete model has \(k_C\) slopes and removes \(q\) terms to form the
reduced model,

\[
F=
\frac{(\text{SSE}_{R}-\text{SSE}_{C})/q}
{\text{SSE}_{C}/(n-k_C-1)}.
\]

## Lecture 6: Interactions and polynomial terms

For an interaction between quantitative \(X\) and indicator \(D\),

\[
\widehat Y=b_0+b_1X+b_2D+b_3XD.
\]

- \(D=0\): intercept \(b_0\), slope \(b_1\);
- \(D=1\): intercept \(b_0+b_2\), slope \(b_1+b_3\);
- \(b_3\): difference in slopes.

Use `*` to include both lower-order terms and the interaction:

```r
m_interaction <- lm(y ~ x * group + z, data = analysis)
# x * group expands to x + group + x:group
summary(m_interaction)
```

Centering changes the interpretation of lower-order terms without changing
fitted values:

```r
analysis$x_c <- analysis$x - mean(analysis$x)
m_centered <- lm(y ~ x_c * group + z, data = analysis)
```

For a quadratic model,

\[
\widehat Y=b_0+b_1X+b_2X^2,
\]

and the fitted change from \(x_A\) to \(x_B\) is

\[
\Delta\widehat Y
=b_1(x_B-x_A)+b_2(x_B^2-x_A^2).
\]

```r
m_linear <- lm(y ~ x + z, data = analysis)
m_quadratic <- lm(y ~ x + I(x^2) + z, data = analysis)

summary(m_quadratic)
anova(m_linear, m_quadratic)
```

`I(x^2)` tells R to include the arithmetic square. Retain the lower-order
term \(x\), interpret changes using all relevant coefficients, and do not
extrapolate a polynomial beyond the observed range.

Create fitted conditional values for a graph:

```r
grid <- expand.grid(
  x = seq(min(analysis$x), max(analysis$x), length.out = 100),
  group = levels(analysis$group),
  z = mean(analysis$z)
)

pred <- predict(m_interaction, newdata = grid, interval = "confidence")
plot_data <- cbind(grid, pred)
```

## Commands by purpose

| Purpose | R command |
|---|---|
| Fit a model | `lm(y ~ predictors, data = df)` |
| Full model output | `summary(m)` |
| Coefficients only | `coef(m)` |
| 95% coefficient intervals | `confint(m)` |
| Fitted values and residuals | `fitted(m)`, `residuals(m)` |
| Standardised residuals | `rstandard(m)` |
| Influence | `cooks.distance(m)` |
| Conditional fitted values | `predict(m, newdata = ..., interval = "confidence")` |
| \(R^2\), adjusted \(R^2\), overall F | `summary(m)` |
| Residual degrees of freedom | `df.residual(m)` |
| Nested-model partial F-test | `anova(reduced, complete)` |
| Set a factor reference | `relevel(factor(x), ref = "category")` |
| Interaction | `x * z` |
| Arithmetic square in a formula | `I(x^2)` |

:::

For a more formal explanation of regression, inference, extensions, and model
violations, consult
[Nieuwenhuis, *Statistical Methods for Business and Economics*](https://tilburguniversity.on.worldcat.org/oclc/317545871),
Chapters 19--22.

Continue to the [QM Intermediate Mock Exam](#intermediate-mock-exam).
