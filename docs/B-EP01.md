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

Use the cumulative [formula sheet through Lecture 3](#formula-l3).

Review [Mathematics Refresher: sets, fractions, and sums](#math-refresher) if
the notation is slowing you down.

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
##             1441.0000000               19.0000000              882.0000000 
##          deal_proportion median_description_words 
##                0.6120749                5.0000000
```

1. What is the observational unit?
2. Verify the deal proportion from 882 deals and 559 non-deals.
3. Explain why the mean of `deal_on_show` is a proportion.
4. Evaluate: “The data contain 1,441 successful companies.”
5. What exactly does `description_words` measure?

<details>
<summary>Check your answer</summary>

One row is one recorded televised pitch. There are \(882+559=1441\) records and
\(882/1441\approx0.612\), so 61.2% reached an on-air agreement. The mean of a 0/1
indicator equals the share coded 1 because its sum counts the 1s. “Successful
companies” is incorrect: the outcome is an agreement made on the show, not
completed funding or later venture performance. Word count describes the
written text in the source dataset, not the spoken pitch.

</details>

### Task 2 — Events and probability rules

The experiment selects one of the 1,441 records uniformly. Let:

- \(D\): the selected record has an on-air deal;
- \(L\): the selected record is from Seasons 9--16.

R reports:


```
##       P_D       P_L P_D_and_L 
## 0.6120749 0.5093685 0.3504511
```

1. Define \(\Omega\), and distinguish an outcome from event \(D\).
2. Translate \(D^c\), \(D\cap L\), and \(D\cup L\) into words.
3. Calculate \(P(D^c)\).
4. Calculate \(P(D\cup L)\) using the addition rule.
5. Explain why these probabilities do not automatically apply to a future US
   entrepreneur.

<details>
<summary>Check your answer</summary>

The sample space is the set of 1,441 complete pitch records; one selected record
is an outcome, while \(D\) is the subset of 882 deal records. The complement is
no on-air deal, the intersection is a late-season deal, and the union is
late-season, deal, or both. \(P(D^c)=1-882/1441=559/1441\approx0.388\).
The union is \(P(D)+P(L)-P(D\cap L)\approx0.771\). Future use requires a
defined target population and comparable selection, time period, and outcome.

</details>

### Task 3 — PMF, CDF, and expectation

Let \(X=1\) for an on-air deal and \(X=0\) otherwise. Use
\(p=882/1441\).

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

The expectation is \(E[X]=0(1-p)+1p=p\approx0.612\). Because the indicator
contains 882 ones among 1,441 observations, its mean is also \(882/1441\).
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
##  4.995142  5.000000  1.000000  4.000000  6.000000 13.000000
```

Write no more than 100 words. Compare mean and median, calculate the IQR,
calculate the range, and state the measurement boundary. Then explain
which value equals the expectation if the empirical distribution gives mass
\(1/1441\) to each record.

<details>
<summary>Check a model answer</summary>

The written descriptions have a mean length of about 5.0 words and a median
of 5 words. Their IQR is \(6-4=2\) words, and their range is
\(13-1=12\) words. The thin upper tail is consistent with the mildly
right-skewed histogram seen in Lecture 2. If each record receives probability
\(1/1441\), the empirical expectation is the mean, about 5.0 words. These values
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
