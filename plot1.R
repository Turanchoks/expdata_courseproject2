unzip('exdata-data-NEI_data.zip')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

emission_year <- with(NEI, tapply(Emissions, year, sum))

png('plot1.png')

plot(levels(as.factor(NEI$year)), 
     emission_year/1000, 
     type = 'l',
     xlab = "Year",
     ylab ="Total emissions from PM2.5 (thousands of tons)")

dev.off()