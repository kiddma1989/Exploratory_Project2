#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#calculate the total emission of years in Baltimore
emi_bal<-NEI[NEI$fips==24510,c('Emissions','year')]
emi_bal_year<-tapply(emi_bal$Emissions,emi_bal$year,sum)

#plot the total emission with year
barplot(emi_bal_year,xlab = 'Year',ylab = 'Emission(tons)',main='Total PM2.5 Emission in Baltimore')
dev.copy(png,file='plot2_Total PM2.5 Emission in Baltimore.png',height=480,width=480)
dev.off()