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
close(channel);
#檢察屬性
str(ponkan_production_price)
head(ponkan_production_price)
#建立空表單
bindtemp = data.frame()

#用2003>2013迴圈跑天氣
for(i in 2003:2013){
  #檔名為年分+檔案名稱  
  weathername = paste("weather",i,sep="")
  #年份區間
  startday = paste(i,'-01-01',sep="")  
  enday = paste(i,'-12-31',sep="")  
  #將檔名及時間結合再一起
  weathername = weather[weather$date>=startday & weather$date<=enday,]
  #選要的欄位
  w = c(1,2) 
  weathername = weathername[,w]  
  #用2004>2014迴圈跑市場與產地資料
  for(j in 2004:2014){
    #命名欄位
    producname = paste("ponkan_production_price",j,sep="")
    marketname = paste("market_ponkan",j,sep="")  
    totalname = paste("total",j,sep="") 
    #年分區間
    startday = paste(j,'-01-01',sep="")  
    enday = paste(j,'-12-31',sep="")  
    #將檔名及時間結合再一起
    marketname = market_ponkan[market_ponkan$date>=startday & market_ponkan$date<=enday,]
    #選取需要的欄位
    m = c(1,7)
    marketname = marketname[,m]
    #年分-1使時間一致
    year(marketname$date) = year(marketname$date)-1 
    #將檔名及時間結合再一起
    producname = na.omit(ponkan_production_price[ponkan_production_price$date>=startday & ponkan_production_price<=enday,])
    #年分-1使時間一致
    year(producname$date) = year(producname$date)-1 
    #處理-1值
    producname$priceNovosti[producname$priceNovosti==-1]= 0
    producname$priceIshioka[producname$priceIshioka==-1]= 0
    
    #合併欄位
    merge1 = merge(weathername,producname,by.x='date',all.x=TRUE)
    merge2 = merge(merge1,marketname,by.x='date',all.x=TRUE)
    #最後欄位在重命名
    totalname = na.omit(merge2)
    
   #因為跑很多空表單，所以用判斷式忽略空欄位
    if (nrow(totalname)>0){
      str(totalname)
      bindtemp= rbind(bindtemp,totalname)  
    }    
  } 
  
}
#檢察屬性
str(bindtemp)
#寫出檔案確認內容
#write.xlsx(bindtemp,file='bindtemp.xlsx')

#正規化公式
nor = function(e){
  x = (e-min(e))/(max(e)-min(e))
  x
}
#這邊用手動打日期來畫圖，因為一次只能畫一張
bindtemp2=bindtemp[bindtemp$date>='2003-01-01' & bindtemp$date<='2003-12-31',]
str(bindtemp2)
dataRawNormalize = bindtemp2
dataRawNormalize = dataRawNormalize[,-1]
#正規化
for(i in 1:ncol(dataRawNormalize)){
  dataRawNormalize[,i] = nor(dataRawNormalize[,i])
}

#重新將日期欄加回去成新的data.frame
dateT = bindtemp2[,1]
dataRawNormalizeponkan = data.frame(dateT,dataRawNormalize)

#畫圖確認
#boxplot(ponkanjoin4$avg_price~ponkanjoin4$air_temp ,ylab='avg_price',xlab='air_temp')
#abline(v=105,lwd=3,col='red')

plot(dataRawNormalizeponkan$trade~dataRawNormalizeponkan$date,
     xlab = "date",
     ylab = "trade",    
     type ="l"
)
#增加其他參數確認相關性
points(x=dataRawNormalizeponkan$date,y=dataRawNormalizeponkan$priceNovosti,col='blue',type='l')
points(x=dataRawNormalizeponkan$date,y=dataRawNormalizeponkan$priceIshioka,col='red',type='l')
#points(x=dataRawNormalizeponkan$date,y=dataRawNormalizeponkan$avg_price,col='red',type='l')
legend("topright",c('trade','priceNovosti','priceIshioka'),cex = 0.75,lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))




