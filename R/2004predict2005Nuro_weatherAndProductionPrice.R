library(RODBC);
channel = odbcConnect("agriculture", uid="sa", pwd="passw0rd");
market_banana = sqlQuery(channel, "select * from market_banana");
banana_production_price = sqlQuery(channel, "select * from banana_production_price");
weather = sqlQuery(channel, "select * from weather");
close(channel);


str(weather)
str(market_banana)

productionBanaDaily = read.xlsx(header=TRUE,file='BananaProductionDaily.xlsx',sheetIndex=1)
productionBanaDaily[,1]=NULL
str(productionBanaDaily)

weather2004 = weather[weather$date>='2004-01-01'&weather$date<='2004-12-31',]
v = c(1,2,6,8,9,13,14,15)
weather2004V2 = weather2004[,v]
head(weather2004V2)
str(weather2004V2)

productionBanaDaily2005 = productionBanaDaily[productionBanaDaily$date>='2005-01-01'&productionBanaDaily$date<='2005-12-31',]
head(productionBanaDaily2005)

market_banana2005 = market_banana[market_banana$date>='2005-01-01'&market_banana$date<='2005-12-31',]
year(market_banana2005$date) = year(market_banana2005$date) -1
head(market_banana2005)
a = c(1,6,7)
market_banana2005V2 = market_banana2005[,a]


banana_production_price2005 = banana_production_price[banana_production_price$date>='2005-01-01'&banana_production_price$date<='2005-12-31',]
year(banana_production_price2005$date) = year(banana_production_price2005$date) -1
head(banana_production_price2005)

library(lubridate)
year(productionBanaDaily2005$date) = year(productionBanaDaily2005$date) -1


tradeMerge = merge(banana_production_price2005,market_banana2005V2,by.x='date',all.x=TRUE)
tradeMergeV2 = merge(tradeMerge,weather2004V2,by.x='date',all.x=TRUE)
tradeMergeV3 = na.omit(merge(tradeMergeV2,productionBanaDaily2005,by.x='date',all.x=TRUE))
str(tradeMergeV3)
head(tradeMergeV3)


plot(tradeMergeV3$priceWufeng~tradeMergeV3$date,
     xlab = "Date",
     ylab = "priceWufeng",    
     type ="l"
)
points(x=tradeMergeV3$date,y=tradeMergeV3$avg_price,col='blue',type='l')


plot(tradeMergeV3$precp_da~tradeMergeV3$date,
     xlab = "Date",
     ylab = "trade",    
     type ="l"
)
head(tradeMergeV3)
tradeMergeV4 = tradeMergeV3[,-1]
head(tradeMergeV4)
str(tradeMergeV4)

tradeMergeV3 = merge(tradeMergeV2,productionBanaDaily2005,by.x='date',all.x=TRUE)

nor = function(e){
  x = (e-min(e))/(max(e)-min(e))
  x
}
dataRawNormalize = tradeMergeV4

for(i in 1:ncol(tradeMergeV4)){
  dataRawNormalize[,i] = nor(tradeMergeV4[,i])
}

head(dataRawNormalize)
str(dataRawNormalize)

odd = seq(1,305,2)
even = seq(2,305,2)

traindata = dataRawNormalize[odd,]
restdataRaw = dataRawNormalize[even,]
#weather
e = c(1,2,4,5,6,7,8,9,10)
restdataRaw = restdataRaw[,e]

testdataRun = restdataRaw[,-2]
testdatatarget = restdataRaw[,2]

head(restdataRaw)
str(dataRawNormalize)

library("neuralnet") 

net.model = neuralnet(avg_price ~ priceWufeng + air_temp + RH + precp_da + wind_speed_mean + sun + solar_rad + evap,
                      traindata, hidden=4, threshold=0.01) 

print(net.model) 
plot(net.model) 
#
results = compute(net.model, testdataRun) 

str(results)

head(results$net.result)
head(testdatatarget)

datee = as.Date(tradeMergeV3[even,1])

output = data.frame(datee,testdatatarget,results$net.result)

head(output)

colnames(output)[2]= 'Realdata'
colnames(output)[3]= 'predict'

write.xlsx(output,file='output.xlsx')

head(results$net.result)
str(results$net.result)

plot(output$Realdata~output$datee,
     xlab = "datee",
     ylab = "price",    
     type ="l"
)
points(x=output$date,y=output$predict,col='blue',type='l')



