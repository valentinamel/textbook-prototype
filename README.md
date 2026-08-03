# Quantitative Methods to Understand E&BI textbook

This repository contains the student textbook for the three-course
Quantitative Methods learning line. Bookdown provides a persistent left-hand
chapter menu for clear navigation across the three courses.

Current contents include:

- the shared welcome and course gateways for Basic, Intermediate, and Advanced;
- all 10 Basic lectures and four exam-preparation tutorials;
- six Intermediate lectures and two exam-preparation tutorials covering simple
  and multiple linear regression, inference, model fit, dummy variables,
  interactions, and polynomial terms;
- a targeted pointer to the preceding Programming for E&BI book;
- a chapter-linked mathematics refresher and external video guide;
- the official CC0 Shark Tank source data for completed Seasons 1--16 and a
  reproducible 19-variable teaching view.

Internal editorial decisions are recorded in
`INTERNAL_EDITORIAL_DECISIONS.md`; that file is not included in the rendered
student book.

## Build locally

Run once:

```r
install.packages("bookdown")
```

Then, from this directory:

```r
bookdown::render_book("index.Rmd", "bookdown::gitbook")
```

The rendered website is written to `docs/`. Open `docs/index.html` to inspect
it locally.

## Publish

Follow `GITHUB_PAGES_BEGINNER_GUIDE.md`. The recommended first workflow is to
commit both the source and the rendered `docs/` folder, then configure GitHub
Pages to deploy from `main` / `docs`. This keeps the edit-build-review-push
cycle visible while the team becomes familiar with GitHub.
