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
- The current 706-row teaching file is derived from the five-variable NeilJS
  Kaggle dataset, not from the earlier 495-row `Shark Tank Companies.csv` file.
  Neither source contains a verified entrepreneur-gender or team-gender
  variable. Do not infer gender from names; add a documented external source or
  transparent validated coding process before teaching gender comparisons.
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
