# Shark Tank teaching data

`shark_tank_teaching.csv` is a reproducible teaching view of Satya Thirumani's
**Shark Tank US dataset**:

https://www.kaggle.com/datasets/thirumani/shark-tank-us-dataset

The archived source snapshot is `data-raw/shark_tank_us_dataset.csv`. It was
downloaded on 3 August 2026 and contains 1,485 pitches and 53 source variables.
The teaching view uses Seasons 1--16 (1,441 pitches). Season 17 is excluded
because it is incomplete in this snapshot: it has 44 records, no recorded
season end, and four pitches without outcomes or ask information.

## Unit of observation and interpretation

One row represents one televised pitch. `deal_on_show = 1` means that the
dataset records a deal during the programme. It does not establish that due
diligence was completed, money was transferred, or the venture later
succeeded.

Gender refers to the people presenting the pitch, not necessarily every founder
or employee of the company. `pitcher_gender_group` reproduces the source
classification in clearer labels:

- `all_women`: source value `Female`;
- `all_men`: source value `Male`;
- `mixed`: source value `Mixed Team`;
- `unknown`: source value missing.

`women_represented` equals 1 for `all_women` and `mixed`, 0 for `all_men`, and
is missing for `unknown`. It measures whether at least one woman is represented,
not the share of women. The source does not provide the presenter counts needed
to calculate a defensible share for mixed teams. Names are not used to infer
gender.

## Variables

- `pitch_id`: source pitch number and unique row identifier;
- `startup_name`: venture or product name;
- `season`: television season, 1--16;
- `episode`: episode number within the season;
- `industry`: source industry category;
- `business_description`: short written source description;
- `description_words`: whitespace-separated words in that description;
- `pitcher_gender_group`: `all_women`, `all_men`, `mixed`, or `unknown`;
- `women_represented`: 1 if the source category includes women, 0 for
  `all_men`, and missing for `unknown`;
- `multiple_entrepreneurs`: source indicator for multiple presenters, with
  missing values where the source does not report it;
- `pitcher_state`: source state or country label;
- `ask_amount_usd`: amount requested, in nominal US dollars;
- `equity_offered_pct`: ownership percentage initially offered;
- `requested_valuation_usd`: valuation implied by the ask and offered equity;
- `deal_on_show`: 1 for a recorded on-air deal and 0 otherwise;
- `deal_amount_usd`: recorded deal amount, missing when there was no deal;
- `deal_equity_pct`: recorded deal equity percentage, missing when there was
  no deal;
- `deal_valuation_usd`: valuation implied by the recorded deal, missing when
  there was no deal;
- `number_sharks_in_deal`: number of investors in the recorded deal, missing
  when there was no deal.

Missing deal terms are structural: they are absent for pitches without a deal.
Other missing values reflect unreported source information and must not be
silently converted to zero.

## Rebuild

From the textbook project directory, run:

```sh
Rscript scripts/build_teaching_data.R
```

The script preserves the raw snapshot, filters the completed seasons, renames
the selected variables, derives the documented teaching variables, runs
integrity checks, and writes `data/shark_tank_teaching.csv`.

Integrity checks (SHA-256) are recorded after the teaching file is rebuilt:

- archived Kaggle source: `64236e6258ad8d32c2e4c320c71213ff1a369dd105595131561e748e2719a6c3`;
- derived teaching file: `1828d0d72b14ce39ecbeb864a8a12fbc0a6c1d853eb2f32c0ecc050846556b93`.
