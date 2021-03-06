FROM rocker/geospatial:latest
MAINTAINER Xiangyun Huang xiangyunfaith@outlook.com

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    g++-6 \
    libnlopt-dev \
  && mkdir ~/.R \
  && echo "CXXFLAGS += -Wno-ignored-attributes" >> ~/.R/Makevars \
  && echo "CXX14 = g++-6 -fPIC -flto=2" >> ~/.R/Makevars \
  && echo "CXX14FLAGS = -mtune=native -march=native -Wno-unused-variable -Wno-unused-function -Wno-unused-local-typedefs -Wno-ignored-attributes -Wno-deprecated-declarations -Wno-attributes -O3" >> ~/.R/Makevars \
  && install2.r --error \
    leaflet \
    rstan \
    brms \
  && install2.r --error \
    --repos "https://inla.r-inla-download.org/R/stable" \
    INLA 

COPY . /home/docker/GeoSpatial-Book
WORKDIR /home/docker/GeoSpatial-Book

CMD ["Rscript", "-e", "bookdown::render_book('index.Rmd')"]
