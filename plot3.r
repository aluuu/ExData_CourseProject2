source("load_data.r")
library(ggplot2)

bcNEI <- subset(NEI, fips=="24510")
emissions <- group_by_(bcNEI,  .dots=c("year", "type")) %>%
    summarise(total_emission=sum(Emissions, na.rm=T))
qplot(year, total_emission, data=emissions, geom="line")+
    facet_wrap(~type, nrow=2) +
    ggtitle("Comparison of emission changes from PM2.5\nin Baltimore City, Maryland by source") +
    ylab("Total PM2.5 emission (t)") +
    xlab("Year")

ggsave("plot3.png")
