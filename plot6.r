source("load_data.r")
library(ggplot2)

motorNEI <- subset(NEI, type=="ON-ROAD")
motorNEI <- subset(motorNEI, fips=="24510" | fips=="06037")

nameByFIPS <- function(fips){
    if(fips == "24510"){
        "Baltimore City"
    }else{
        "Los Angeles County"
    }
}

motorNEI$geoName <- sapply(motorNEI$fips, nameByFIPS)
emissions <- group_by_(motorNEI,  .dots=c("year", "geoName")) %>%
    summarise(total_emission=sum(Emissions, na.rm=T))

qplot(year, total_emission, data=emissions, geom=c("line")) +
    facet_wrap(~geoName, nrow=1) +
    ggtitle("Emission changes from PM2.5 from vehicle sources\nin Baltimor City and Los Angeles County") +
    ylab("Total PM2.5 emission (t)") +
    xlab("Year")

ggsave("plot6.png")
