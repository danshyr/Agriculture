
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

bigCorpersimmon[,36] = x
colnames(bigCorpersimmon)[36] = 'year'


library(xlsx)
write.xlsx(bigCorpersimmon,file='bigCorpersimmon3.xlsx')


str(bigCorpersimmon)
plot(bigCorpersimmon$air_temp~bigCorpersimmon$date,
     xlab = "date",
     ylab = "air_temp",    
     type ="l"
)
#增加其他參數確認相關性
#points(x=dataRawNormalizeponkan$date,y=dataRawNormalizeponkan$pricePeace,col='blue',type='l')
#points(x=dataRawNormalizeponkan$date,y=dataRawNormalizeponkan$avg_price,col='red',type='l')
#points(x=dataRawNormalizeponkan$date,y=dataRawNormalizeponkan$LonganProductionDaily,col='green',type='l')







