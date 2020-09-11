
#' Title clean dataframe read from Wind bonds
#'
#' @param df dataframe to be cleaned
#'
#' @return cleaned dataframe
#' @export
#'
#'
#' @examples clean_onshore(allbonds)
clean_onshore <- function(df) {

  colnames(df) <- c("code", "abbr",  "total", "tenure", "coupon",
                   "planned", "usage", "first", "second", "has_rights", "name",
                   "industry", "date", "long_name", "exp_date")

  df %>% dplyr::mutate(locale = "ml", currency = "CNY",
                       dplyr::across(c(total, tenure, coupon, planned), as.numeric))

}
