# Tutorial 1: Evidence and probability foundations {#b-ep01}



<div class="outcomes">
<span class="label">By the end of Tutorial 1, you can</span>
<ul>
<li>distinguish data, events, random variables, and distributions;</li>
<li>apply probability rules to the Shark Tank record-selection experiment;</li>
<li>calculate and interpret a Bernoulli PMF, CDF, and expectation;</li>
<li>write a concise interpretation of supplied R output.</li>
</ul>
</div>

::: {.course-phase .phase-before}

## Before class

Bring your after-class work from Lectures 1--3. Without reopening the chapters,
complete these definitions:

1. An observational unit is ...
2. An event is ...
3. A random variable is ...
4. A PMF is ...

<details>
<summary>Check your preparation</summary>

1. An observational unit is the entity represented by one row of the data.
2. An event is a specified subset of the sample space.
3. A random variable is a real-valued function on the sample space.
4. A PMF assigns probability \(P(X=x)\) to each value in the support of a
   discrete random variable; its masses are non-negative and sum to 1.

</details>

:::

::: {.course-phase .phase-in-class}

## In class

Attempt each task before opening its answer. A complete written answer should
name the quantity, show the calculation, report the value and units, interpret
it in context, and state an important model or measurement boundary.

### Task 1 — Data and measurement

R reports:


```
##                     rows                  columns                    deals 
##              706.0000000                5.0000000              383.0000000 
##          deal_proportion median_description_words 
##                0.5424929               23.0000000
```

1. What is the observational unit?
2. Verify the deal proportion from 383 deals and 323 non-deals.
3. Explain why the mean of `deal_on_show` is a proportion.
4. Evaluate: “The data contain 706 successful companies.”
5. What exactly does `description_words` measure?

<details>
<summary>Check your answer</summary>

One row is one recorded televised pitch. There are \(383+323=706\) records and
\(383/706=0.5425\), so 54.2% reached an on-air agreement. The mean of a 0/1
indicator equals the share coded 1 because its sum counts the 1s. “Successful
companies” is incorrect: the outcome is an agreement made on the show, not
completed funding or later venture performance. Word count describes the
written text in the source dataset, not the spoken pitch.

</details>

### Task 2 — Events and probability rules

The experiment selects one of the 706 records uniformly. Let:

- \(D\): the selected record has an on-air deal;
- \(L\): the selected record is from Seasons 5-8.

R reports:


```
##       P_D       P_L P_D_and_L 
## 0.5424929 0.6288952 0.3626062
```

1. Define \(\Omega\), and distinguish an outcome from event \(D\).
2. Translate \(D^c\), \(D\cap L\), and \(D\cup L\) into words.
3. Calculate \(P(D^c)\).
4. Calculate \(P(D\cup L)\) using the addition rule.
5. Explain why these probabilities do not automatically apply to a future US
   entrepreneur.

<details>
<summary>Check your answer</summary>

The sample space is the set of 706 complete pitch records; one selected record
is an outcome, while \(D\) is the subset of 383 deal records. The complement is
no on-air deal, the intersection is a late-season deal, and the union is
late-season, deal, or both. \(P(D^c)=1-383/706=323/706\approx0.458\).
The union is \(P(D)+P(L)-P(D\cap L)\approx0.809\). Future use requires a
defined target population and comparable selection, time period, and outcome.

</details>

### Task 3 — PMF, CDF, and expectation

Let \(X=1\) for an on-air deal and \(X=0\) otherwise. Use
\(p=383/706\).

1. Write the PMF and verify that its masses sum to 1.
2. Write the full piecewise CDF \(F_X(a)\).
3. Calculate \(E[X]\) from the PMF.
4. Explain why \(E[X]\) equals the observed proportion of 1s.
5. Explain the difference between the random variable \(X\) and a realised
   value \(x=1\).

<details>
<summary>Check your answer</summary>

\[
p_X(0)=1-p,\qquad p_X(1)=p,
\]

and the masses total \(1-p+p=1\).

\[
F_X(a)=
\begin{cases}
0,&a<0,\\
1-p,&0\le a<1,\\
1,&a\ge1.
\end{cases}
\]

The expectation is \(E[X]=0(1-p)+1p=p\approx0.542\). Because the indicator
contains 383 ones among 706 observations, its mean is also \(383/706\).
\(X\) is the mapping defined before selection; \(x=1\) is one possible
realised value.

</details>

:::

::: {.course-phase .phase-after}

## After class

### Timed individual practice — 10 minutes

An output block describes word count:


```
##      mean    median   minimum        q1        q3   maximum 
##  29.75779  23.00000   2.00000  11.00000  42.00000 159.00000
```

Write no more than 100 words. Compare mean and median, calculate the IQR,
calculate the range, and state the measurement boundary. Then explain
which value equals the expectation if the empirical distribution gives mass
\(1/706\) to each record.

<details>
<summary>Check a model answer</summary>

The written descriptions have a mean length of about 29.8 words and a median
of 23 words. Their IQR is \(42-11=31\) words, and their range is
\(159-2=157\) words. The mean above the median is consistent with the
right-skewed histogram seen in Lecture 2. If each record receives probability
\(1/706\), the empirical expectation is the mean, 29.8 words. These values
describe written dataset text, not spoken-pitch length or quality.

</details>

### Check your understanding

Complete from memory:

1. An event is ...
2. A PMF must ...
3. A CDF at \(a\) reports ...
4. Expectation is ...

<details>
<summary>Check your answers</summary>

1. An event is a specified subset of the sample space.
2. A PMF is non-negative and sums to 1 over the support.
3. \(F_X(a)=P(X\le a)\).
4. \(E[X]=\sum_x x p_X(x)\), the probability-weighted average of the possible
   values.

</details>

Continue to [Lecture 4: Variance, conditioning, and belief updating](#b04).

:::
