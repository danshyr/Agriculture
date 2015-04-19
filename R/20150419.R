library("neuralnet") 

library(RODBC);
channel = odbcConnect("agriculture", uid="sa", pwd="passw0rd");
market_banana = sqlQuery(channel, "select * from market_banana");
banana_production_price = sqlQuery(channel, "select * from banana_production_price");
price_index = sqlQuery(channel, "select * from price_index");
production = sqlQuery(channel, "select * from production");
typhoon = sqlQuery(channel, "select * from typhoon");
weather = sqlQuery(channel, "select * from weather");
close(channel);

str(market_banana)
str(banana_production_price)
str(price_index)
str(production)
str(weather)
#str(typhoon)

summary(market_banana)
summary(banana_production_price)
summary(price_index)
summary(production)
summary(weather)

corAvgPriceTrade = cor(market_banana$avg_price,market_banana$trade) 
corAvgPriceProductionPrice = cor(market_banana$avg_price,banana_production_price$priceWufeng)


library(xlsx)

install.packages('rJava', repos='http://www.rforge.net/') # 裝 rjJava時有問題,所以寫這個程式
Sys.getenv("JAVA_HOME")
if (Sys.getenv("JAVA_HOME")!="")
  Sys.setenv(JAVA_HOME="")

priceMerge = merge(banana_production_price,market_banana,by.x='date',all.x=TRUE)
priceMergeV2 = merge(priceMerge,price_index,by.x='date',all.x=TRUE)
priceMergeV3 = merge(priceMergeV2,weather,by.x='date',all.x=TRUE)

head(priceMergeV3.1)
v = c(1,2,7,8,15,23)
priceMergeV3.1 = priceMergeV3[,v]

priceMergeV3.2 = na.omit(priceMergeV3[])
  
write.xlsx(priceMerge,file='priceMerge.xlsx')

priceMerge2 = na.omit(priceMerge)
write.xlsx(priceMerge2,file='priceMerge2.xlsx')
str(priceMerge2)
head(priceMerge2)






str(weather)

productionBanana= production[production$fruits=='香蕉',]


plot(productionBanana$production_total~productionBanana$year,
     xlab = "Date",
     ylab = "production_total",    
     type ="l"
)
######################################################
plot(weather$air_temp~weather$date,
     xlab = "Date",
     ylab = "sun",    
     type ="l"
)
plot(weather$RH~weather$date,
     xlab = "Date",
     ylab = "sun",    
     type ="l"
)
plot(weather$precp_da~weather$date,
      xlab = "Date",
      ylab = "sun",    
      type ="l"
)
plot(weather$ sun~weather$date,
     xlab = "Date",
     ylab = "sun",    
     type ="l"
)
plot(weather$solar_rad~weather$date,
     xlab = "Date",
     ylab = "sun",    
     type ="l"
)
plot(weather$dew_point~weather$date,
     xlab = "Date",
     ylab = "sun",    
     type ="l"
)
##############################
plot(market_banana$trade~market_banana$date,
     xlab = "Date",
     ylab = "fruit_original",    
     type ="l"
)

plot(price_index$fruit_original~price_index$date,
     xlab = "Date",
     ylab = "fruit_original",    
     type ="l"
)

plot(priceMerge2$avg_price~priceMerge2$date,
     xlab = "Date",
     ylab = "price",    
     type ="l"
     )

plot(priceMerge2$priceWufeng~priceMerge2$date,
     xlab = "Date",
     ylab = "price",    
     type ="l"
)


