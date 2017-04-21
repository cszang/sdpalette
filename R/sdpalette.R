##' Give values from a 2-D colourspace defined by extremeness
##' (measured in SD) of 2 variables.
##'
##' This is based on Figure 4 in Babst F, Carrer M, Poulter B,
##' Urbinati C, Neuwirth B, Frank D. 2012. 500 years of regional
##' forest growth variability and links to climatic extreme events in
##' Europe. Environmental Research Letters 7: 45705.
##' @title 2 dimensional colourspace
##' @param rowvar Value for the anomaly in the row variable (in SDs) 
##' @param colvar Value for the anomaly in the column variable (in SDs) 
##' @return a colour as hexidecimal code
##' @export
sdpalette_colour <- function(rowvar, colvar) {
  sds <- seq(-2.75, 2.75, by = 0.5)
  if (rowvar >= 2.75) {
    xclass <- 11
  } else {
    if (rowvar <= -2.75) {
      xclass <- 1
    } else {
      xclass <- findInterval(rowvar, sds)
    }
  }
  if (colvar >= 2.75) {
    yclass <- 11
  } else {
    if (colvar <= -2.75) {
      yclass <- 1
    } else {
      yclass <- findInterval(colvar, sds)
    }
  }
  colmat[xclass, yclass]
}


##' @title Plot a legend for 2-dimensional colourspace
##' @param .xlab 
##' @param .ylab 
##' @return a gg object
##' @import ggplot2
##' @export
sdpalette_legend <- function(.xlab = "", .ylab = "") {
  sds <- seq(-2.5, 2.5, by = 0.5)
  grid <- expand.grid(sds, sds)
  grid$colour <- mapply(sdpalette_colour, grid$Var2, grid$Var1)
  ggplot(grid, aes(x = Var1, y = Var2)) +
    geom_tile(fill = grid$colour) +
    theme_minimal() +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.ticks = element_line()) +
    scale_x_continuous(breaks = -2:2) +
    scale_y_continuous(breaks = -2:2) +
    xlab(.xlab) +
    ylab(.ylab)
}
