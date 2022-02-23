#' rss_plt_gen 
#'
#' @description A fct function to create cvx_plt
#' 
#' @param data AT data to transformed into bar chart
#'
#' @return The returned plot to be displayed in UI.
#' 
#' @importFrom rlang .data
#'
#' @noRd

rss_plt_gen <- function(data,search){
  data <- data %>% dplyr::mutate(
    AllText = stringr::str_to_lower(paste(.data$title,.data$summary))
  ) %>%
    dplyr::filter(stringr::str_detect(.data$AllText,stringr::str_to_lower(search)))
  
  colours <- c(
    "Positive" = "#4b5320",
    "Negative" = "#D70040",
    "Neutral" = "Grey"
  )
  
  plt <-
    data %>%
    dplyr::mutate(Date = format(lubridate::as_date(.data$date),"%Y-%m")) %>%
    dplyr::group_by(.data$Date,
                    .data$sentiment) %>%
    dplyr::summarise(art_count=dplyr::n(),
                     .groups='drop') %>%
    ggplot2::ggplot(
      ggplot2::aes(.data$Date,.data$art_count,fill=.data$sentiment)
    ) +
    ggplot2::geom_bar(stat="identity",width=0.8) +
    ggplot2::scale_fill_manual(values = colours) +
    ggplot2::xlab("Month") +
    ggplot2::ylab("Article Count") +
    ggplot2::theme(panel.background = ggplot2::element_blank())
  
  return(plt)
}
