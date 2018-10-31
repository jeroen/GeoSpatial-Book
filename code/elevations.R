
dat <- read.table(file = "data/NOTREDAM.TXT", header = T)

with(dat, {
  plot(c(0,7),c(0,7),type = "n", xlab = "East-West", ylab = "North-South")
  points(North.South ~ East.West, pch = 21, 
         bg = gray(1,alpha = 0.5), cex = (Elevation-600)/90)
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
    points(dat[i,c(1,2)], pch = 21, bg = dat[i,4], cex =2 ) 
  }
})


