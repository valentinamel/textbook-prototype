# Publishing the textbook on GitHub Pages: beginner guide

This workflow deliberately starts simple. You will edit the source on your
computer, build the book, check it, and then upload both the source and the
rendered `docs` folder to GitHub. GitHub Pages serves the contents of `docs` as
the public website.

## What the pieces mean

- **GitHub repository:** the online project folder and its history.
- **Rmd file:** an editable textbook chapter containing prose, formulas, and R
  code.
- **Bookdown:** the R package that turns the Rmd chapters into one navigable
  book.
- **docs folder:** the finished HTML website that students see.
- **GitHub Pages:** GitHub's free static website hosting.
- **commit:** a named saved version of your changes.
- **push:** upload your local commits to GitHub.

## One-time setup

1. Create or sign in to a GitHub account at https://github.com.
2. Install GitHub Desktop from https://desktop.github.com. It provides buttons
   for the Git actions, so you do not need to learn command-line Git first.
3. Open `qm-ebi-textbook.Rproj` in RStudio.
4. In the R console, run `install.packages("bookdown")` once.
5. Test the book with
   `bookdown::render_book("index.Rmd", "bookdown::gitbook")`.
6. Open `docs/index.html`. Check the left menu, formulas, figures, code, and
   links before publishing.

## Create the repository

1. In GitHub Desktop choose **File -> Add local repository** and select the
   current textbook folder.
2. If GitHub Desktop says it is not yet a repository, choose **create a
   repository here**.
3. Use a clear name such as `qm-ebi-textbook`.
4. Keep the repository **private** during review. Public GitHub Pages on a free
   personal account normally requires a public repository; the team can change
   visibility when it is ready to release the book.
5. Enter a summary such as `Initial textbook edition`, click **Commit to
   main**, and then click **Publish repository**.

Do not place student records, exam answers, unpublished research data, or API
keys in the repository. A repository remembers old committed versions even
after a file is deleted later.

## Turn on GitHub Pages

1. Open the repository on github.com.
2. Choose **Settings -> Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**.
4. Select branch **main** and folder **/docs**, then click **Save**.
5. Wait for GitHub to display the published address. For a project repository
   it will normally look like
   `https://YOUR-USERNAME.github.io/qm-ebi-textbook/`.

The file `docs/.nojekyll` tells GitHub to serve the already-built Bookdown files
without trying to rebuild them as a Jekyll website.

## Routine update cycle

Every time you change the book:

1. Edit the relevant Rmd chapter.
2. Render the complete book in RStudio.
3. Open `docs/index.html` and check the changed page plus its previous/next
   links.
4. In GitHub Desktop, inspect the changed files.
5. Write a short commit summary, for example `Clarify Lecture 5 discrete CDF`.
6. Click **Commit to main**, then **Push origin**.
7. Check the public site after GitHub finishes deploying.

If the online book did not change, first verify that the changed files inside
`docs/` were included in the commit.

## Safe collaboration habit

Once more than one author edits the book, use a separate branch for each
change and a pull request for review. A practical naming pattern is
`revise-b05-random-variables` or `add-ep03`. Do not edit the same Rmd file in
two branches at the same time unless someone is comfortable resolving merge
conflicts.

## Later automation

GitHub Actions can eventually build and publish the site after every push. Do
that only after the local build is stable and the package list is frozen. The
manual `docs` workflow is easier to understand and troubleshoot while the team
becomes familiar with the publishing process.

Official references:

- Bookdown and GitHub Pages: https://bookdown.org/yihui/bookdown/github.html
- GitHub Pages publishing source: https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site
