source("load_data.r")
library(ggplot2)

SCC <- data.frame(readRDS("./data/Source_Classification_Code.rds"))
combustionSCC <- SCC[grep("Combustion", SCC$SCC.Level.One),]
combustionNEI <- merge(NEI, combustionSCC, by.x="SCC", by.y="SCC")
emissions <- group_by_(combustionNEI,  .dots=c("year")) %>% summarise(total_emission=sum(Emissions, na.rm=T))
qplot(year, total_emission, data=emissions, geom=c("line")) +
  ggtitle("Comparison of emissions from PM2.5\nfrom coal combustion-related sources") +
  ylab("Total PM2.5 emission (t)") +
  xlab("Year")

ggsave("plot4.png")
