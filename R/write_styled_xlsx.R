#'
#' Saved styled xlsx file
#'
#' @param df dataframe to save
#' @param file_name file name to save to
#' @param sheet_name [optional] name of the sheet to save
#' @param boldCols apply bold fonts to text in that column.
#'
#' @import openxlsx
#'
#' @return invisble wb object
#' @export
#'
#' @examples write_styled_xlsx(mtcars, "mtcars.xlsx", "first", 1:2)
#'
write_styled_xlsx <- function(df, file_name, sheet_name = "sheet1", boldCols = NULL) {

  nrows <- nrow(df)
  ncols <- ncol(df)

  wb <- createWorkbook()

  hs <- createStyle(bgFill = "#e2efda", halign = "center",
                    fgFill = "#e2efda", border = c("top", "bottom", "left", "right"),
                    valign = "center", textDecoration = "bold",
                    wrapText = TRUE)


  addWorksheet(wb, sheet_name)


  writeData(wb, sheet_name, df, xy = c("A", 1),
            headerStyle = hs, withFilter = TRUE,
            borders ="all", borderStyle = "thin")

  ns <- createStyle(numFmt = "0.0", halign = "center", valign = "center")
  addStyle(wb, sheet_name, style = ns, rows = 2:(nrows+1), cols = 1:ncols,
           gridExpand = TRUE, stack = TRUE)

  setColWidths(wb, sheet_name, 1:ncols, widths = "auto")
  setRowHeights(wb, sheet_name, rows = 2:(nrows+1), heights = 20)
  setRowHeights(wb, sheet_name, rows = 1, heights = 40)

  if(!is.null(boldCols)){

    bold <- createStyle(textDecoration = "bold")

    addStyle(wb, sheet_name, style = bold, rows = 2:(nrows+1), cols = boldCols,
             gridExpand = TRUE, stack = TRUE)
  }

  saveWorkbook(wb, file = file_name, overwrite = TRUE)

  invisible(wb)
}
