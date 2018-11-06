# 分组求和 colSums colMeans max

unique(iris$Species)

?by

colSums(iris[iris$Species == "setosa", -5])

colSums(iris[iris$Species == "virginica", -5])

colSums(iris[iris$Species == "versicolor", -5])


apply(iris[iris$Species == "setosa", -5], 2, min)

apply(iris[iris$Species == "setosa", -5], 2, max)

apply(iris[iris$Species == "setosa", -5], 2, quantile)

# 按分类变量 Species 分组求和
aggregate(subset(iris, select = -Species), by = list(iris[, "Species"]), FUN = sum)

# 先确定位置
which("Species" == colnames(iris))

aggregate(iris[,-5], list(iris[,5]), sum)
# 分组统计
aggregate(iris[,-5], list(iris[,5]), mean)


by(iris[,1], INDICES = list(iris$Species), FUN=sum)

by(iris[,2], INDICES = list(iris$Species), FUN=sum)

by(iris[,3], INDICES = list(iris$Species), FUN=sum)

library(dplyr)


