#' Get Marineregions records by place type
#'
#' @export
#' @template dframe1
#' @param type (character) One place type name. See
#' [mr_place_types()] for place type names
#' @param offset (numeric) Offset to start at. Each request can return up to
#' 100 results. e.g., an offset of 200 will give records 200 to 299.
#' @param ... Curl options passed on to [httr::GET()]
#' @details Internally we use the `getGazetteerRecordsByType.json` API
#' method, which searches for Marineregions records by user supplied place type
#' @examples \dontrun{
#' # Get records of type 'EEZ', then inspect data.frame
#' res <- mr_records_by_type(type="EEZ")
#' head(res)
#'
#' # You can use mr_place_types() function to get types
#' ## then pass those into this function
#' types <- mr_place_types()
#' mr_records_by_type(types$type[1])
#' mr_records_by_type(types$type[10])
#'
#' # use regex to find a type name matching a pattern
#' x <- grep("MEOW", types$type, value = TRUE)
#'
#' # then pass to the function
#' mr_records_by_type(x)
#' mr_records_by_type(x, offset = 100)
#' }
mr_records_by_type <- function(type, offset = 0, ...) {
  stopifnot(is.numeric(offset) || is.integer(offset))
  url <- utils::URLencode(
    file.path(mr_base(),
              'getGazetteerRecordsByType.json', type, offset, '/'))
  x <- getter(url, args = NULL,
    format = "application/json; charset=UTF-8;", ...
  )
  jsonlite::fromJSON(x)
}
