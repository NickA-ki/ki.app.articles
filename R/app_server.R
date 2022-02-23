#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  all_rss_results <- rss_articles()
  
  waiter::waiter_show()
  
  mod_rss_feed_server("rss_feed_ui_1",all_rss_results)
  
  waiter::waiter_hide()
  
}
