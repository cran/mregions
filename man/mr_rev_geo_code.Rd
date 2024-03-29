% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rev_geo_code.R
\name{mr_rev_geo_code}
\alias{mr_rev_geo_code}
\title{Reverse Geocode with Marineregions}
\usage{
mr_rev_geo_code(lat, lon, lat_radius = 1, lon_radius = 1, ...)
}
\arguments{
\item{lat}{(numeric) Latitude for the coordinates (decimal format)}

\item{lon}{(numeric) Longitude for the coordinates (decimal format)}

\item{lat_radius}{(numeric) Extends search to include the range from
\code{lat}-\code{lat_radius} to \code{lat}+\code{lat_radius}}

\item{lon_radius}{(numeric) Extends search to include the range from
\code{lon}-\code{lon_radius} to \code{lon}+\code{lon_radius}}

\item{...}{curl options to be passed on to \code{\link[httr:GET]{httr::GET()}}}
}
\value{
If no results, an empty list. If results found, a data.frame with the columns:
\itemize{
\item MRGID (integer)
\item gazetteerSource (character)
\item placeType (character)
\item latitude (numeric)
\item longitude (numeric)
\item minLatitude (numeric)
\item minLongitude (numeric)
\item maxLatitude (numeric)
\item maxLongitude (numeric)
\item precision (numeric)
\item preferredGazetteerName (character)
\item preferredGazetteerNameLang (character)
\item status (character)
\item accepted (integer)
}
}
\description{
Retrieve the names of geographic objects from coordinates (and
optionally a radius around them).
}
\examples{
\dontrun{
# Setting radius to 0.5
mr_rev_geo_code(-21.5, 55.5, lat_radius=0.5, lon_radius=0.5)

# radius to 3
mr_rev_geo_code(-21.5, 55.5, lat_radius=3, lon_radius=3)

# radius to 1
mr_rev_geo_code(-15, 45, lat_radius=1, lon_radius=1)
}
}
\author{
Francois Michonneau \href{mailto:francois.michonneau@gmail.com}{francois.michonneau@gmail.com}
}
