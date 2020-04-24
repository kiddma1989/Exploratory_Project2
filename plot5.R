#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data 
pos_veh<-SCC[grepl('Vehicle',SCC$SCC.Level.Two),]
emi_veh<-merge(pos_veh,NEI,by='SCC')
emi_veh_bal<-emi_veh[emi_veh$fips==24510,]
emi_veh_bal_year<-tapply(emi_veh_bal$Emissions,emi_veh_bal$year,sum)

#plot
barplot(emi_veh_bal_year,xlab = 'Year',ylab = 'Emission(tons)',main='Vehicle-related Emission in Baltimore')
dev.copy(png,file='plot5_Vehicle-related Emission in Baltimore.png',height=480,width=480)
dev.off()