[![Build Status](https://travis-ci.com/XiangyunHuang/GeoSpatial-Book.svg?branch=master)](https://travis-ci.com/XiangyunHuang/GeoSpatial-Book) [![](https://images.microbadger.com/badges/image/cloud2016/geospatial-book.svg)](https://microbadger.com/images/cloud2016/geospatial-book)  [![](https://img.shields.io/docker/pulls/cloud2016/geospatial-book.svg)](https://hub.docker.com/r/cloud2016/geospatial-book)  [![](https://img.shields.io/docker/automated/cloud2016/geospatial-book.svg)](https://hub.docker.com/r/cloud2016/geospatial-book/builds/) [![License: CC BY NC ND 4.0](https://img.shields.io/badge/License-CC%20BY%20NC%20ND%204.0-blue.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/) 

---

# GeoSpatial Data Visualization, Analysis and Modeling in R


## Reproducibility

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
