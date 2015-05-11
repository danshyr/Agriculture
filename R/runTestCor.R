
testyear = read.xlsx(header=TRUE,file='coryear.xlsx',sheetIndex=1)
str(testyear)
head(testyear)

testmonth8 = read.xlsx(header=TRUE,file='cormonth8.xlsx',sheetIndex=1)
testmonth5 = read.xlsx(header=TRUE,file='cormonth5.xlsx',sheetIndex=1)
testmonth3 = read.xlsx(header=TRUE,file='cormonth3.xlsx',sheetIndex=1)


avgyear =   lapply(testyear,mean)
avgmonth8 = lapply(testmonth8,mean)
avgmonth5 = lapply(testmonth5,mean)
avgmonth3 = lapply(testmonth3,mean)

testBineCor = rbind(avgyear,avgmonth8,avgmonth5,avgmonth3)


write.xlsx(testBineCor,file='testBineCor.xlsx')