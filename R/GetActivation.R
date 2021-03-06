#' @details This function requires having a character vector with one or more valid Report Suites specified.
#'
#' @description Get activation detail for the specified report suites. 
#' 
#' @title Get Activation Detail for a Report Suite(s)
#' 
#' @param reportsuite.ids Report suite id (or list of report suite ids)
#'
#' @importFrom jsonlite toJSON
#' @importFrom plyr rbind.fill
#'
#' @return Data frame
#'
#' @export
#'
#' @examples
#' \dontrun{
#' active <- GetActivation("your_report_suite")
#' 
#' active2 <- GetActivation(report_suites$rsid)
#' }

GetActivation <- function(reportsuite.ids) {
  
  request.body <- c()
  request.body$rsid_list <- reportsuite.ids
  
  response <- ApiRequest(body=toJSON(request.body),func.name="ReportSuite.GetActivation")
  
  #Don't even know if this is possible, holdover from GetSegments code
  if(length(response$activation[[1]]) == 0) {
      return(print("No Activations Reported For This Report Suite"))
    }

  return(response)

}