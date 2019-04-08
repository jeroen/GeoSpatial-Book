library(methods)
set.seed(2018)

is_on_travis = identical(Sys.getenv("TRAVIS"), "true")
is_online = curl::has_internet()

doc_type <- function() knitr::opts_knit$get('rmarkdown.pandoc.to')

knitr::knit_hooks$set(
  optipng = knitr::hook_optipng,
  pdfcrop = knitr::hook_pdfcrop,
  small.mar = function(before, options, envir) {
    if (before) par(mar = c(4.1, 4.1, 0.5, 0.5))  # smaller margin on top and right
  }
)
# https://github.com/yihui/knitr-examples/blob/master/085-pdfcrop.Rnw

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  echo = FALSE,
  cache = TRUE,
  small.mar = TRUE,
  fig.show = 'hold',
  out.width = "70%",
  fig.align = "center",
  fig.width = 6,
  width = 69,
  fig.asp = 0.618
)
options(
  digits = 3,
  citation.bibtex.max = 999,
  bitmapType = "cairo",
  stringsAsFactors = FALSE,
  BioC_mirror = "https://mirrors.tuna.tsinghua.edu.cn/bioconductor",
  repos = c(
    CRAN = if(is_on_travis) "https://cloud.r-project.org" else "https://mirrors.tuna.tsinghua.edu.cn/CRAN/",
    RForge = "https://r-forge.r-project.org",
    inla = "https://inla.r-inla-download.org/R/stable"
  ),
  knitr.graphics.auto_pdf = FALSE,
  width = 69,
  str = strOptions(strict.width = "cut")
  )
