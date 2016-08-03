mregions
========

[![Build Status](https://travis-ci.org/ropenscilabs/mregions.svg)](https://travis-ci.org/ropenscilabs/mregions)
[![codecov.io](https://codecov.io/github/ropenscilabs/mregions/coverage.svg?branch=master)](https://codecov.io/github/ropenscilabs/mregions?branch=master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/mregions?color=FAB657)](https://github.com/metacran/cranlogs.app)

`mregions` - Get data from <http://www.marineregions.org>

Some data comes from the [Flanders Marine Institute (VLIZ) geoserver](http://geo.vliz.be/geoserver/web/)

`mregions` is useful to a wide diversity of R users because you get access to all of the
data MarineRegions has, which can help in a variety of use cases:

* Visualize marine regions alone
* Visualize marine regions with associated data paired with analysis
* Use marine region geospatial boundaries to query data providers (e.g., OBIS (<http://www.iobis.org>))
* Geocode - get geolocation data from place names
* Reverse Geocode - get place names from geolocation data

## Install


```r
install.packages("mregions")
```

Development version


```r
devtools::install_github("ropenscilabs/mregions")
```


```r
library("mregions")
```

## GeoJSON

Get region


```r
res1 <- mr_geojson(name = "Turkmen Exclusive Economic Zone")
```

Get helper library


```r
install.packages("leaflet")
```

Plot data


```r
library('leaflet')
leaflet() %>%
  addProviderTiles(provider = 'OpenStreetMap') %>%
  addGeoJSON(geojson = res1$features) %>%
  setView(53, 40, zoom = 6)
```

![map](http://f.cl.ly/items/0c2c2Z143d2H3F142c35/Screen%20Shot%202015-12-09%20at%2010.01.52%20AM.png)

## Shape

Get region


```r
res2 <- mr_shp(name = "Belgian Exclusive Economic Zone")
```

Get helper library


```r
install.packages("leaflet")
```

Plot data


```r
library('leaflet')
leaflet() %>%
  addProviderTiles(provider = 'OpenStreetMap') %>%
  addPolygons(data = res2)
```

![map2](http://f.cl.ly/items/1m3R2p241S1u1n3r141R/Screen%20Shot%202015-12-09%20at%209.36.19%20AM.png)

## Convert to WKT

From geojson


```r
res3 <- mr_geojson(key = "MarineRegions:eez_33176")
mr_as_wkt(res3, fmt = 5)

#> [1] "MULTIPOLYGON (((41.573732 -1.659444, 45.891882 ... cutoff
```

From shp object (`SpatialPolygonsDataFrame`) or file, both work


```r
## path to wkt
mr_as_wkt(mr_shp(key = "MarineRegions:eez_33176", read = FALSE))
## spatial object to wkt
mr_as_wkt(mr_shp(key = "MarineRegions:eez_33176", read = TRUE))

#> [1] "MULTIPOLYGON (((41.573732 -1.659444, 45.891882 ... cutoff
```

## Get OBIS EEZ ID


```r
res4 <- mr_names()
mr_obis_eez_id(res4$title[100])
```

```
## [1] 224
```

## Contributors

* [Scott Chamberlain](https://github.com/sckott)
* [Francois Michonneau](https://github.com/fmichonneau)
* [Pieter Provoost](https://github.com/pieterprovoost)
* [Michael Sumner](https://github.com/mdsumner)

## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/mregions/issues).
* License: MIT
* Get citation information for `mregions` in R doing `citation(package = 'mregions')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![rofooter](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
