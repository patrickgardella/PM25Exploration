zipFileName <- "./data/NEI_data.zip"
NEIFileName <- './data/summarySCC_PM25.rds'
SCCFileName <- './data/Source_Classification_Code.rds'

if (!file.exists("./data")) { dir.create("./data") }

if (!file.exists(zipFileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileURL, destfile = zipFileName, method="curl")
  list.files("./data")
  dateDownloaded <- date()
}

if (!file.exists(NEIFileName) | !file.exists(SCCFileName)) {
  unzip(zipFileName, overwrite = FALSE, exdir = "./data")
}

## This first line will likely take a few seconds. Be patient!

if (! exists("NEI") && ! is.data.frame(get("NEI"))) {
  NEI <- readRDS(NEIFileName)  
}

if (! exists("SCC") && ! is.data.frame(get("SCC"))) {
  SCC <- readRDS(SCCFileName)
}

######
# Have total emissions from PM2.5 decreased in the United States 
#   from 1999 to 2008? Using the base plotting system, make a plot 
#   showing the total PM2.5 emission from all sources for each of 
#   the years 1999, 2002, 2005, and 2008.
######
plot( NEI$year, NEI$Emissions, type = "l", col="black")

#x.sub4 <- x.df[x.df$y == 1, ]
aggregate(Emissions ~ year, data = NEI, sum)
