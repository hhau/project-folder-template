suppressPackageStartupMessages(library(logger))
suppressPackageStartupMessages(library(crayon))

base_filename <- unlist(strsplit(x = basename(Sys.glob("./*.rmd")), ".rmd"))
log_filename <- paste0("logs/" , Sys.Date(), "_", base_filename, ".log")
log_appender(appender_file(log_filename), namespace = base_filename)

cat(
  blue(sprintf('logger info')),
  "\n",
  "  ",
  blue$underline("log_filename:"),
  sprintf("%s", log_filename),
  "\n",
  "  ",
  blue$underline("base_filename / namespace :"),
  sprintf("%s", base_filename),
  "\n"
)

logfile_line_delineator <- function() {
  log_info(
    paste0(paste0(rep("=", times = 40), collapse = ""), "\n"),
    namespace = base_filename
  )
}
