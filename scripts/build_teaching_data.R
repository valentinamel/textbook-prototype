raw_path <- file.path("data-raw", "shark_tank_us_dataset.csv")
out_path <- file.path("data", "shark_tank_teaching.csv")

if (!file.exists(raw_path)) {
  stop("Shark Tank source file not found at: ", raw_path)
}

raw <- read.csv(
  raw_path,
  check.names = FALSE,
  stringsAsFactors = FALSE,
  na.strings = c("", "NA"),
  fileEncoding = "UTF-8-BOM"
)

required <- c(
  "Season Number", "Startup Name", "Episode Number", "Pitch Number",
  "Industry", "Business Description", "Pitchers Gender", "Pitchers State",
  "Multiple Entrepreneurs", "Original Ask Amount",
  "Original Offered Equity", "Valuation Requested", "Got Deal",
  "Total Deal Amount", "Total Deal Equity", "Deal Valuation",
  "Number of Sharks in Deal"
)
stopifnot(all(required %in% names(raw)))

# Season 17 is incomplete in this source snapshot. Freeze the teaching data at
# the most recently completed season so that comparisons over time do not mix a
# partial season with complete seasons.
raw <- raw[raw[["Season Number"]] <= 16L, , drop = FALSE]

word_count <- function(x) {
  clean <- trimws(x)
  ifelse(is.na(clean) | clean == "", NA_integer_,
         lengths(strsplit(clean, "[[:space:]]+")))
}

gender_map <- c(
  "Female" = "all_women",
  "Male" = "all_men",
  "Mixed Team" = "mixed"
)
gender_group <- unname(gender_map[raw[["Pitchers Gender"]]])
gender_group[is.na(gender_group)] <- "unknown"

teaching <- data.frame(
  pitch_id = as.integer(raw[["Pitch Number"]]),
  startup_name = raw[["Startup Name"]],
  season = as.integer(raw[["Season Number"]]),
  episode = as.integer(raw[["Episode Number"]]),
  industry = raw[["Industry"]],
  business_description = raw[["Business Description"]],
  description_words = word_count(raw[["Business Description"]]),
  pitcher_gender_group = gender_group,
  women_represented = ifelse(
    gender_group == "unknown",
    NA_integer_,
    as.integer(gender_group %in% c("all_women", "mixed"))
  ),
  multiple_entrepreneurs = as.integer(raw[["Multiple Entrepreneurs"]]),
  pitcher_state = raw[["Pitchers State"]],
  ask_amount_usd = as.numeric(raw[["Original Ask Amount"]]),
  equity_offered_pct = as.numeric(raw[["Original Offered Equity"]]),
  requested_valuation_usd = as.numeric(raw[["Valuation Requested"]]),
  deal_on_show = as.integer(raw[["Got Deal"]]),
  deal_amount_usd = as.numeric(raw[["Total Deal Amount"]]),
  deal_equity_pct = as.numeric(raw[["Total Deal Equity"]]),
  deal_valuation_usd = as.numeric(raw[["Deal Valuation"]]),
  number_sharks_in_deal = as.integer(raw[["Number of Sharks in Deal"]]),
  stringsAsFactors = FALSE
)

stopifnot(
  nrow(teaching) == 1441L,
  ncol(teaching) == 19L,
  identical(sort(unique(teaching$season)), 1:16),
  !anyDuplicated(teaching$pitch_id),
  all(teaching$deal_on_show %in% 0:1),
  sum(teaching$deal_on_show == 1L) == 882L,
  all(teaching$pitcher_gender_group %in%
        c("all_women", "all_men", "mixed", "unknown")),
  sum(teaching$pitcher_gender_group == "unknown") == 7L,
  all(teaching$description_words > 0)
)

dir.create(dirname(out_path), recursive = TRUE, showWarnings = FALSE)
write.csv(teaching, out_path, row.names = FALSE, na = "")

message("Wrote ", nrow(teaching), " rows and ", ncol(teaching),
        " columns to ", out_path)
