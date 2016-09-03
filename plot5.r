source("load_data.r")
library(ggplot2)

bcNEI <- subset(NEI, fips=="24510")
bcMotorNEI <- subset(bcNEI, type=="ON-ROAD")
emissions <- group_by_(bcMotorNEI, .dots=c("year")) %>%
    summarise(total_emission=sum(Emissions, na.rm=T))
qplot(year, total_emission, data=emissions, geom="line") +
    ggtitle("Changes of emissions from PM2.5 from motor vehicle sources") +
    ylab("Total PM2.5 emission (t)") +
    xlab("Year")

ggsave("plot5.png")
