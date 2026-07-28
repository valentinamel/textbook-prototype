# Shark Tank teaching data

`shark_tank_teaching.csv` is a reduced, reproducible teaching view of the
official Kaggle dataset **All Shark Tank US Pitches & Deals**:

https://www.kaggle.com/datasets/neiljs/all-shark-tank-us-pitches-deals

The source is distributed on Kaggle under CC0 1.0. The archived source file is
`data-raw/Sharktankpitchesdeals.csv`; it contains 706 pitches, five source
variables, and seasons 1-8. It matches the supplied Word data description.

The teaching view contains only:

- `pitch_id`: row identifier;
- `deal_on_show`: 1 if an agreement was shown, otherwise 0;
- `season` and `episode`, decoded from `Season_Epi_code`;
- `description_words`: number of whitespace-separated words in the dataset's
  written business description.

`description_words` measures the length of the dataset description. It is not
the length or quality of the entrepreneur's spoken pitch.

Important interpretation: `deal_on_show = 1` means that an agreement was
reached during the televised pitch. It does not establish that due diligence
was completed, money was invested, or the business later succeeded.

Integrity checks (SHA-256):

- archived Kaggle source: `5d23fcb932b5dd58b639c3363ebd0937d93fe59658071f90a9b3e3fbb63e1e4c`;
- derived teaching file: `3de6cd26b5f9595ed12dcb1fc12b58c0129091ab392c567785f03c5261528fec`.

Rebuild from the textbook project directory:

```sh
Rscript scripts/build_teaching_data.R
```
