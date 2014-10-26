unzip('exdata-data-NEI_data.zip')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

target_scc_level2 <- unique(SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case=T), ]$SCC.Level.Two)

target_SCC2 <- SCC[SCC$SCC.Level.Two %in% target_scc_level2, ]$SCC

png('plot5.png')

ggplot(NEI[(NEI$SCC %in% target_SCC2 & NEI$fips == "24510"), ]) +
    aes(year, Emissions) + 
    stat_summary(fun.y = "sum", geom = "line")

dev.off()