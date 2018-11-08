# rungeKutta 和 lorenz 两个函数来自 nonlinearTseries 包

library("plot3D")
lor <- lorenz(do.plot = F)

pdf(file = "lorenz.pdf", colormodel = "cmyk")
scatter3D(lor$x, lor$y, lor$z,
  ann = FALSE, col = terrain.colors(25),
  type = "o", cex = 0.3,
  colkey = FALSE, box = FALSE
)
dev.off()
# 龙格-库塔算法 常微分方程数值解
rungeKutta <- function(func, initial.condition, time, params) {
  n.samples <- length(time)
  h <- time[[2]] - time[[1]]
  y <- matrix(ncol = length(initial.condition), nrow = n.samples)
  y[1, ] <- initial.condition
  for (i in 2:n.samples) {
    k1 <- h * func(y[i - 1, ], time[[i - 1]], params)
    k2 <- h * func(
      y[i - 1, ] + k1 / 2, time[[i - 1]] + h / 2,
      params
    )
    k3 <- h * func(
      y[i - 1, ] + k2 / 2, time[[i - 1]] + h / 2,
      params
    )
    k4 <- h * func(y[i - 1, ] + k3, time[[i - 1]] + h, params)
    y[i, ] <- y[i - 1, ] + (k1 + 2 * k2 + 2 * k3 + k4) / 6
  }
  y
}


lorenz <- function(sigma = 10, beta = 8 / 3, rho = 28,
                   start = c(-13, -14, 47),
                   time = seq(0, 50, by = 0.01), do.plot = TRUE) {
  params <- c(sigma, beta, rho)
  lorenzEquations <- function(coord, t, params) {
    x <- coord[[1]]
    y <- coord[[2]]
    z <- coord[[3]]
    sigma <- params[[1]]
    beta <- params[[2]]
    rho <- params[[3]]
    c(sigma * (y - x), rho * x - y - x * z, x * y - beta *
      z)
  }
  l <- rungeKutta(lorenzEquations, start, time, params)
  if (do.plot) {
    plot3d(l[, 1], l[, 2], l[, 3],
      pch = 1, cex = 1, xlab = "x(t)",
      ylab = "y(t)", zlab = "z(t)"
    )
  }
  list(time = time, x = l[, 1], y = l[, 2], z = l[, 3])
}
