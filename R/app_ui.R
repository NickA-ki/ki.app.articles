#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    waiter::use_waiter(),
    waiter::waiterShowOnLoad(),
    # Your application UI logic 
      shiny::navbarPage("Sentiment Dashboard",
                 tabPanel("Market News",
                          mod_rss_feed_ui("rss_feed_ui_1"))
      )
    )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  golem::add_resource_path(
    "www", here::here("inst", "app", "www")
  )
  
  # Compile the SASS
  sass::sass(
    sass::sass_file(here::here("inst", "app", "www", "style.scss")),
    output = here::here("inst", "app", "www", "style.css"),
    cache = FALSE
  )
  
  shiny::tags$head(
    golem::favicon(),
    golem::bundle_resources(
      path = here::here("inst", "app", "www"),
      app_title = "Sentiments"
    )
  )
}

