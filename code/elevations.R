
dat <- read.table(file = "data/NOTREDAM.TXT", header = T)

with(dat, {
  plot(c(0,7),c(0,7),type = "n", xlab = "East-West", ylab = "North-South")
  points(North.South ~ East.West, pch = 21, 
         bg = gray(1,alpha = 0.5), cex = (Elevation-600)/90) # cex = 1 to 4
})

cols =  gray.colors(4) # terrain.colors(4) 
elev2col <- function(x) {
  if (x <= 1) {
    col <- cols[1]
  } else if (x <= 2) {
    col <- cols[2]
  } else if (x <= 3) {
    col <- cols[3]
  } else if (x <= 4)
    col <- cols[4]
}

dat <- transform(dat, elev2col = sapply((Elevation - 600)/90, elev2col, USE.NAMES = TRUE) )

with(dat, {
  plot(c(0,7),c(0,7),type = "n", xlab = "East-West", ylab = "North-South")
  for (i in seq(dim(dat)[1])) {
    points(dat[i,c(1,2)], pch = 21, bg = dat[i,4], cex = 2) 
  }
})

# geoR

library(geoR)

## pt.divide ="quintiles" or "quartiles"
quantile(elevation$data, probs = seq(0, 1, 0.25)) # quintiles 5个分位点
quantile(elevation$data, probs = seq(0,1,length.out = 4)) # quartiles 4个分位点

points(elevation,
  xlab = "East-West", ylab = "North-South",
  pt.divide = seq(from = 690, to = 960, length.out = 6), # 6个断点划分为5个区间
  col.seq = gray.colors(5, start = 0.9, end = 0.3), # 填充色 颜色越深值越大
  cex.min = 2, cex.max = 2,
  dig.leg = 2
)

# sp or sf
library(maptools)
## readShapeSpatial or rgdal::readOGR
brazil <- rgdal::readOGR(system.file("extra", "10m-brazil.shp", package = "RGraphics"))

spplot(brazil, "Regions", col.regions = gray(5:1 / 6))

