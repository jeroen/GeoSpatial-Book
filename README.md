[![Build Status](https://travis-ci.com/XiangyunHuang/GeoSpatial-Book.svg?branch=master)](https://travis-ci.com/XiangyunHuang/GeoSpatial-Book)[![Netlify Status](https://api.netlify.com/api/v1/badges/4c3bfe4b-a6e7-45b6-b4d3-f704b89f0329/deploy-status)](https://app.netlify.com/sites/r-spatial/deploys)[![CRAN status](https://www.r-pkg.org/badges/version/GeoSpatial)](https://cran.r-project.org/package=GeoSpatial) [![](https://images.microbadger.com/badges/image/cloud2016/geospatial-book.svg)](https://microbadger.com/images/cloud2016/geospatial-book)  [![](https://img.shields.io/docker/pulls/cloud2016/geospatial-book.svg)](https://hub.docker.com/r/cloud2016/geospatial-book)  [![](https://img.shields.io/docker/automated/cloud2016/geospatial-book.svg)](https://hub.docker.com/r/cloud2016/geospatial-book/builds/) [![License: CC BY NC ND 4.0](https://img.shields.io/badge/License-CC%20BY%20NC%20ND%204.0-blue.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/) 

---

# GeoSpatial Data Visualization, Analysis and Modeling in R

## 参考材料

> 书籍

- [Intro to GIS and Spatial Analysis](https://mgimond.github.io/Spatial/index.html)  Manuel Gimond https://github.com/mgimond/Spatial
- 时空统计与 R 语言 [Spatio-Temporal Statistics with R](https://spacetimewithr.org/)
- 空间点模式：理论与应用 [Spatial Point Patterns: Methodology and Applications with R](https://spatstat.org)
- 空间微观模拟与R语言 [Spatial Microsimulation with R](https://spatial-microsim-book.robinlovelace.net/) 
- 地质统计计算与 R 语言 [Geocomputation with R](https://geocompr.robinlovelace.net/)
- 空间统计概念入门 [Introduction to Geospatial Concepts](https://datacarpentry.org/organization-geospatial/)
- 用于生态学家的数据分析与可视化 [Data Analysis and Visualization in R for Ecologists](https://datacarpentry.org/R-ecology-lesson/)
- [Introduction to spatial analysis in R](https://github.com/jafflerbach/spatial-analysis-R)

> 博客、课程

- [An Introduction to Spatial Econometrics in R](https://ignaciomsarmiento.github.io/2017/02/07/An-Introduction-to-Spatial-Econometrics-in-R)
- [Data wrangling visualisation and spatial analysis: R Workshop](https://www.seascapemodels.org/data/data-wrangling-spatial-course.html)
- [Regional smoothing using R](https://pudding.cool/process/regional_smoothing/)
- [Spatial Data in R: New Directions](https://edzer.github.io/UseR2017/) 
- [Mapping unemployment data](http://sharpsightlabs.com/blog/map-unemployment-nov-2016/)
- [Areal data. Lung cancer risk in Pennsylvania](https://paula-moraga.github.io/tutorial-areal-data/)
- [Geostatistical data. Malaria in The Gambia](https://paula-moraga.github.io/tutorial-geostatistical-data/)
- [GeoSpatial Data Visualization in R](https://bhaskarvk.github.io/user2017.geodataviz/)
- [Ecological Models and Data in R](http://ms.mcmaster.ca/~bolker/emdbook/)
- [Geographic Data Science in Python](https://data.cdrc.ac.uk/dataset/geographic-data-science-in-python)
- [Spatial](https://data.cdrc.ac.uk/)
- [Fast GeoSpatial Analysis in Python](http://matthewrocklin.com/blog/work/2017/09/21/accelerating-geopandas-1)
- [A gentle INLA tutorial](https://www.precision-analytics.ca/blog-1/inla)
- [Reproducible road safety research: an exploration of the shifting spatial and temporal distribution of car-pedestrian crashes](https://github.com/Robinlovelace/stats19-gisruk)
- [出租车地理信息可视化](https://data-se.netlify.com/2017/11/20/great-dataviz-examples-in-rstats/)
- 地理数据分析和建模 [Spatial Data Science with R](https://www.rspatial.org/) raster 包 Geographic Data Analysis and Modeling 




## 运行环境

拉取 Docker 镜像

```bash
docker run --name book -d -p 8282:8787 -e ROOT=TRUE \
 -e USER=rstudio -e PASSWORD=cloud cloud2016/geospatial-book
```

克隆仓库

```bash
git clone https://github.com/XiangyunHuang/GeoSpatial-Book.git
```

安装依赖

```bash
devtools::install_deps('GeoSpatial-Book/')
```

编译网页书籍

```bash
bookdown::render_book("index.Rmd") # to build the book
browseURL("_book/index.html") # to view it
```
