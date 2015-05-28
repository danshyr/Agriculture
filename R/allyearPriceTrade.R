# 香蕉歷年價格趨勢圖

#資料庫連檔案
library(lubridate)
library(RODBC);
channel = odbcConnect("agriculture", uid="sa", pwd="passw0rd");
market_banana = sqlQuery(channel, "select * from market_banana");
weather = sqlQuery(channel, "select * from weather");
close(channel);

#檢察屬性
weather$date = as.Date(weather$date)
str(weather)
head(weather)

market_banana$date = as.Date(market_banana$date,"%Y-%m-%d")
str(market_banana)
head(market_banana)

# 香蕉歷年top_price ==============================================================================
# 2004top_price

#區間值 準備將資料bind
MB2004=market_banana[which(market_banana$date >= '2004-01-01' & market_banana$date < '2004-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2004$date)
m=c(3,4) 
MB=MB2004[,m]
m2004=matrix(regular)
banana_topPrice1=cbind(m2004,MB)  
names(banana_topPrice1)=c("date","top_price2004")
M1=c(1,2)
BT1=banana_topPrice1[,M1]
#write.xlsx(bindtemp1,file='bindtemp1.xlsx')  #確認資料寫出來看一下
head(BT1)
str(BT)


# 2005top_price
MB2005=market_banana[which(market_banana$date >= '2005-01-01' & market_banana$date < '2005-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2005$date)
m=c(3,4) # 3top_price
MB=MB2005[,m]
m2005=matrix(regular)
banana_topPrice2=cbind(m2005,MB)  
names(banana_topPrice2)=c("date","top_price2005")
M1=c(1,2)
BT2=banana_topPrice2[,M1]
head(BT2)

# 2006top_price
MB2006=market_banana[which(market_banana$date >= '2006-01-01' & market_banana$date < '2006-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2006$date)
m=c(3,4) # 3top_price
MB=MB2006[,m]
m2006=matrix(regular)
banana_topPrice3=cbind(m2006,MB)  
names(banana_topPrice3)=c("date","top_price2006")
M1=c(1,2)
BT3=banana_topPrice3[,M1]
head(BT3)

# 2007top_price

MB2007=market_banana[which(market_banana$date >= '2007-01-01' & market_banana$date < '2007-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2007$date)
m=c(3,4) # 3top_price
MB=MB2007[,m]
m2007=matrix(regular)
banana_topPrice4=cbind(m2007,MB)  
names(banana_topPrice4)=c("date","top_price2007")
M1=c(1,2)
BT4=banana_topPrice4[,M1]
head(BT4)


# 2008top_price

MB2008=market_banana[which(market_banana$date >= '2008-01-01' & market_banana$date < '2008-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2008$date)
m=c(3,4) # 3top_price
MB=MB2008[,m]
m2008=matrix(regular)
banana_topPrice5=cbind(m2008,MB)  
names(banana_topPrice5)=c("date","top_price2008")
M1=c(1,2)
BT5=banana_topPrice5[,M1]
head(BT5)

# 2009top_price

MB2009=market_banana[which(market_banana$date >= '2009-01-01' & market_banana$date < '2009-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2009$date)
m=c(3,4) # 3top_price
MB=MB2009[,m]
m2009=matrix(regular)
banana_topPrice6=cbind(m2009,MB)  
names(banana_topPrice6)=c("date","top_price2009")
M1=c(1,2)
BT6=banana_topPrice6[,M1]
head(BT6)

# 2010top_price

MB2010=market_banana[which(market_banana$date >= '2010-01-01' & market_banana$date < '2010-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2010$date)
m=c(3,4) # 3top_price
MB=MB2010[,m]
m2010=matrix(regular)
banana_topPrice7=cbind(m2010,MB)  
names(banana_topPrice7)=c("date","top_price2010")
M1=c(1,2)
BT7=banana_topPrice7[,M1]
head(BT7)

# 2011top_price

MB2011=market_banana[which(market_banana$date >= '2011-01-01' & market_banana$date < '2011-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2011$date)
m=c(3,4) # 3top_price
MB=MB2011[,m]
m2011=matrix(regular)
banana_topPrice8=cbind(m2011,MB)  
names(banana_topPrice8)=c("date","top_price2011")
M1=c(1,2)
BT8=banana_topPrice8[,M1]
head(BT8)

# 2012top_price

MB2012=market_banana[which(market_banana$date >= '2012-01-01' & market_banana$date < '2012-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2012$date)
m=c(3,4) # 3top_price
MB=MB2012[,m]
m2012=matrix(regular)
banana_topPrice9=cbind(m2012,MB)  
names(banana_topPrice9)=c("date","top_price2012")
M1=c(1,2)
BT9=banana_topPrice9[,M1]
head(BT9)

# 2013top_price

MB2013=market_banana[which(market_banana$date >= '2013-01-01' & market_banana$date < '2013-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2013$date)
m=c(3,4) # 3top_price
MB=MB2013[,m]
m2013=matrix(regular)
banana_topPrice11=cbind(m2013,MB)  
names(banana_topPrice11)=c("date","top_price2013")
M1=c(1,2)
BT10=banana_topPrice11[,M1]
head(BT10)

# 2014top_price


MB2014=market_banana[which(market_banana$date >= '2014-01-01' & market_banana$date < '2014-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2014$date)
m=c(3,4) # 3top_price
MB=MB2014[,m]
m2014=matrix(regular)
banana_topPrice10=cbind(m2014,MB)  
names(banana_topPrice10)=c("date","top_price2014")
M1=c(1,2)
BT11=banana_topPrice10[,M1]
head(BT11)


#合併欄位
bananaTOP1 = merge(BT1,BT2,by.x='date',all.x=TRUE)
head(bananaTOP1)
bananaTOP2 = merge(bananaTOP1,BT3,by.x='date',all.x=TRUE)
head(bananaTOP2)
bananaTOP3 = merge(bananaTOP2,BT4,by.x='date',all.x=TRUE)
head(bananaTOP3)
bananaTOP4 = merge(bananaTOP3,BT5,by.x='date',all.x=TRUE)
head(bananaTOP4)
bananaTOP5 = merge(bananaTOP4,BT6,by.x='date',all.x=TRUE)
head(bananaTOP5)
bananaTOP6 = merge(bananaTOP5,BT7,by.x='date',all.x=TRUE)
head(bananaTOP6)
bananaTOP7 = merge(bananaTOP6,BT8,by.x='date',all.x=TRUE)
head(bananaTOP7)
bananaTOP8 = merge(bananaTOP7,BT9,by.x='date',all.x=TRUE)
head(bananaTOP8)
bananaTOP9 = merge(bananaTOP8,BT10,by.x='date',all.x=TRUE)
head(bananaTOP9)
bananaTopPrice= merge(bananaTOP9,BT11,by.x='date',all.x=TRUE)
head(bananaTopPrice)

write.csv(bananaTopPrice,file='bananaTopPrice.csv')  #確認資料寫出來看一下

#香蕉歷年down_price 以下同理 將數值代換即可 =============================================================== 

# 2004down_price

#區間值 準備將資料bind
MB2004=market_banana[which(market_banana$date >= '2004-01-01' & market_banana$date < '2004-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2004$date)
m=c(5,6) # down_price
MB=MB2004[,m]
m2004=matrix(regular)
banana_topPrice1=cbind(m2004,MB)  
names(banana_topPrice1)=c("date","down_price2004")
M1=c(1,2)
BT1=banana_topPrice1[,M1]
#write.xlsx(bindtemp1,file='bindtemp1.xlsx')  #確認資料寫出來看一下
head(BT1)
str(BT)


# 2005down_price
MB2005=market_banana[which(market_banana$date >= '2005-01-01' & market_banana$date < '2005-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2005$date)
m=c(5,6) # 3down_price
MB=MB2005[,m]
m2005=matrix(regular)
banana_topPrice2=cbind(m2005,MB)  
names(banana_topPrice2)=c("date","down_price2005")
M1=c(1,2)
BT2=banana_topPrice2[,M1]
head(BT2)

# 2006down_price
MB2006=market_banana[which(market_banana$date >= '2006-01-01' & market_banana$date < '2006-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2006$date)
m=c(5,6) # 3down_price
MB=MB2006[,m]
m2006=matrix(regular)
banana_topPrice3=cbind(m2006,MB)  
names(banana_topPrice3)=c("date","down_price2006")
M1=c(1,2)
BT3=banana_topPrice3[,M1]
head(BT3)

# 2007down_price

MB2007=market_banana[which(market_banana$date >= '2007-01-01' & market_banana$date < '2007-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2007$date)
m=c(5,6) # 3down_price
MB=MB2007[,m]
m2007=matrix(regular)
banana_topPrice4=cbind(m2007,MB)  
names(banana_topPrice4)=c("date","down_price2007")
M1=c(1,2)
BT4=banana_topPrice4[,M1]
head(BT4)


# 2008down_price

MB2008=market_banana[which(market_banana$date >= '2008-01-01' & market_banana$date < '2008-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2008$date)
m=c(5,6) # 3down_price
MB=MB2008[,m]
m2008=matrix(regular)
banana_topPrice5=cbind(m2008,MB)  
names(banana_topPrice5)=c("date","down_price2008")
M1=c(1,2)
BT5=banana_topPrice5[,M1]
head(BT5)

# 2009down_price

MB2009=market_banana[which(market_banana$date >= '2009-01-01' & market_banana$date < '2009-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2009$date)
m=c(5,6) # 3down_price
MB=MB2009[,m]
m2009=matrix(regular)
banana_topPrice6=cbind(m2009,MB)  
names(banana_topPrice6)=c("date","down_price2009")
M1=c(1,2)
BT6=banana_topPrice6[,M1]
head(BT6)

# 2010down_price

MB2010=market_banana[which(market_banana$date >= '2010-01-01' & market_banana$date < '2010-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2010$date)
m=c(5,6) # 3down_price
MB=MB2010[,m]
m2010=matrix(regular)
banana_topPrice7=cbind(m2010,MB)  
names(banana_topPrice7)=c("date","down_price2010")
M1=c(1,2)
BT7=banana_topPrice7[,M1]
head(BT7)

# 2011down_price

MB2011=market_banana[which(market_banana$date >= '2011-01-01' & market_banana$date < '2011-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2011$date)
m=c(5,6) # 3down_price
MB=MB2011[,m]
m2011=matrix(regular)
banana_topPrice8=cbind(m2011,MB)  
names(banana_topPrice8)=c("date","down_price2011")
M1=c(1,2)
BT8=banana_topPrice8[,M1]
head(BT8)

# 2012down_price

MB2012=market_banana[which(market_banana$date >= '2012-01-01' & market_banana$date < '2012-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2012$date)
m=c(5,6) # 3down_price
MB=MB2012[,m]
m2012=matrix(regular)
banana_topPrice9=cbind(m2012,MB)  
names(banana_topPrice9)=c("date","down_price2012")
M1=c(1,2)
BT9=banana_topPrice9[,M1]
head(BT9)

# 2013down_price

MB2013=market_banana[which(market_banana$date >= '2013-01-01' & market_banana$date < '2013-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2013$date)
m=c(5,6) # 3down_price
MB=MB2013[,m]
m2013=matrix(regular)
banana_topPrice11=cbind(m2013,MB)  
names(banana_topPrice11)=c("date","down_price2013")
M1=c(1,2)
BT10=banana_topPrice11[,M1]
head(BT10)

# 2014down_price


MB2014=market_banana[which(market_banana$date >= '2014-01-01' & market_banana$date < '2014-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2014$date)
m=c(5,6) # 3down_price
MB=MB2014[,m]
m2014=matrix(regular)
banana_topPrice10=cbind(m2014,MB)  
names(banana_topPrice10)=c("date","down_price2014")
M1=c(1,2)
BT11=banana_topPrice10[,M1]
head(BT11)


#合併欄位
bananaDOWN1 = merge(BT1,BT2,by.x='date',all.x=TRUE)
head(bananaDOWN1)
bananaDOWN2 = merge(bananaDOWN1,BT3,by.x='date',all.x=TRUE)
head(bananaDOWN2)
bananaDOWN3 = merge(bananaDOWN2,BT4,by.x='date',all.x=TRUE)
head(bananaDOWN3)
bananaDOWN4 = merge(bananaDOWN3,BT5,by.x='date',all.x=TRUE)
head(bananaDOWN4)
bananaDOWN5 = merge(bananaDOWN4,BT6,by.x='date',all.x=TRUE)
head(bananaDOWN5)
bananaDOWN6 = merge(bananaDOWN5,BT7,by.x='date',all.x=TRUE)
head(bananaDOWN6)
bananaDOWN7 = merge(bananaDOWN6,BT8,by.x='date',all.x=TRUE)
head(bananaDOWN7)
bananaDOWN8 = merge(bananaDOWN7,BT9,by.x='date',all.x=TRUE)
head(bananaDOWN8)
bananaDOWN9 = merge(bananaDOWN8,BT10,by.x='date',all.x=TRUE)
head(bananaDOWN9)
bananaDownPrice= merge(bananaDOWN9,BT11,by.x='date',all.x=TRUE)
head(bananaDownPrice)

write.csv(bananaDownPrice,file='bananaDownPrice.csv')  #確認資料寫出來看一下

#香蕉歷年avg_price 以下同理 將數值代換即可 =============================================================== 

# 2004avg_price

#區間值 準備將資料bind
MB2004=market_banana[which(market_banana$date >= '2004-01-01' & market_banana$date < '2004-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2004$date)
m=c(6,7) # avg_price
MB=MB2004[,m]
m2004=matrix(regular)
banana_topPrice1=cbind(m2004,MB)  
names(banana_topPrice1)=c("date","avg_price2004")
M1=c(1,2)
BT1=banana_topPrice1[,M1]
#write.xlsx(bindtemp1,file='bindtemp1.xlsx')  #確認資料寫出來看一下
head(BT1)
str(BT)


# 2005avg_price
MB2005=market_banana[which(market_banana$date >= '2005-01-01' & market_banana$date < '2005-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2005$date)
m=c(6,7) # 3avg_price
MB=MB2005[,m]
m2005=matrix(regular)
banana_topPrice2=cbind(m2005,MB)  
names(banana_topPrice2)=c("date","avg_price2005")
M1=c(1,2)
BT2=banana_topPrice2[,M1]
head(BT2)

# 2006avg_price
MB2006=market_banana[which(market_banana$date >= '2006-01-01' & market_banana$date < '2006-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2006$date)
m=c(6,7) # 3avg_price
MB=MB2006[,m]
m2006=matrix(regular)
banana_topPrice3=cbind(m2006,MB)  
names(banana_topPrice3)=c("date","avg_price2006")
M1=c(1,2)
BT3=banana_topPrice3[,M1]
head(BT3)

# 2007avg_price

MB2007=market_banana[which(market_banana$date >= '2007-01-01' & market_banana$date < '2007-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2007$date)
m=c(6,7) # 3avg_price
MB=MB2007[,m]
m2007=matrix(regular)
banana_topPrice4=cbind(m2007,MB)  
names(banana_topPrice4)=c("date","avg_price2007")
M1=c(1,2)
BT4=banana_topPrice4[,M1]
head(BT4)


# 2008avg_price

MB2008=market_banana[which(market_banana$date >= '2008-01-01' & market_banana$date < '2008-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2008$date)
m=c(6,7) # 3avg_price
MB=MB2008[,m]
m2008=matrix(regular)
banana_topPrice5=cbind(m2008,MB)  
names(banana_topPrice5)=c("date","avg_price2008")
M1=c(1,2)
BT5=banana_topPrice5[,M1]
head(BT5)

# 2009avg_price

MB2009=market_banana[which(market_banana$date >= '2009-01-01' & market_banana$date < '2009-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2009$date)
m=c(6,7) # 3avg_price
MB=MB2009[,m]
m2009=matrix(regular)
banana_topPrice6=cbind(m2009,MB)  
names(banana_topPrice6)=c("date","avg_price2009")
M1=c(1,2)
BT6=banana_topPrice6[,M1]
head(BT6)

# 2010avg_price

MB2010=market_banana[which(market_banana$date >= '2010-01-01' & market_banana$date < '2010-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2010$date)
m=c(6,7) # 3avg_price
MB=MB2010[,m]
m2010=matrix(regular)
banana_topPrice7=cbind(m2010,MB)  
names(banana_topPrice7)=c("date","avg_price2010")
M1=c(1,2)
BT7=banana_topPrice7[,M1]
head(BT7)

# 2011avg_price

MB2011=market_banana[which(market_banana$date >= '2011-01-01' & market_banana$date < '2011-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2011$date)
m=c(6,7) # 3avg_price
MB=MB2011[,m]
m2011=matrix(regular)
banana_topPrice8=cbind(m2011,MB)  
names(banana_topPrice8)=c("date","avg_price2011")
M1=c(1,2)
BT8=banana_topPrice8[,M1]
head(BT8)

# 2012avg_price

MB2012=market_banana[which(market_banana$date >= '2012-01-01' & market_banana$date < '2012-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2012$date)
m=c(6,7) # 3avg_price
MB=MB2012[,m]
m2012=matrix(regular)
banana_topPrice9=cbind(m2012,MB)  
names(banana_topPrice9)=c("date","avg_price2012")
M1=c(1,2)
BT9=banana_topPrice9[,M1]
head(BT9)

# 2013avg_price

MB2013=market_banana[which(market_banana$date >= '2013-01-01' & market_banana$date < '2013-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2013$date)
m=c(6,7) # 3avg_price
MB=MB2013[,m]
m2013=matrix(regular)
banana_topPrice11=cbind(m2013,MB)  
names(banana_topPrice11)=c("date","avg_price2013")
M1=c(1,2)
BT10=banana_topPrice11[,M1]
head(BT10)

# 2014avg_price


MB2014=market_banana[which(market_banana$date >= '2014-01-01' & market_banana$date < '2014-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2014$date)
m=c(6,7) # 3avg_price
MB=MB2014[,m]
m2014=matrix(regular)
banana_topPrice10=cbind(m2014,MB)  
names(banana_topPrice10)=c("date","avg_price2014")
M1=c(1,2)
BT11=banana_topPrice10[,M1]
head(BT11)


#合併欄位
bananaAVG1 = merge(BT1,BT2,by.x='date',all.x=TRUE)
head(bananaAVG1)
bananaAVG2 = merge(bananaAVG1,BT3,by.x='date',all.x=TRUE)
head(bananaAVG2)
bananaAVG3 = merge(bananaAVG2,BT4,by.x='date',all.x=TRUE)
head(bananaAVG3)
bananaAVG4 = merge(bananaAVG3,BT5,by.x='date',all.x=TRUE)
head(bananaAVG4)
bananaAVG5 = merge(bananaAVG4,BT6,by.x='date',all.x=TRUE)
head(bananaAVG5)
bananaAVG6 = merge(bananaAVG5,BT7,by.x='date',all.x=TRUE)
head(bananaAVG6)
bananaAVG7 = merge(bananaAVG6,BT8,by.x='date',all.x=TRUE)
head(bananaAVG7)
bananaAVG8 = merge(bananaAVG7,BT9,by.x='date',all.x=TRUE)
head(bananaAVG8)
bananaAVG9 = merge(bananaAVG8,BT10,by.x='date',all.x=TRUE)
head(bananaAVG9)
bananaAvgPrice= merge(bananaAVG9,BT11,by.x='date',all.x=TRUE)
head(bananaAvgPrice)

write.csv(bananaAvgPrice,file='bananaAvgPrice.csv')  #確認資料寫出來看一下

#香蕉歷年trade 以下同理 將數值代換即可 =============================================================== 

# 2004trade

#區間值 準備將資料bind
MB2004=market_banana[which(market_banana$date >= '2004-01-01' & market_banana$date < '2004-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2004$date)
m=c(7,6) # avg_price
MB=MB2004[,m]
m2004=matrix(regular)
banana_topPrice1=cbind(m2004,MB)  
names(banana_topPrice1)=c("date","trade2004")
M1=c(1,2)
BT1=banana_topPrice1[,M1]
#write.xlsx(bindtemp1,file='bindtemp1.xlsx')  #確認資料寫出來看一下
head(BT1)
str(BT)


# 2005trade
MB2005=market_banana[which(market_banana$date >= '2005-01-01' & market_banana$date < '2005-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2005$date)
m=c(7,6) # 3trade
MB=MB2005[,m]
m2005=matrix(regular)
banana_topPrice2=cbind(m2005,MB)  
names(banana_topPrice2)=c("date","trade2005")
M1=c(1,2)
BT2=banana_topPrice2[,M1]
head(BT2)

# 2006trade
MB2006=market_banana[which(market_banana$date >= '2006-01-01' & market_banana$date < '2006-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2006$date)
m=c(6,7) # 3trade
MB=MB2006[,m]
m2006=matrix(regular)
banana_topPrice3=cbind(m2006,MB)  
names(banana_topPrice3)=c("date","trade2006")
M1=c(1,2)
BT3=banana_topPrice3[,M1]
head(BT3)

# 2007trade

MB2007=market_banana[which(market_banana$date >= '2007-01-01' & market_banana$date < '2007-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2007$date)
m=c(7,6) # 3trade
MB=MB2007[,m]
m2007=matrix(regular)
banana_topPrice4=cbind(m2007,MB)  
names(banana_topPrice4)=c("date","trade2007")
M1=c(1,2)
BT4=banana_topPrice4[,M1]
head(BT4)


# 2008trade

MB2008=market_banana[which(market_banana$date >= '2008-01-01' & market_banana$date < '2008-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2008$date)
m=c(7,6) # 3trade
MB=MB2008[,m]
m2008=matrix(regular)
banana_topPrice5=cbind(m2008,MB)  
names(banana_topPrice5)=c("date","trade2008")
M1=c(1,2)
BT5=banana_topPrice5[,M1]
head(BT5)

# 2009trade

MB2009=market_banana[which(market_banana$date >= '2009-01-01' & market_banana$date < '2009-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2009$date)
m=c(7,6) # 3trade
MB=MB2009[,m]
m2009=matrix(regular)
banana_topPrice6=cbind(m2009,MB)  
names(banana_topPrice6)=c("date","trade2009")
M1=c(1,2)
BT6=banana_topPrice6[,M1]
head(BT6)

# 2010trade

MB2010=market_banana[which(market_banana$date >= '2010-01-01' & market_banana$date < '2010-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2010$date)
m=c(7,6) # 3trade
MB=MB2010[,m]
m2010=matrix(regular)
banana_topPrice7=cbind(m2010,MB)  
names(banana_topPrice7)=c("date","trade2010")
M1=c(1,2)
BT7=banana_topPrice7[,M1]
head(BT7)

# 2011trade

MB2011=market_banana[which(market_banana$date >= '2011-01-01' & market_banana$date < '2011-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2011$date)
m=c(7,6) # 3trade
MB=MB2011[,m]
m2011=matrix(regular)
banana_topPrice8=cbind(m2011,MB)  
names(banana_topPrice8)=c("date","trade2011")
M1=c(1,2)
BT8=banana_topPrice8[,M1]
head(BT8)

# 2012trade

MB2012=market_banana[which(market_banana$date >= '2012-01-01' & market_banana$date < '2012-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2012$date)
m=c(7,6) # 3trade
MB=MB2012[,m]
m2012=matrix(regular)
banana_topPrice9=cbind(m2012,MB)  
names(banana_topPrice9)=c("date","trade2012")
M1=c(1,2)
BT9=banana_topPrice9[,M1]
head(BT9)

# 2013trade

MB2013=market_banana[which(market_banana$date >= '2013-01-01' & market_banana$date < '2013-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2013$date)
m=c(7,6) # 3trade
MB=MB2013[,m]
m2013=matrix(regular)
banana_topPrice11=cbind(m2013,MB)  
names(banana_topPrice11)=c("date","trade2013")
M1=c(1,2)
BT10=banana_topPrice11[,M1]
head(BT10)

# 2014trade


MB2014=market_banana[which(market_banana$date >= '2014-01-01' & market_banana$date < '2014-12-31'),]

regular=sub("^[0-9][0-9][0-9][0-9]-", "", MB2014$date)
m=c(7,6) # 3trade
MB=MB2014[,m]
m2014=matrix(regular)
banana_topPrice10=cbind(m2014,MB)  
names(banana_topPrice10)=c("date","trade2014")
M1=c(1,2)
BT11=banana_topPrice10[,M1]
head(BT11)


#合併欄位
bananaTrade1 = merge(BT1,BT2,by.x='date',all.x=TRUE)
head(bananaTrade1)
bananaTrade2 = merge(bananaTrade1,BT3,by.x='date',all.x=TRUE)
head(bananaTrade2)
bananaTrade3 = merge(bananaTrade2,BT4,by.x='date',all.x=TRUE)
head(bananaTrade3)
bananaTrade4 = merge(bananaTrade3,BT5,by.x='date',all.x=TRUE)
head(bananaTrade4)
bananaTrade5 = merge(bananaTrade4,BT6,by.x='date',all.x=TRUE)
head(bananaTrade5)
bananaTrade6 = merge(bananaTrade5,BT7,by.x='date',all.x=TRUE)
head(bananaTrade6)
bananaTrade7 = merge(bananaTrade6,BT8,by.x='date',all.x=TRUE)
head(bananaTrade7)
bananaTrade8 = merge(bananaTrade7,BT9,by.x='date',all.x=TRUE)
head(bananaTrade8)
bananaTrade9 = merge(bananaTrade8,BT10,by.x='date',all.x=TRUE)
head(bananaTrade9)
bananaTradePrice= merge(bananaTrade9,BT11,by.x='date',all.x=TRUE)
head(bananaTradePrice)

write.csv(bananaTradePrice,file='bananaTradePrice.csv')  #確認資料寫出來看一下


