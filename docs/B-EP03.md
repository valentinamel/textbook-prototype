# Tutorial 3: Sampling and standard errors {#b-ep03}



<div class="outcomes">
<span class="label">By the end of Tutorial 3, you can</span>
<ul>
<li>identify a valid population and sampling frame;</li>
<li>distinguish parameters, estimators, and estimates;</li>
<li>calculate standard errors for a mean and proportion;</li>
<li>explain why a one-sample t procedure has \(n-1\) degrees of freedom;</li>
<li>use the CLT without confusing observations and statistics;</li>
<li>qualify conclusions when the sampling design is limited.</li>
</ul>
</div>

::: {.course-phase .phase-before}

## Before class

Bring your after-class work from Lectures 7 and 8. If the algebra is slowing
you down, review [Mathematics Refresher: sums, fractions, and roots](#math-refresher).

Complete from memory:

1. A parameter describes ...
2. An estimator is ...
3. The standard error of \(\bar X\) is ...
4. The CLT describes ...

<details>
<summary>Check your preparation</summary>

1. A parameter describes a population.
2. An estimator is a sample-based random rule used to estimate a parameter.
3. \(\sigma/\sqrt n\), estimated by \(S/\sqrt n\) when \(\sigma\) is unknown.
4. The limiting distribution of a properly standardised sum or mean.

</details>

:::

::: {.course-phase .phase-in-class}

## In class

Attempt each task before opening its answer.

### Task 1 — Population, frame, and claim

A student randomly selects 100 rows from the teaching file and estimates the
mean initial equity offered.

1. State the population to which this design directly supports inference.
2. Explain why it does not represent all *Shark Tank* applicants.
3. Explain why it does not represent all US entrepreneurs.
4. State one change needed to target all US entrepreneurs.

<details>
<summary>Check your answer</summary>

The direct finite population is the 1,441 recorded pitches in completed
Seasons 1--16. Applicants who were not televised are absent, so the frame does
not represent all applicants. The show also selects a specialised group of
entrepreneurs, not a probability sample of US entrepreneurs. Targeting all US
entrepreneurs would require an appropriate national sampling frame and random
selection from that frame.

</details>

### Task 2 — Reproduce the realised sample


``` r
set.seed(123)
pitch_sample <- sharks[sample(seq_len(nrow(sharks)), 100), ]

c(
  n = nrow(pitch_sample),
  mean_equity = mean(pitch_sample$equity_offered_pct),
  sd_equity = sd(pitch_sample$equity_offered_pct),
  deal_proportion = mean(pitch_sample$deal_on_show)
)
```

```
##               n     mean_equity       sd_equity deal_proportion 
##      100.000000       12.760000        7.707887        0.640000
```

1. Identify the parameter, estimator, and estimate for mean equity.
2. Identify the parameter, estimator, and estimate for the deal proportion.
3. Explain why a different seed can produce different estimates.

<details>
<summary>Check your answer</summary>

For equity, the parameter is the population mean \(\mu\), the estimator is
\(\bar X\), and the estimate is \(\bar x=12.76\). For deal outcome, the
parameter is the population proportion \(p\), the estimator is
\(\widehat P\), and the estimate is \(\hat p=0.64\). A different seed selects
a different random set of rows, so the realised statistics can change.

</details>

### Task 3 — Standard errors and sample size

Use the sample output above.

1. Estimate \(\operatorname{SE}(\bar X)\).
2. Estimate \(\operatorname{SE}(\widehat P)\).
3. Check the success-failure condition for \(\widehat P\).
4. Predict how each SE changes if \(n\) increases from 100 to 400 while the
   estimated spread remains similar.

<details>
<summary>Check your answer</summary>

\[
\widehat{\operatorname{SE}}(\bar X)=7.7079/\sqrt{100}=0.7708.
\]

\[
\widehat{\operatorname{SE}}(\widehat P)
=\sqrt{0.64(0.36)/100}=0.0480.
\]

The sample contains 64 successes and 36 failures, so both are at least 10.
Increasing \(n\) fourfold divides both SEs by \(\sqrt 4=2\).

</details>

### Task 4 — Read a sampling-distribution statement

Suppose the population mean is \(\mu=13.21\), the population SD is
\(\sigma=8.44\), and samples of \(n=100\) are drawn independently.

1. State the approximate sampling distribution of \(\bar X\).
2. Calculate \(P(\bar X>15)\).
3. Explain why this probability is not \(P(X>15)\).

<details>
<summary>Check your answer</summary>

The CLT gives approximately
\(\bar X\mathrel{\dot\sim}N(13.21,8.44^2/100)\), with SE \(0.844\). Therefore

\[
P(\bar X>15)
=1-\Phi\!\left(\frac{15-13.21}{0.844}\right)
\approx0.017.
\]

This probability concerns a mean across 100 pitches. \(P(X>15)\) concerns one
pitch and uses the much wider population distribution.

</details>

### Task 5 — Degrees of freedom and the t reference

A sample of \(n=12\) observations is used to estimate a population mean and
the unknown population standard deviation.

1. What are the degrees of freedom for the one-sample t procedure?
2. Why is the answer not 12?
3. In R, compare <code>qt(0.975, df = 11)</code> with
   <code>qt(0.975, df = 99)</code>. Which critical value is larger, and why?

<details>
<summary>Check your answer</summary>

The degrees of freedom are \(12-1=11\). Once the sample mean is estimated,
the 12 deviations from that mean must sum to zero. Only 11 deviations can
vary freely; the last is determined by the other 11. The t critical value is
larger for 11 degrees of freedom because estimating \(\sigma\) from a small
sample creates extra uncertainty. As the degrees of freedom increase, the t
distribution approaches the standard normal distribution.

</details>

:::

::: {.course-phase .phase-after}

## After class

### Timed individual practice — 12 minutes

A random sample of 64 customers has mean monthly spending €82 and sample SD
€24. Among the 64 customers, 40 renewed their subscription.

1. Estimate the SE of mean spending.
2. Estimate the SE of the renewal proportion and check its condition.
3. State what would happen to both SEs at \(n=256\).
4. Write one sentence distinguishing sampling uncertainty from selection bias.
5. If a one-sample t procedure is applied to mean spending, state its degrees
   of freedom.

<details>
<summary>Check a model answer</summary>

The estimated SE of the mean is \(24/\sqrt{64}=3\) euros. The renewal estimate
is \(40/64=0.625\), with estimated SE
\(\sqrt{0.625(0.375)/64}\approx0.0605\); the sample has 40 successes and 24
failures, so the success-failure condition holds. Increasing the sample size
from 64 to 256 would halve both SEs if the spread remained similar. These SEs
describe random sample-to-sample variation, not bias created by an
unrepresentative sampling frame. The mean procedure has \(64-1=63\) degrees
of freedom.

</details>

Continue to [Lecture 9: Confidence intervals and tests against zero](#b09).

:::
