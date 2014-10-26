unzip('exdata-data-NEI_data.zip')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Compare emissions from motor vehicle sources in Baltimore City 
## with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

target_scc_level2 <- unique(SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case=T), ]$SCC.Level.Two)

target_SCC2 <- SCC[SCC$SCC.Level.Two %in% target_scc_level2, ]$SCC

png('plot6.png')


## motor vehicles in Baltimore or LA
data <- NEI[(NEI$SCC %in% target_SCC2 & NEI$fips %in% c("24510", "06037")), ]
data$fips <- as.factor(data$fips)
levels(data$fips) <- c('Los Angeles County, California', 'Baltimore City')

ggplot(data) +
    aes(year, Emissions) + 
    stat_summary(fun.y = "sum", geom = "line") + 
    facet_grid(.~fips)

dev.off()