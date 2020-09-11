
#' Return db handler for the fundr
#'
#' @return mongo db object
#' @export
#'
#' @examples db1()
db1 <- function(){

  mongolite::mongo(collection = "fundr", db = "fundr",
                   url = "mongodb+srv://saler:5al3r@cluster-opuen.mongodb.net/test?retryWrites=true&w=majority",
                   verbose = FALSE)
}

db2 <- function(){

  mongolite::mongo(collection = "extra", db = "fundr",
               url = "mongodb+srv://saler:5al3r@cluster-opuen.mongodb.net/test?retryWrites=true&w=majority",
               verbose = FALSE)
}
