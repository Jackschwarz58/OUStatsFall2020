% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rmdfile.R
\name{rmdfile}
\alias{rmdfile}
\title{Link and file location}
\usage{
rmdfile(link, file, rootf)
}
\arguments{
\item{link}{the name of the link to be shown in the rmd docyment}

\item{file}{the file name in folder "rootf"}

\item{rootf}{this is the folder in the root of the package where files are located}
}
\value{
rmd code for setting up link
}
\description{
This will place a link in the RMD document to a file in the Intro2R package
}
\details{
This makes the construction of links easier
}
\examples{
\dontrun{
`r rmdfile("Lab2 exemplar code","Lab2.R", "Lab2")`
}
}
