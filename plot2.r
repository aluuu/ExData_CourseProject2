source("load_data.r")

bcNEI <- subset(NEI, fips=="24510")
emission_by_year <- summarise(group_by(bcNEI, year), sum=sum(Emissions, na.rm=T))

png(filename="./plot2.png")
plot(emission_by_year,
     ylab="Total PM2.5 emission (t)",
     xlab="Year",
     ylim=range(0, max(emission_by_year$sum)),
     type="l",
     yaxt='n',
     xaxt = 'n')
axis(side = 1, at = emission_by_year$year)
axis(side = 2, at = seq(0, max(emission_by_year$sum), length.out=5))
title(main = "Decreasing emissions from PM2.5 in Baltimore City, Maryland")
dev.off()
