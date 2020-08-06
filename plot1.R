library(dplyr)
# reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# grouping total NEI emissions per year
total.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
# plotting the graph and getting the output in a png file
png("plot1.png", width=480, height=480)
x1<-barplot(height=total.emissions$Emissions/1000, names.arg=total.emissions$year,
            xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
            main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),
            col=c("red", "green", "blue", "yellow"))
# Add text at top of bars
text(x = x1, y = round(total.emissions$Emissions/1000,2), 
     label = round(total.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")
dev.off()