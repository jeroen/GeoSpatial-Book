FROM rocker/verse:latest
MAINTAINER Xiangyun Huang xiangyunfaith@outlook.com

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    pandoc \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    liblwgeom-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    protobuf-compiler \
    tk-dev \
    unixodbc-dev \
  && mkdir ~/.R \
  && wget -P ~/.R https://raw.githubusercontent.com/XiangyunHuang/GeoSpatial-Book/master/Makevars
  && install2.r --error \
    desc \
    geoR \
    leaflet \
    rstan \
    sf
  && install2.r --error \
    --repos "https://inla.r-inla-download.org/R/stable" \
    INLA 

COPY . /home/docker/GeoSpatial-Book
WORKDIR /home/docker/GeoSpatial-Book

CMD ["Rscript", "-e", "bookdown::render_book('index.Rmd')"]
