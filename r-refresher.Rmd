# (PART) Supplementary resources {-}

# R Refresher {#r-refresher}

These resources remain available throughout all three courses.

You first learned R in
[Programming for E&BI](https://walshc.github.io/ebi-prog/). This page is a
routing map: open the topic you need, try the reminder, and return to the
current quantitative-methods task.

## If R or RStudio is not ready

- [Getting Started](https://walshc.github.io/ebi-prog/getting-started.html):
  installation and the RStudio interface.
- [R as a Calculator](https://walshc.github.io/ebi-prog/r-as-a-calculator.html):
  arithmetic, precedence, and functions.

## If you cannot reproduce your work

- [R Scripts](https://walshc.github.io/ebi-prog/r-scripts.html): create, save,
  run, and correct a script.
- In this course, keep one project folder with `data/`, `scripts/`, and
  `outputs/`. Do not depend on a working directory that exists only on your
  laptop.

## If the data will not load

- [Loading a CSV Dataset](https://walshc.github.io/ebi-prog/reading-csv-datasets.html)
- [R Packages](https://walshc.github.io/ebi-prog/packages.html)
- [Dataframes: Indexing](https://walshc.github.io/ebi-prog/dataframes-indexing.html)

Minimal diagnostic:

```r
getwd()
file.exists("data/shark_tank_teaching.csv")
sharks <- read.csv("data/shark_tank_teaching.csv")
dim(sharks)
names(sharks)
```

## If you forgot summaries or plots

- [Dataframes: Summary Statistics](https://walshc.github.io/ebi-prog/dataframes-summary-statistics.html)
- [Introduction to Plotting](https://walshc.github.io/ebi-prog/intro-to-plotting.html)
- [Data Visualization with ggplot](https://walshc.github.io/ebi-prog/plotting-with-ggplot.html)
- [Aggregating by Group](https://walshc.github.io/ebi-prog/aggregating.html)

## If regression commands are unfamiliar

Use the same object-first workflow throughout Intermediate:

```r
model <- lm(y ~ x1 + x2, data = my_data)
summary(model)
confint(model)
fitted(model)
residuals(model)
plot(model)
```

- `lm()` fits the model specified to the right of `~` and uses the outcome on
  the left.
- `summary()` reports coefficients, their classical tests, model fit, and the
  overall F-test.
- `confint()` reports coefficient confidence intervals.
- `fitted()` and `residuals()` return one value for each analysis row.
- `plot(model)` opens the standard diagnostic plots.

Write the fitted object to a meaningful name and inspect the analysis sample
before interpreting output. R silently omits rows containing missing values in
variables used by `lm()` unless instructed otherwise.

## A five-minute return-to-R check

Run this without copying the displayed answer:

```r
sharks <- read.csv("data/shark_tank_teaching.csv")
nrow(sharks)
mean(sharks$deal_on_show)
median(sharks$description_words)
table(sharks$season)
```

Then explain each output in words. If the code runs but you cannot explain the
quantity, the remaining problem is statistical rather than programming.

<div class="exam-bridge">
<span class="label">Assessment reminder</span><br>
Basic uses a written exam in which you may verify, interpret, or describe
supplied R code and output. Intermediate and Advanced use TestVision with live
data work in R, so this refresher becomes increasingly important later in the
course line.
</div>
