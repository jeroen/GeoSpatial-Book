FROM rocker/geospatial:latest
MAINTAINER Xiangyun Huang xiangyunfaith@outlook.com

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    gcc-6 \
    g++-6 \
    pandoc \
  && mkdir ~/.R \
  && wget -P ~/.R https://raw.githubusercontent.com/XiangyunHuang/GeoSpatial-Book/master/Makevars \
  && install2.r --error \
    leaflet \
    rstan \
    rstanarm \
    brms \
  && install2.r --error \
    --repos "https://inla.r-inla-download.org/R/stable" \
    INLA 

COPY . /home/docker/GeoSpatial-Book
WORKDIR /home/docker/GeoSpatial-Book

CMD ["Rscript", "-e", "bookdown::render_book('index.Rmd')"]
