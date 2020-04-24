#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data 
cat<-SCC[as.character(SCC$Data.Category)%in%c('Point','Nonpoint','Onroad','Nonroad'),]
baltimoreNEI<-NEI[NEI$fips==24510,]
baltimoreNEI_cat<-merge(baltimoreNEI,cat,by='SCC')

#plot
library(ggplot2)
ggplot(baltimoreNEI_cat,aes(factor(year),Emissions))+
        geom_bar(stat='identity')+
        facet_grid(.~type)+
        labs(title='PM2.5 in Baltimore by type')+
        labs(x='Year',y='Emission(tons)')
dev.copy(png,file='plot3_PM2.5 in Baltimore by type.png',height=480,width=480)
dev.off()