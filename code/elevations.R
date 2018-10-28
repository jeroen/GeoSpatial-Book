
dat <- read.table(file = "data/NOTREDAM.TXT", header = T)

with(dat, {
  plot(c(0,7),c(0,7),type = "n", xlab = "East-West", ylab = "North-South")
  points(North.South ~ East.West, pch = 16, col = )
  text(
    x = East.West, y = North.South,
    labels = Elevation, adj = c(0, 0), xpd = 1
  )
})

# 气泡图 [@Tanimura2006]
 i = 1:4
 600 + 90*i
# 左开右闭区间 
0-1
1-2
2-3
3-4
(dat$Elevation - 600)/90

?gray()



