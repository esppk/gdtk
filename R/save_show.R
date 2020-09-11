#' save ggplot plot with showtext fix
#'
#' @param filename filename as string
#' @param height height of the plot
#'
#'
#' @return Nothing
#' @export
#'
#' @examples save_pic("pic.png")
save_pic <- function(filename, height = 11.25){


  showtext::showtext_opts(dpi = 300)
  showtext::showtext_auto()

  ggplot2::ggsave(filename,  height = height, units = "cm")

  showtext::showtext_opts(dpi = 85)
}



#' save and show ggplot output from rnotebook.
#'
#' @param pic_name name of the pic, no quote is needed. if not provided, random name will be used
#'
#' @return nothing.
#' @export
#'
#' @examples save_show(pic.png)
save_show <- function(pic_name) {

  if(rlang::is_missing(pic_name)){

    name <- sample(letters, 4, replace = FALSE) %>% stringr::str_c(collapse = "") %>%
      stringr::str_c(".png")
  } else {

    name <- rlang::enexpr(pic_name) %>% rlang::as_string()
  }

  save_pic(name)
  knitr::include_graphics(name)
}

