#將不同時間的係數整理並合併
year = seq(1,41,4)
month8 = seq(2,42,4)
month4 = seq(3,43,4)
month2 = seq(4,44,4)

str(coryear)
str(cormonth8)
str(cormonth4)
str(cormonth2)

bigCorlongan = data.frame()
bigCorlongan = rbind(coryear,cormonth8,cormonth4,cormonth2)

bigCorlongan[year,] = coryear
bigCorlongan[month8,] = cormonth8
bigCorlongan[month4,] = cormonth4
bigCorlongan[month2,] = cormonth2
#標示ROW而已
for(i in year){
  names = paste(i,'year',sep="")  
  rownames(bigCorlongan)[i] = names
  
}
for(i in month8){
  names = paste(i,'month8',sep="")  
  rownames(bigCorlongan)[i] = names
  
}
for(i in month4){
  names = paste(i,'month4',sep="")  
  rownames(bigCorlongan)[i] = names
  
}
for(i in month2){
  names = paste(i,'month2',sep="")  
  rownames(bigCorlongan)[i] = names
  
}

str(bigCorlongan)

x = data.frame()

for(i in 2004:2014){
for(j in 1:4){
 print(i)
  x = rbind(x,i)
}
}
#標記年分
bigCorlongan[,33] = x
colnames(bigCorlongan)[33] = 'year'
#跑圖用的X軸
bigCorlongan[,34] = seq(1,44,1)
colnames(bigCorlongan)[34] = 'seq'

library(xlsx)
write.xlsx(bigCorlongan,file='bigCorlongan3.xlsx')
str(bigCorlongan)

#####看所有的變化並合成一張表

#起始合併黨
bigCorlongantest = bigCorlongan[bigCorlongan$year==2004,1]
str(bigCorlongantest)
#將特定係數取出並用迴圈合併

for(i in 2005:2014){  
  bigCorlongan2 = bigCorlongan[bigCorlongan$year==i,1]
  bigCorlongantest = cbind(bigCorlongantest,bigCorlongan2)
}
#重新命名COL
for(i in 1:ncol(bigCorlongantest)){
  names = paste('year',i+2003,sep="")  
  colnames(bigCorlongantest)[i] = names
  
}
#新增索引
bigCorlongantest = cbind(bigCorlongantest,c(1,2,3,4))
colnames(bigCorlongantest)[12] = 'seq'
#寫成檔案
write.xlsx(bigCorlongantest,file='bigCorlongantest.xlsx')
#讀回檔案
tempCor = read.xlsx(header=TRUE,file='bigCorlongantest.xlsx',sheetIndex=1)

str(tempCor)
#畫圖
plot(tempCor$year2004~tempCor$seq,
     xlab = "reference",
     ylab = "TempPrice",    
     type ="l",
     main='tempcor'
)

points(x=tempCor$seq,y=tempCor$year2005,col=6,type='l')
points(x=tempCor$seq,y=tempCor$year2006,col=31,type='l')
points(x=tempCor$seq,y=tempCor$year2007,col=56,type='l')
points(x=tempCor$seq,y=tempCor$year2008,col=56,type='l')
points(x=tempCor$seq,y=tempCor$year2009,col=81,type='l')
points(x=tempCor$seq,y=tempCor$year2010,col=106,type='l')
points(x=tempCor$seq,y=tempCor$year2011,col=131,type='l')
points(x=tempCor$seq,y=tempCor$year2012,col=405,type='l')
points(x=tempCor$seq,y=tempCor$year2013,col=454,type='l')
points(x=tempCor$seq,y=tempCor$year2014,col=5-4,type='l')







