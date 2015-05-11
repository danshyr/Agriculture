#將不同時間的係數整理並合併
year = seq(1,41,4)
month8 = seq(2,42,4)
month5 = seq(3,43,4)
month3 = seq(4,44,4)

str(coryear)
str(cormonth8)
str(cormonth5)
str(cormonth3)

bigCorpersimmon = data.frame()
bigCorpersimmon = rbind(coryear,cormonth8,cormonth5,cormonth3)

bigCorpersimmon[year,] = coryear
bigCorpersimmon[month8,] = cormonth8
bigCorpersimmon[month5,] = cormonth5
bigCorpersimmon[month3,] = cormonth3
#標示ROW而已
for(i in year){
  names = paste(i,'year',sep="")  
  rownames(bigCorpersimmon)[i] = names
  
}
for(i in month8){
  names = paste(i,'month8',sep="")  
  rownames(bigCorpersimmon)[i] = names
  
}
for(i in month5){
  names = paste(i,'month5',sep="")  
  rownames(bigCorpersimmon)[i] = names
  
}
for(i in month3){
  names = paste(i,'month3',sep="")  
  rownames(bigCorpersimmon)[i] = names
  
}

str(bigCorpersimmon)

x = data.frame()

for(i in 2004:2014){
for(j in 1:4){
 print(i)
  x = rbind(x,i)
}
}
#標記年分
bigCorpersimmon[,36] = x
colnames(bigCorpersimmon)[36] = 'year'
#跑圖用的X軸
bigCorpersimmon[,37] = seq(1,44,1)
colnames(bigCorpersimmon)[37] = 'seq'

library(xlsx)
write.xlsx(bigCorpersimmon,file='bigCorpersimmon3.xlsx')
str(bigCorpersimmon)

#####看所有的變化並合成一張表

#起始合併黨
bigCorpersimmontest = bigCorpersimmon[bigCorpersimmon$year==2004,1]
str(bigCorpersimmontest)
#將特定係數取出並用迴圈合併

for(i in 2005:2014){  
  bigCorpersimmon2 = bigCorpersimmon[bigCorpersimmon$year==i,1]
  bigCorpersimmontest = cbind(bigCorpersimmontest,bigCorpersimmon2)
}
#重新命名COL
for(i in 1:ncol(bigCorpersimmontest)){
  names = paste('year',i+2003,sep="")  
  colnames(bigCorpersimmontest)[i] = names
  
}
#新增索引
bigCorpersimmontest = cbind(bigCorpersimmontest,c(1,2,3,4))
colnames(bigCorpersimmontest)[12] = 'seq'
#寫成檔案
write.xlsx(bigCorpersimmontest,file='bigCorpersimmontest.xlsx')
#讀回檔案
tempCor = read.xlsx(header=TRUE,file='bigCorpersimmontest.xlsx',sheetIndex=1)

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







