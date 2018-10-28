# https://www.jstatsoft.org/v015/i05

ProportionalSymbolMap <- function(map, variable,
                                  type = c("mathematical", "perceptual"),
                                  max.size = 1500,
                                  symbol.fg = grey(.2), symbol.bg = grey(.5),
                                  legend.loc, legend.breaks,
                                  legend.type = c("nested", "linear"),
                                  legend.cex = .6) {
  if (missing(map)) stop("map object is missing.")
  if (!inherits(map, "Map")) stop("Map.obj must be of class Map")
  if (missing(variable)) stop("variable to be plot is missing")
  verts <- Map2points(map)[order(variable, decreasing = TRUE), ]
  type <- match.arg(type)
  switch(type,
    mathematical = scale <- sqrt(variable / max(variable)) * max.size,
    perceptual = scale <- ((variable / max(variable))^0.57) * max.size
  )
  scale <- scale[order(variable, decreasing = TRUE)]
  symbols(verts[, 1:2],
    circle = scale / 1.1, bg = symbol.bg, fg = symbol.fg,
    inches = FALSE, add = TRUE
  )
  if ((!missing(legend.loc)) & (!missing(legend.breaks))) {
    switch(type,
      mathematical = {
        legend.r <- sqrt(legend.breaks / max(variable)) * max.size
      },
      perceptual = {
        legend.r <- ((legend.breaks / max(variable))^0.57) * max.size
      }
    )
    legend.type <- match.arg(legend.type)
    switch(legend.type,
      nested = {
        r <- rev(legend.r)
        b <- rev(legend.breaks)
        for (i in 1:length(r)) {
          symbols(legend.loc[1], legend.loc[2] + r[i],
            circle = r[i] / 1.1, inches = FALSE, add = TRUE,
            bg = symbol.bg, fg = symbol.fg
          )
          lines(
            c(legend.loc[1], legend.loc[1] + 1.2 * r[1]),
            rep(legend.loc[2] + 2 * r[i], 2)
          )
          text(legend.loc[1] + 1.2 * r[1] + par("cxy")[1] / 2,
            legend.loc[2] + 2 * r[i], b[i],
            adj = c(0, .5),
            cex = legend.cex
          )
        }
      },
      linear = {
        r <- legend.r
        gap <- r[length(r) %/% 2]
        s <- vector()
        for (i in 1:length(r)) s[i] <- sum(r[1:i])
        x <- 2 * s - r + (0:(length(r) - 1)) * gap + legend.loc[1]
        symbols(x, rep(legend.loc[2], length(r)),
          circles = r / 1.1,
          inches = FALSE, bg = symbol.bg, fg = symbol.fg, add = TRUE
        )
        text(x, legend.loc[2] + r + par("cxy")[2] * legend.cex, legend.breaks,
          adj = c(.5, 1), cex = legend.cex
        )
      }
    )
  }
}
