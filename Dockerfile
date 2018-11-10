FROM r-base
MAINTAINER Xiangyun Huang xiangyunfaith@outlook.com

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential libssl-dev pandoc \
        libudunits2-dev libproj-dev libgeos-dev libgdal-dev

RUN install2.r --error \
    colorspace \
    desc \
    dplyr \
    geoR \
    ggplot2 \
    knitr \
    leaflet \
    bookdown \
    rstan \
    sf

COPY . /home/docker/GeoSpatial-Book
WORKDIR /home/docker/GeoSpatial-Book

CMD ["Rscript", "-e", "bookdown::render_book('index.Rmd')"]
