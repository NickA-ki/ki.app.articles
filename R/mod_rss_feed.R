#' rss_feed UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_rss_feed_ui <- function(id){
  ns <- NS(id)
    shiny::tagList(
      shiny::textInput(ns('textsearch'),label=NULL,value=""),
      shiny::div(class='chart-div',
                 plotly::plotlyOutput(ns("rss_plt"))
      ),
      shiny::br(),
      shiny::div(class='chart-div',
                 DT::DTOutput(ns("rss_tbl"))
      ),
      shiny::br()
      
    )
}
    
#' rss_feed Server Functions
#'
#' @noRd 
mod_rss_feed_server <- function(id,rss_data){
  shiny::moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$rss_plt <-
      plotly::renderPlotly({
        rss_plt_gen(rss_data,input$textsearch)
      })
    
    output$rss_tbl <-
      DT::renderDataTable(
        rss_tbl_gen(rss_data,input$textsearch),
        rownames = F,
        escape = F,
        filter = 'top'
      )
    
  })
 
}
    
## To be copied in the UI
# mod_rss_feed_ui("rss_feed_ui_1")
    
## To be copied in the server
# mod_rss_feed_server("rss_feed_ui_1")
