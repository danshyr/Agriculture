# RJava bug 解決
install.packages('rJava', repos='http://www.rforge.net/')   
Sys.getenv("JAVA_HOME")
if (Sys.getenv("JAVA_HOME")!="")
  Sys.setenv(JAVA_HOME="")
#資料庫連檔案
library(lubridate)
library(RODBC);
channel = odbcConnect("agriculture", uid="sa", pwd="passw0rd");
market_ponkan = sqlQuery(channel, "select * from market_ponkan");
ponkan_production_price = sqlQuery(channel, "select * from ponkan_production_price");
weather = sqlQuery(channel, "select * from weather");
ponkanProductionDaily =  sqlQuery(channel, "select * from ponkanProductionDaily");
close(channel);

#屬性檢查
str(market_ponkan)
table(ponkanProductionDaily$date)
head(ponkan_production_price)

#取得2013年氣候資料,以向量去取所要分析的欄位
weather2013 = weather[weather$date>='2013-01-01' & weather$date<='2013-12-31',]
w = c(1,2,3,4)
weather2013V2 = weather2013[,w]
#取得2014年香蕉市場資料
market_ponkan2014 = market_ponkan[market_ponkan$date>='2014-01-01' & market_ponkan$date<='2014-12-31',]
m = c(1,3,4,5,6)
market_ponkan2014V2 = market_ponkan2014[,m]
#將2014年香蕉市場資料年分減1以利合併
year(market_ponkan2014V2$date) = year(market_ponkan2014V2$date)-1
#取得2014年香蕉產地價格
ponkan_production_price2014 = ponkan_production_price[ponkan_production_price$date>='2014-01-01' & ponkan_production_price<='2014-12-31',]
#將2014年香蕉產地價格料年分減1以利合併
year(ponkan_production_price2014$date) = year(ponkan_production_price2014$date)-1
#取得2014年香蕉產量資料
ponkanProductionDaily2014 = ponkanProductionDaily[ponkanProductionDaily$date>='2014-01-01' & ponkanProductionDaily$date<='2014-12-31',]
year(ponkanProductionDaily2014$date) = year(ponkanProductionDaily2014$date)-1
#檢查署性
str(weather2013V2)
head(weather2013V2)
#處理-1資料
ponkan_production_price2014$pricePeace[ponkan_production_price2014$pricePeace==-1]= 0

#合併所有欄位,並去除NULL欄位(na,omit)
ponkanjoin1 = merge(weather2013V2,ponkan_production_price2014,by.x='date',all.x=TRUE)
ponkanjoin2 = merge(ponkanjoin1,market_ponkan2014V2,by.x='date',all.x=TRUE)
#ponkanjoin3 = merge(ponkanjoin2,ponkanProductionDaily2014,by.x='date',all.x=TRUE)
ponkanjoin4 = na.omit(ponkanjoin2)


str(ponkanjoin4)
head(ponkanjoin4)

head(ponkanjoin4$priceWaipu)
#write.xlsx(ponkanjoin4,file='ponkanjoin4.xlsx')

#正規化數值,須先將日期欄位去掉
nor = function(e){
  x = (e-min(e))/(max(e)-min(e))
  x
}

dataRawNormalize = ponkanjoin4
dataRawNormalize = dataRawNormalize[,-1]

for(i in 1:ncol(dataRawNormalize)){
  dataRawNormalize[,i] = nor(dataRawNormalize[,i])
}
#重新將日期欄加回去成新的data.frame
dateT = ponkanjoin4[,1]
dataRawNormalizeponkan = data.frame(dateT,dataRawNormalize)

str(dataRawNormalizeponkan)
head(dataRawNormalizeponkan)

#畫圖確認

boxplot(ponkanjoin4$avg_price~ponkanjoin4$air_temp ,ylab='avg_price',xlab='air_temp')


abline(v=105,lwd=3,col='red')


#plot(dataRawNormalizeponkan$air_temp~dataRawNormalizeponkan$date,
#   xlab = "date",
#     ylab = "air_temp",    
#     type ="l"
#)
#增加其他參數確認相關性
#points(x=dataRawNormalizeponkan$date,y=dataRawNormalizeponkan$pricePeace,col='blue',type='l')
#points(x=dataRawNormalizeponkan$date,y=dataRawNormalizeponkan$avg_price,col='red',type='l')
#points(x=dataRawNormalizeponkan$date,y=dataRawNormalizeponkan$LonganProductionDaily,col='green',type='l')


