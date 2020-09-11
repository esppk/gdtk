
#' Title clean offshore bond from Wind
#'
#' @param df dataframe to be cleaned
#'
#' @return cleaned dataframe
#' @export
#'
#' @examples cleaned_offshore(off_jul)
clean_offshore <- function(df) {


    "code,abbr,债券英文简称,ISIN代码,债券全称,date,first,交易所,上市地区,currency,total,planned,tenure,coupon,票面利率说明,name,交易代码,发行人类型,担保人,has_rights,特殊条款说明,牵头经办人,账簿管理人,承销方式,起息日期,计息截止日,到期日期,price,息票品种,利率类型,付息频率,付息日说明,发行公告日期,上市公告日期,上市日期,最新评级,历史评级" %>% stringr::str_split(",") %>% purrr::flatten_chr() -> colnames(df)


  df %>% dplyr::select(dplyr::matches("^[a-z\\-]+$")) %>%
    dplyr::mutate(locale = stringr::str_extract(code, "(?<=\\.).+$"),
                  date = as.character(date))
}
