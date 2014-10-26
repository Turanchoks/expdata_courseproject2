unzip('exdata-data-NEI_data.zip')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Across the United States, 
## how have emissions from coal combustion-related sources changed from 1999–2008?
library(ggplot2)

target_SCC <- SCC$SCC[grepl("Coal",SCC$EI.Sector)]

png('plot4.png')

ggplot(NEI[NEI$SCC %in% target_SCC, ]) +
    aes(year, Emissions) + 
    stat_summary(fun.y = "sum", geom = "line")

dev.off()