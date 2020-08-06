library(dplyr)
# reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltcitymary.emissions<-summarise(group_by(filter(NEI, fips == "24510"), year), Emissions=sum(Emissions))
# plotting the graph and getting the output in a png file
png("plot2.png", width=480, height=480)
x2<-barplot(height=baltcitymary.emissions$Emissions/1000, names.arg=baltcitymary.emissions$year,
            xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,4),
            main=expression('Total PM'[2.5]*' emissions in Baltimore City-MD in kilotons'),
            col=c("red", "green", "blue", "yellow"))
# Add text at top of bars
text(x = x2, y = round(baltcitymary.emissions$Emissions/1000,2), 
     label = round(baltcitymary.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")
dev.off()