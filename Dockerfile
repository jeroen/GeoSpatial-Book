FROM rocker/verse:latest
MAINTAINER Xiangyun Huang xiangyunfaith@outlook.com

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential libssl-dev pandoc \
        libudunits2-dev libproj-dev libgeos-dev libgdal-dev

RUN mkdir ~/.R \
    && cp Makevars ~/.R \
    && Rscript -e 'tinytex::tlmgr_install(readLines("latex/TeXLive.pkgs"))'

RUN install2.r --error \
    desc \
    geoR \
    leaflet \
    rstan \
    sf

RUN install2.r --error \
  --repos "https://inla.r-inla-download.org/R/stable" \
  INLA 

COPY . /home/docker/GeoSpatial-Book
WORKDIR /home/docker/GeoSpatial-Book

CMD ["Rscript", "-e", "bookdown::render_book('index.Rmd')"]
