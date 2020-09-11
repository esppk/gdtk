

#' Draw raster plot for the dataframe, used in notebook.
#'
#' @param df table to draw picture
#' @param file file name to save, support quotation, can be missing, random name will be used.
#' @param title string, for title
#' @param source source of the data to be shown at footnote
#' @param title_just a number for just of title, 0 for left, -0.1 for center.
#' @param note_size footnote size, adjust this in order to prevent cut off.
#'
#' @return nothing
#' @export
#'
#' @examples save_tbl_pic(mtcars, mtcars.png, title = "mtcars chart", source = "R data")
save_tbl_pic <- function(df, title, source = "", file, title_just = 0, note_size = 8) {

  foot_notes <- stringr::str_glue("数据来源: {source}, 观点指数整理")

  if(rlang::is_missing(file)){

    file_name <- sample(letters, 4, replace = FALSE) %>% stringr::str_c(collapse = "") %>%
      stringr::str_c(".png")

  } else {

    file_name <- rlang::enexpr(file) %>% rlang::as_string()
  }

  ggpubr::ggtexttable(df, rows = NULL,
                      theme = ggpubr::ttheme(
                        colnames.style = ggpubr::colnames_style(size = 12, color = "white", face = "bold",
                                                                # family = "source_han_sans",
                                                        fill = "#f3a06e", linewidth = 0.3),
                        padding = ggplot2::unit(c(8, 5), "mm"),
                        base_size = 14,
                        tbody.style = ggpubr::tbody_style(size = 11, # family = "source_han_sans",
                                                  fill = c("#f4d5b1", "#eeeded"),
                                                  color = "gray10", face = "plain",
                                                  linewidth = 0.3))) %>%
    ggpubr::tab_add_footnote(
      foot_notes,
      size = note_size,
      color = "gray30",
      family = "source_han_sans",
      padding = ggplot2::unit(1, "line"),
      just = "right"
    ) %>%
    ggpubr::tab_add_title(title, family = "source_han_sans",
                          hjust = title_just,
                          padding = ggplot2::unit(1, "line"))

  save_pic(file_name, 30)

  tbl_pic <- magick::image_read(file_name)

  magick::image_trim(tbl_pic) %>%
    magick::image_write(file_name)

  knitr::include_graphics(file_name)
}
