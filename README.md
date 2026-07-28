# Quantitative Methods to Understand E&BI textbook

This repository contains the student textbook for the three-course
Quantitative Methods learning line. Bookdown provides a persistent left-hand
chapter menu like the preceding Programming for E&BI book and the Statistics 2
book used elsewhere in the program.

Current contents include:

- the shared welcome and course gateways for Basic, Intermediate, and Advanced;
- Basic Lectures 1-5 and Tutorials 1-2;
- a targeted pointer to the preceding Programming for E&BI book;
- an annotated MIT probability-video guide;
- the official CC0 Shark Tank source data and a reproducible teaching view.

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
