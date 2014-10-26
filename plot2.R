unzip('exdata-data-NEI_data.zip')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

emission_year_balt <- with(NEI[NEI$fips == "24510",], tapply(Emissions, year, sum))

png('plot2.png')

plot(levels(as.factor(NEI$year)), 
     emission_year_balt/1000, 
     type = 'l',
     xlab = "Year",
     ylab ="Total emissions from PM2.5 in the Baltimore City (thousands of tons)")

dev.off()