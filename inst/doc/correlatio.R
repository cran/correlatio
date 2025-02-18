## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----echo=TRUE, eval = FALSE--------------------------------------------------
# # Note: The R package devtools must have been installed, in order for this line of code to work:
# devtools::install_github(repo="https://github.com/mmiche/correlatio",
#                       dependencies = "Imports", build_vignettes = TRUE)

## ----echo=TRUE, eval = FALSE--------------------------------------------------
# library(ggplot2) # version 3.5.1 (Download from CRAN)
# library(tibble) # version 3.2.1 (Download from CRAN)

## ----test1, eval = TRUE-------------------------------------------------------
# Set seed to guarantee reproducibility.
set.seed(13)
testSim <- correlatio::simcor(obs=6, rhos = c(.5, .6, .7))
test1 <- correlatio::corrio(data=testSim[[1]], visualize = TRUE)
test1$dat

## ----test1Details, eval = TRUE------------------------------------------------
test1$details

## ----test2a, eval = TRUE------------------------------------------------------
testSimTransformed <- lapply(testSim, function(x) {
    apply(x, 2, function(y) {
        correlatio::lineartransform(futureRange = c(1, 5), vec = y, digits = 0)
    })
})

## ----test2b, eval = TRUE------------------------------------------------------
test2 <- correlatio::corrio(data=testSimTransformed[[1]])
test2$dat

## ----whatif, eval = TRUE------------------------------------------------------
v1 <- c(6.58, 7.02, 6.95, 8.6, 6.81, 6.75, 7.65)
v2 <- c(176, 302, 194, 325, 318, 309, 275)

## ----whatifSolve, eval = TRUE-------------------------------------------------
test3 <- correlatio::corrio(data=data.frame(z1=scale(v1), z2=scale(v2)), visualize = TRUE)
test3$dat

## ----echo=TRUE, eval = FALSE--------------------------------------------------
# # sessionInfo()
# R version 4.4.0 (2024-04-24)
# Platform: x86_64-apple-darwin20
# Running under: macOS Sonoma 14.2.1
# 
# Matrix products: default
# BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
# LAPACK: /Library/Frameworks/R.framework/Versions/4.4-x86_64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.0
# 
# locale:
# [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
# 
# time zone: Europe/Zurich
# tzcode source: internal
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base
# 
# other attached packages:
# [1] correlatio_0.1.0
# 
# loaded via a namespace (and not attached):
#  [1] generics_0.1.3    stringi_1.8.4     digest_0.6.37
#  [4] magrittr_2.0.3    evaluate_1.0.3    grid_4.4.0
#  [7] pkgload_1.3.4     fastmap_1.2.0     processx_3.8.3
# [10] pkgbuild_1.4.3    sessioninfo_1.2.2 urlchecker_1.0.1
# [13] ps_1.6.0          promises_1.2.0.1  purrr_1.0.4
# [16] scales_1.3.0      Rdpack_2.6.2      cli_3.6.3
# [19] shiny_1.9.0       rlang_1.1.5       rbibutils_2.3
# [22] ellipsis_0.3.2    munsell_0.5.1     yaml_2.3.10
# [25] withr_3.0.2       remotes_2.4.2     cachem_1.1.0
# [28] devtools_2.4.5    tools_4.4.0       memoise_2.0.1
# [31] dplyr_1.1.4       colorspace_2.1-1  ggplot2_3.5.1
# [34] httpuv_1.6.5      curl_5.2.1        vctrs_0.6.5
# [37] R6_2.5.1          mime_0.12         lifecycle_1.0.4
# [40] stringr_1.5.1     fs_1.6.5          htmlwidgets_1.6.4
# [43] usethis_2.1.6     miniUI_0.1.1.1    pkgconfig_2.0.3
# [46] desc_1.4.3        callr_3.7.6       pillar_1.10.1
# [49] later_1.3.0       gtable_0.3.6      rsconnect_0.8.26
# [52] glue_1.8.0        profvis_0.3.7     Rcpp_1.0.14
# [55] xfun_0.50         tidyselect_1.2.1  tibble_3.2.1
# [58] knitr_1.49        rstudioapi_0.17.1 farver_2.1.2
# [61] xtable_1.8-4      htmltools_0.5.8.1 rmarkdown_2.29
# [64] labeling_0.4.3    compiler_4.4.0

