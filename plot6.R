#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data 
pos_veh<-SCC[grepl('Vehicle',SCC$SCC.Level.Two),]
emi_veh<-merge(pos_veh,NEI,by='SCC')
emi_veh_bal<-emi_veh[emi_veh$fips%in%c('24510','06037'),]
fips.labs<-c('Los Angeles','Baltimore')
names(fips.labs)<-c('06037','24510')

#plot
library(ggplot2)
ggplot(emi_veh_bal,aes(factor(year),Emissions))+
        geom_bar(stat='identity')+
        facet_grid(.~fips,labeller = labeller(fips=fips.labs))+
        labs(title='Vehicle-related Emission in Los Angeles and Baltimore')+
        labs(x='Year',y='Emission(tons)')
dev.copy(png,file='plot6_Vehicle-related Emission in Los Angeles and Baltimore.png',height=480,width=480)
dev.off()