raw_path <- file.path("data-raw", "Sharktankpitchesdeals.csv")
out_path <- file.path("data", "shark_tank_teaching.csv")

if (!file.exists(raw_path)) {
  stop("Official Shark Tank file not found at: ", raw_path)
}

raw <- read.csv(
  raw_path,
  check.names = FALSE,
  stringsAsFactors = FALSE,
  fileEncoding = "UTF-8-BOM"
)

required <- c(
  "Season_Epi_code", "Pitched_Business_Identifier",
  "Pitched_Business_Desc", "Deal_Status", "Deal_Shark"
)
stopifnot(all(required %in% names(raw)))

word_count <- function(x) {
  clean <- trimws(x)
  ifelse(clean == "", 0L, lengths(strsplit(clean, "[[:space:]]+")))
}

season_episode <- as.integer(raw[["Season_Epi_code"]])

teaching <- data.frame(
  pitch_id = seq_len(nrow(raw)),
  deal_on_show = as.integer(raw[["Deal_Status"]]),
  season = season_episode %/% 100L,
  episode = season_episode %% 100L,
  description_words = word_count(raw[["Pitched_Business_Desc"]]),
  stringsAsFactors = FALSE
)

stopifnot(
  nrow(teaching) == 706,
  ncol(teaching) == 5,
  all(teaching$deal_on_show %in% 0:1),
  identical(sort(unique(teaching$season)), 1:8),
  all(teaching$episode > 0),
  all(teaching$description_words > 0)
)

dir.create(dirname(out_path), recursive = TRUE, showWarnings = FALSE)
write.csv(teaching, out_path, row.names = FALSE, na = "")

message("Wrote ", nrow(teaching), " rows and ", ncol(teaching), " columns to ", out_path)
