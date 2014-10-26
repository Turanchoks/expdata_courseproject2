unzip('exdata-data-NEI_data.zip')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

png('plot3.png')

ggplot(NEI[NEI$fips == "24510",]) +
    aes(year, Emissions) +
    stat_summary(fun.y = "sum", geom = "line") + 
    facet_grid(.~type)

dev.off()