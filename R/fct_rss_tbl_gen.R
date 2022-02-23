#' rss_tbl_gen 
#'
#' @description A fct function to create cvx_tbl
#' 
#' @param data AT data to transformed into data for tbl display
#'
#' @return The return tbl to be displayed in UI.
#' 
#' @importFrom rlang .data
#'
#' @noRd

rss_tbl_gen <- function(data) {
  rss_tbl <-
    data %>%
    dplyr::mutate(
      Article_Title = paste("<a href='",.data$link,"'>",.data$title,"</a>"),
      Article_Date = lubridate::as_date(.data$date),
      Article_Summary = .data$summary,
      Article_Sentiment = .data$sentiment
    ) %>%
    dplyr::select(.data$Article_Title,
                  .data$Article_Date,
                  .data$Article_Summary,
                  .data$Article_Sentiment) %>%
    dplyr::arrange(dplyr::desc(.data$Article_Date))
  
  return(rss_tbl)
}
