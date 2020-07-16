#For CRAN
cran_packages <- c("Package1", "Package2")
if (length(setdiff(cran_packages, rownames(installed.packages()))) > 0)
{
  install.packages(setdiff(cran_packages, rownames(installed.packages())))
}

#For BioConductor
bio_packages <- c("Package1", "Package2")
if (length(setdiff(bio_packages, rownames(installed.packages()))) > 0)
{
  source("http://bioconductor.org/biocLite.R")
  biocLite(setdiff(bio_packages, rownames(installed.packages())))
}