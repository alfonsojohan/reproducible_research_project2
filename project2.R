# Load the libraries 
library(dplyr)

# download source data
url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
dest <- "stormdata.csv.bz2"
rdsfile <- "stormdata.rds"

# Download the file and save it to dest if it not present in the folder
if (!file.exists(dest)){
  download.file(url = url, destfile = dest, quiet = TRUE)
}

# Read the file and export to rds for faster reading especially during the
# development phase. We then read the RDS file
# Transformations done while reading:
# - strip white spaces
if (!file.exists(rdsfile)) {
  saveRDS(read.csv(dest, strip.white = TRUE), file = rdsfile)
}
data <- as_tibble(readRDS(rdsfile))
