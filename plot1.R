#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#calculate the total emission of years
emi_total<-tapply(NEI$Emissions,NEI$year,sum)

#plot the total emission with year
barplot(emi_total,xlab = 'Year',ylab = 'Emission(tons)',main='Total PM2.5 in US')
dev.copy(png,file='plot1_Total PM2.5 in US.png',height=480,width=480)
dev.off()