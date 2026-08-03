# Internal editorial decisions

This file is for the teaching team. It is intentionally excluded from
`_bookdown.yml` and therefore does not appear in the student textbook.

## 2026-07-28

- Treat the website as the student textbook, not as a prototype. Student-facing
  pages contain instructions and explanations for students only.
- Keep technical chapter codes in filenames, R chunk names, and stable anchors
  for continuity, but render chapters as `Lecture N: Topic` and `Tutorial N`.
- Organize the permanent left navigation into Course 1 · Basic, Course 2 ·
  Intermediate, Course 3 · Advanced, and Supplementary resources.
- Use four Basic tutorials after Lectures 3, 5, 8, and 10. Use two tutorials in
  each of Intermediate and Advanced, positioned at mid-course and end-course.
- Basic assessment is written and may ask students to verify, interpret, or
  describe supplied R output. Intermediate and Advanced assessments use
  TestVision with hands-on data work in R.
- Use a restrained visual system: one typeface family, a navy/teal interface,
  limited callout variants, generous spacing, and no decorative elements that
  compete with navigation or content. Use colourblind-safe contrasting colours
  reinforced by shapes or line types when graphs distinguish groups.
- Begin with a warm team welcome and an overview of the three-course learning
  line. Display all lecturer photographs as equally sized circular portraits;
  crop them with CSS so the source files remain unchanged.
- Use the same three-part visual language in every lecture and tutorial: pale blue for
  Before class, pale green for In class, and pale purple for After class.
  Keep the labels and color meanings consistent across all three courses.
- Keep lecture pages lean: use the three phase containers without separate
  Driving question, Paper lens, cumulative-sheet, or research-reading-ladder
  sections for now.
- Do not use yellow note boxes in lecture or tutorial chapters. Integrate
  essential qualifications into the main explanation and omit non-essential
  commentary.
- Follow every substantive student question or exercise with a collapsed model
  answer. Personal-response activities do not require a model response.
- Give each lecture a concise retrieval set, additional application practice,
  and an R-output or interpretation task in After class.
- Structure tutorials as Before class preparation, In class group tasks, and
  After class timed practice. Use the clear label “Check your understanding”
  instead of “Exit ticket.”
- Mark required lecture videos with a compact, non-yellow Video preparation
  box inside Before class. Maintain one Supplementary resources page titled
  External Video Guide, allowing clips from different reputable sources.
- Link copyrighted external readings to their official source rather than
  republishing local copies in the GitHub textbook.
- Use R throughout the learning line and return mainly to the same Shark Tank
  anchor dataset. Add satellite datasets only when the method or design needs
  variables the anchor data cannot provide.
- The current 1,441-row teaching file is derived from the 53-variable
  `Shark Tank US dataset.csv` source and freezes completed Seasons 1--16.
  Incomplete Season 17 is excluded. Use the source's broad `Pitchers Gender`
  category (`Male`, `Female`, or `Mixed Team`) as a team-composition category;
  do not infer individual genders from names or call it a proportion of women.
- Keep the previous Programming for E&BI textbook and the R refresher visible
  in all three courses.
- Add a mathematics refresher under Supplementary resources after the course
  content and required mathematical scope have been agreed.
- Settle the textbook before revising accompanying lecture slides.
- Title Lecture 1 "Introduction to Data Analysis" and structure it as two
  45-minute blocks. The first introduces the
  learning line, demonstrates the textbook learning cycle, reactivates a
  reproducible R workflow, establishes responsible AI use, and closes with the
  analysis cycle. The second turns the class into data, introduces variable
  types and sample-to-population reasoning, then conducts the first Shark Tank
  investigation.
- Demonstrate the textbook cycle explicitly in Lecture 1: prepare before class,
  work jointly during class, practise after class, and bring attempts and
  questions to the TA-led group tutorials branded as exam preparation sessions.
- Treat R in Lecture 1 as reactivation through a short Data analysis with R
  block. Emphasize projects, relative paths, untouched raw data, scripted
  transformations, meaningful object names, and rerunning the analysis from a
  clean session. Refer students to Programming for E&BI for forgotten syntax.
- Use the live class data to distinguish categorical, discrete quantitative,
  and continuous quantitative variables, and to introduce population, sample,
  sampling variability, and selection bias. Stress that increasing a random
  sample reduces chance variation but increasing a convenience sample does not
  remove selection bias.
- Introduce the Shark Tank context and data-generating process before showing
  its table or graphs. Distinguish an on-air agreement from a final
  completed investment and explain what the source data leave unmeasured.
- End Lecture 1 by returning to the textbook cycle and showing students exactly
  what to prepare before Lecture 2, what to practise afterward, and how to use
  the exam preparation sessions.

## 2026-08-03

- Complete Basic with Lecture 6 on continuous distributions, Lecture 7 on
  sampling and estimators, and Lecture 8 on sampling distributions. Begin
  two-sided tests against zero together with confidence intervals in Lecture
  9; consolidate the testing workflow, errors, power, and the regression bridge
  in Lecture 10.
- Place Basic Tutorial 3 after Lecture 8 and Tutorial 4 after Lecture 10. Keep
  each tutorial in the same Before class / In class / After class structure as
  the lectures and supply collapsed model answers for every task.
- Use positive quantiles such as \(z_{1-\alpha/2}\) and
  \(t_{1-\alpha/2,n-1}\) for two-sided confidence intervals so notation maps
  directly to `qnorm()` and `qt()`.
- Build the first Intermediate course as six lectures: simple regression;
  assumptions and coefficient inference; fit and the overall F-test; multiple
  regression; dummy variables and partial F-tests; and interactions plus
  polynomial terms. Position tutorials after Lectures 3 and 6.
- Make Intermediate chapters self-contained rather than referring students to
  the Statistics 2 textbook from another programme. Use Stanford Statistical
  Learning videos and James et al., *An Introduction to Statistical Learning*
  as supporting sources. Retain common regression notation and explain R
  formula conventions at first use.
- Teach regression coefficient interpretation as a repeated protocol: estimate
  and direction, predictor step and unit, outcome unit, held-fixed variables,
  and sample/causal scope. Require scaled and combined-change practice.
- Use the larger Shark Tank teaching file across Intermediate examples. Treat
  source gender as a broad team-composition category, derive only an explicit
  women-represented indicator where needed, and never interpret it as a share
  or infer gender from names.
- Add a Mathematics Refresher under Supplementary resources with a chapter map
  covering every mathematical symbol and operation required in Basic and
  Intermediate.
- Maintain one cumulative Basic formula sheet, organised by the lecture in
  which each formula is introduced. Tutorials use only the sections reached at
  that point; the complete Lectures 1--10 version is attached to the closed-book
  written exam. Generate the online page and the two-page exam PDF from the same
  shared source so that they cannot drift apart.
- Defer slide revisions until the textbook content is settled.
