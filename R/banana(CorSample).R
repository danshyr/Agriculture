#資料庫連檔案
library(lubridate)
library(RODBC);
channel = odbcConnect("agriculture", uid="sa", pwd="passw0rd");

market_banana = sqlQuery(channel, "select * from market_banana");
banana_production_price = sqlQuery(channel, "select * from banana_production_price");
weather = sqlQuery(channel, "select * from weather");

close(channel);

str(banana_production_price)
head(weather)
##############Banana
MarketPriceCorbanana = na.omit(merge(weather,market_banana,by.x='date',all.x=TRUE))

TempPrice = cor(MarketPriceCorbanana$avg_price,MarketPriceCorbanana$air_temp)
dew_pointPrice = cor(MarketPriceCorbanana$avg_price,MarketPriceCorbanana$dew_point)
RHPrice = cor(MarketPriceCorbanana$avg_price,MarketPriceCorbanana$RH)
precp_daPrice = cor(MarketPriceCorbanana$avg_price,MarketPriceCorbanana$precp_da)
wind_speed_meanPrice = cor(MarketPriceCorbanana$avg_price,MarketPriceCorbanana$wind_speed_mean)
sunPrice = cor(MarketPriceCorbanana$avg_price,MarketPriceCorbanana$sun)
solar_radPrice = cor(MarketPriceCorbanana$avg_price,MarketPriceCorbanana$solar_rad)
evapPrice = cor(MarketPriceCorbanana$avg_price,MarketPriceCorbanana$evap)

air_temptrade= cor(MarketPriceCorbanana$trade,MarketPriceCorbanana$air_temp)
dew_pointtrade = cor(MarketPriceCorbanana$trade,MarketPriceCorbanana$dew_point)
RHPrice = cor(MarketPriceCorbanana$trade,MarketPriceCorbanana$RH)
precp_datrade = cor(MarketPriceCorbanana$trade,MarketPriceCorbanana$precp_da)
wind_speed_meantrade = cor(MarketPriceCorbanana$trade,MarketPriceCorbanana$wind_speed_mean)
suntrade = cor(MarketPriceCorbanana$trade,MarketPriceCorbanana$sun)
solar_radtrade = cor(MarketPriceCorbanana$trade,MarketPriceCorbanana$solar_rad)
evaptrade = cor(MarketPriceCorbanana$trade,MarketPriceCorbanana$evap)

productionPriceCorbanana = na.omit(merge(market_banana,banana_production_price,by.x='date',all.x=TRUE))
Productionavg_price = cor(productionPriceCorbanana$avg_price,productionPriceCorbanana$priceWufeng)
Productionavg_price2 = 0


avg_pricetrade =  cor(productionPriceCorbanana$avg_price,productionPriceCorbanana$trade)
productionTrade = cor(productionPriceCorbanana$priceWufeng,productionPriceCorbanana$trade)
productionTrade2 = 0


BananaCorlation = cbind(TempPrice,dew_pointPrice,RHPrice,precp_daPrice,wind_speed_meanPrice,sunPrice,solar_radPrice,evapPrice,
                        air_temptrade,dew_pointtrade,RHPrice,precp_datrade,wind_speed_meantrade,suntrade,solar_radtrade,evaptrade,
                        avg_pricetrade,Productionavg_price,Productionavg_price2,productionTrade,productionTrade2
                        )
  






