#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data 
pos_Comb<-grepl('Comb',SCC$EI.Sector)
pos_Coal<-grepl('Coal',SCC$EI.Sector)
Comb_coal<-SCC[pos_Coal&pos_Comb,]
Comb_coal_emi<-merge(Comb_coal,NEI,by='SCC')
Comb_coal_emi_year<-tapply(Comb_coal_emi$Emissions,Comb_coal_emi$year,sum)

#plot
barplot(Comb_coal_emi_year,xlab = 'Year',ylab = 'Emission(tons)',main='Coal Combustion-related Emission in US')
dev.copy(png,file='plot4_Coal Combustion-related Emission in US.png',height=480,width=480)
dev.off()