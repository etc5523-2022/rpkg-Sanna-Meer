#'#' Launching shiny app
#'
#' @description
#' This function launches a fast food shiny app from the package
#'
#' @export
run_app <- function() {
  app_dir <- system.file("myapp", package = "fastfoodworld")
  shiny::runApp(app_dir, display.mode = "normal")

}
