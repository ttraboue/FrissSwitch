#' FrissSwitch
#'
#' initialize a switch
#' @param inputId inputId used by Shiny
#' @param text text inside button
#' @export

FrissSwitch <- function(inputId, text, width = "auto", state = TRUE, size = "mini", onColor = "success", offColor = "danger") {

  addResourcePath(
    prefix = 'wwwFrissSwitch',
    directoryPath = system.file('www', package='FrissSwitch'))

  tagList(

    singleton(tags$head(
      tags$script(src="wwwFrissSwitch/bootstrap-switch.min.js"),
      tags$script(src="wwwFrissSwitch/FrissSwitchBinding.js"),
      tags$link(rel="stylesheet", type="text/css", href="wwwFrissSwitch/bootstrap-switch.min.css")

      )),

    tags$input(type = "checkbox",
               id = inputId,
               checked = NA,
               "data-label-width" = width,
               class = "FrissSwitch",
               "data-size" = size,
               "data-on-color" = onColor,
               "data-off-color" = offColor,
               "data-label-text" = text),

    tags$script(paste0('$("#',inputId,'").bootstrapSwitch();')),

    tags$script(paste0('$("#',inputId,'").bootstrapSwitch("state",',tolower(state),');'))
  )
}
