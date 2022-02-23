#' Generate RSS feed AT data
#'
#' @param base API base table
#' 
#' @param table Airtable name
#' 
#'
#' @noRd
rss_articles <- function(){
  
  conn <- DBI::dbConnect(RSQLite::SQLite(),"Articles.db")
  
  df <- DBI::dbGetQuery(conn,'SELECT * FROM Sentiments')
  
  DBI::dbDisconnect(conn)
  
  return(df)
  
}
