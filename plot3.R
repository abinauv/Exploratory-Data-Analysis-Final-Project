library(dplyr)
library(ggplot2)
# reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# subsetting the data
subsetNEI  <- NEI[NEI$fips=="24510", ]
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)
# plotting the graph 
png("plot3.png", width=600, height=600)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()