
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

## 模拟泊松对数线性模型 SGLMM
library(geoR)

set.seed(371)
cp <- expand.grid(seq(0, 1, l = 10), seq(0, 1, l = 10))
s <- grf(grid = cp, cov.pars = c(2, 0.2), cov.model = "mat", kappa = 1.5)
image(s, col = gray(seq(1, 0.2, l = 21)))
lambda <- exp(0.5 + s$data)
y <- rpois(length(s$data), lambda = lambda)
text(cp[, 1], cp[, 2], y, cex = 1.5)

# 模拟带块金效应 tau 的模型
lambda <- exp(s$data + tau * rnorm(length(s$data)))

# 模拟二项logit线性模型 SGLMM
# mu = 0
set.seed(34)
locs <- seq(0, 1, l = 401)
s <- grf(grid = cbind(locs, 1), cov.pars = c(5, 0.1),
           cov.model = "matern", kappa = 1.5)
p <- exp(s$data)/(1 + exp(s$data))
ind <- seq(1, 401, by = 8)
y <- rbinom(p[ind], size = 1, prob = p)
plot(locs[ind], y, xlab = "locations", ylab = "data")
lines(locs, p)

# mu = 2
set.seed(23)
s <- grf(60, cov.pars = c(5, 0.25))
p <- exp(2 + s$data)/(1 + exp(2 + s$data))
y <- rbinom(length(p), size = 5, prob = p)
points(s)
text(s$coords, label = y, pos = 3, offset = 0.3)

