#資料庫連檔案
library(lubridate)
library(RODBC);
channel = odbcConnect("agriculture", uid="sa", pwd="passw0rd");

market_persimmon = sqlQuery(channel, "select * from market_persimmon");
persimmon_production_price = sqlQuery(channel, "select * from persimmon_production_price");
weather = sqlQuery(channel, "select * from weather");

close(channel);
#檢查屬性
str(persimmon_production_price)
head(persimmon_production_price)
##############特別需要屬性溫差新增,
weather[,22] = weather[,3]-weather[,4]
colnames(weather)[22] = 'tempdiff'

coryear = data.frame()
#用迴圈跑所有時間
for(i in 2004:2014){  
  #迴圈變數命名
  startday = paste(i,'-01-01',sep="")  
  enday = paste(i,'-12-31',sep="")  
  proname = paste(i,'persimmon_production_price',sep="") 
  markname = paste(i,'market_persimmon',sep="") 
  
  #迴圈時間取得
  proname = persimmon_production_price[persimmon_production_price$date>=startday & persimmon_production_price$date<=enday,]
  markname = market_persimmon[market_persimmon$date>=startday & market_persimmon$date<=enday,]
 


#先將市場價格及產地價格時間減至所需生長區間
year(markname$date) = year(markname$date)-1
year(proname$date) = year(proname$date)-1

#合併氣候與市場并移除NULL值
MarketPriceCorpersimmon = na.omit(merge(weather,markname,by.x='date',all.x=TRUE))

#氣候與平均價格相關係數
TempPrice = cor(MarketPriceCorpersimmon$avg_price,MarketPriceCorpersimmon$air_temp)
dew_pointPrice = cor(MarketPriceCorpersimmon$avg_price,MarketPriceCorpersimmon$dew_point)
RHPrice = cor(MarketPriceCorpersimmon$avg_price,MarketPriceCorpersimmon$RH)
precp_daPrice = cor(MarketPriceCorpersimmon$avg_price,MarketPriceCorpersimmon$precp_da)
wind_speed_meanPrice = cor(MarketPriceCorpersimmon$avg_price,MarketPriceCorpersimmon$wind_speed_mean)
sunPrice = cor(MarketPriceCorpersimmon$avg_price,MarketPriceCorpersimmon$sun)
solar_radPrice = cor(MarketPriceCorpersimmon$avg_price,MarketPriceCorpersimmon$solar_rad)
evapPrice = cor(MarketPriceCorpersimmon$avg_price,MarketPriceCorpersimmon$evap)

tempdiffPrice = cor(MarketPriceCorpersimmon$avg_price,MarketPriceCorpersimmon$tempdiff)

#氣候與交易量相關係數
air_temptrade= cor(MarketPriceCorpersimmon$trade,MarketPriceCorpersimmon$air_temp)
dew_pointtrade = cor(MarketPriceCorpersimmon$trade,MarketPriceCorpersimmon$dew_point)
RHPrice = cor(MarketPriceCorpersimmon$trade,MarketPriceCorpersimmon$RH)
precp_datrade = cor(MarketPriceCorpersimmon$trade,MarketPriceCorpersimmon$precp_da)
wind_speed_meantrade = cor(MarketPriceCorpersimmon$trade,MarketPriceCorpersimmon$wind_speed_mean)
suntrade = cor(MarketPriceCorpersimmon$trade,MarketPriceCorpersimmon$sun)
solar_radtrade = cor(MarketPriceCorpersimmon$trade,MarketPriceCorpersimmon$solar_rad)
evaptrade = cor(MarketPriceCorpersimmon$trade,MarketPriceCorpersimmon$evap)

tempdifftrade = cor(MarketPriceCorpersimmon$trade,MarketPriceCorpersimmon$tempdiff)

#合併氣候與產價資料並忽略NULL值
ProductionPriceCorpersimmon = na.omit(merge(weather,proname,by.x='date',all.x=TRUE))
#str(ProductionPriceCorpersimmon)

#氣候與產價相關係數1
air_tempPRprice1= cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$air_temp)
dew_pointPRprice1 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$dew_point)
RHPRprice1 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$RH)
precp_daPRprice1 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$precp_da)
wind_speed_meanPRprice1 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$wind_speed_mean)
sunPRprice1 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$sun)
solar_radPRprice1 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$solar_rad)
evapPRprice1 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$evap)

tempdiffPRprice1 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$tempdiff)


#氣候與產價相關係數2,如果有第二個產地，就要用
#air_tempPRprice2= cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$air_temp)
#dew_pointPRprice2 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$dew_point)
#RHPRprice2 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$RH)
#precp_daPRprice2 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$precp_da)
#wind_speed_meanPRprice2 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$wind_speed_mean)
#sunPRprice2 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$sun)
#solar_radPRprice2 = cor(pricePeace$pricePeace,ProductionPriceCorpersimmon$solar_rad)
#evapPRprice2 = cor(ProductionPriceCorpersimmon$pricePeace,ProductionPriceCorpersimmon$evap)

#如果沒有第二個產地就用這個
air_tempPRprice2= 0
dew_pointPRprice2 = 0
RHPRprice2 = 0
precp_daPRprice2 = 0
wind_speed_meanPRprice2 = 0
sunPRprice2 = 0
solar_radPRprice2 =0
evapPRprice2 = 0




#所有相關係數合併
persimmonCorlationYear = paste("persimmonCorlationYear",i,sep="")

persimmonCorlationYear = cbind(TempPrice,dew_pointPrice,RHPrice,precp_daPrice,wind_speed_meanPrice,sunPrice,solar_radPrice,evapPrice,
                           air_temptrade,dew_pointtrade,RHPrice,precp_datrade,wind_speed_meantrade,suntrade,solar_radtrade,evaptrade,
                           air_tempPRprice1,dew_pointPRprice1,RHPRprice1,precp_daPRprice1,wind_speed_meanPRprice1,sunPRprice1,solar_radPRprice1,
                           evapPRprice1,air_tempPRprice2,dew_pointPRprice2,RHPRprice2,precp_daPRprice2,wind_speed_meanPRprice2,sunPRprice2,solar_radPRprice2,
                           evapPRprice2,tempdiffPrice,tempdifftrade,tempdiffPRprice1
)
#所有年相關係數合併
coryear = rbind(coryear,persimmonCorlationYear)

}
#迴圈命名
str(coryear)
for(i in 1:nrow(coryear)){
  names = paste(i+2003,'year',sep="")  
  rownames(coryear)[i] = names
  
}

#寫出檔案
library(xlsx)
#write.xlsx(coryear,file='coryear.xlsx')


