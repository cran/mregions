% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mr_layers.R
\name{mr_layers}
\alias{mr_layers}
\title{list layers}
\usage{
mr_layers(...)
}
\arguments{
\item{...}{Curl options passed on to \code{\link[httr:GET]{httr::GET()}}}
}
\description{
list layers
}
\examples{
\dontrun{
res <- mr_layers()
vapply(res, '[[', '', 'Name')
}
}
