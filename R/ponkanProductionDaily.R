#撈資料
library(RODBC);
channel = odbcConnect("agriculture", uid="sa", pwd="passw0rd");
production = sqlQuery(channel, "select * from production");
market_ponkan = sqlQuery(channel, "select * from market_ponkan");
ponkan_production_price = sqlQuery(channel, "select * from ponkan_production_price");
close(channel);

priceMerge = na.omit(merge(ponkan_production_price,market_ponkan,by.x='date',all.x=TRUE))
priceMergeDate = priceMerge[priceMerge$date>='2004-01-01' & priceMerge$date<='2014-12-31',]
v = c(1,9)
tradeRaw = priceMergeDate[,v]

productionB = production[production$fruits=='椪柑',v]

#normalize the trade
Normolize = (tradeRaw$trade-min(tradeRaw$trade))/(max(tradeRaw$trade)-min(tradeRaw$trade))
#set back the column
tradeRaw[,2] = Normolize
#get the new variable
NewNorlize = tradeRaw
#check content
str(NewNorlize)

###
#take the specific period 
normolize2004 = NewNorlize[NewNorlize$date>='2004-01-01' & NewNorlize$date<='2004-12-31',2]
#sum the number of normalization
summ = sum(normolize2004)
# production / sum and get new variable x
x = productionB[1,2] / summ
#get new daily data and back to the data frame
NewNorlize[NewNorlize$date>='2004-01-01' & NewNorlize$date<='2004-12-31',2] = x *normolize2004
###repeat
normolize2005 = NewNorlize[NewNorlize$date>='2005-01-01' & NewNorlize$date<='2005-12-31',2]
summ = sum(normolize2005)
x = productionB[2,2] / summ
NewNorlize[NewNorlize$date>='2005-01-01' & NewNorlize$date<='2005-12-31',2] = x *normolize2005
###
normolize2006 = NewNorlize[NewNorlize$date>='2006-01-01' & NewNorlize$date<='2006-12-31',2]
summ = sum(normolize2006)
x = productionB[3,2] / summ
NewNorlize[NewNorlize$date>='2006-01-01' & NewNorlize$date<='2006-12-31',2] = x *normolize2006
###
normolize2007 = NewNorlize[NewNorlize$date>='2007-01-01' & NewNorlize$date<='2007-12-31',2]
summ = sum(normolize2007)
x = productionB[4,2] / summ
NewNorlize[NewNorlize$date>='2007-01-01' & NewNorlize$date<='2007-12-31',2] = x *normolize2007
###
normolize2008 = NewNorlize[NewNorlize$date>='2008-01-01' & NewNorlize$date<='2008-12-31',2]
summ = sum(normolize2008)
x = productionB[5,2] / summ
NewNorlize[NewNorlize$date>='2008-01-01' & NewNorlize$date<='2008-12-31',2] = x *normolize2008
###
normolize2009 = NewNorlize[NewNorlize$date>='2009-01-01' & NewNorlize$date<='2009-12-31',2]
summ = sum(normolize2009)
x = productionB[6,2] / summ
NewNorlize[NewNorlize$date>='2009-01-01' & NewNorlize$date<='2009-12-31',2] = x *normolize2009
###
normolize2010 = NewNorlize[NewNorlize$date>='2010-01-01' & NewNorlize$date<='2010-12-31',2]
summ = sum(normolize2010)
x = productionB[7,2] / summ
NewNorlize[NewNorlize$date>='2010-01-01' & NewNorlize$date<='2010-12-31',2] = x *normolize2010
###
normolize2011 = NewNorlize[NewNorlize$date>='2011-01-01' & NewNorlize$date<='2011-12-31',2]
summ = sum(normolize2011)
x = productionB[8,2] / summ
NewNorlize[NewNorlize$date>='2011-01-01' & NewNorlize$date<='2011-12-31',2] = x *normolize2011
###
normolize2012 = NewNorlize[NewNorlize$date>='2012-01-01' & NewNorlize$date<='2012-12-31',2]
summ = sum(normolize2012)
x = productionB[9,2] / summ
NewNorlize[NewNorlize$date>='2012-01-01' & NewNorlize$date<='2012-12-31',2] = x *normolize2012
###
normolize2013 = NewNorlize[NewNorlize$date>='2013-01-01' & NewNorlize$date<='2013-12-31',2]
summ = sum(normolize2013)
x = productionB[10,2] / summ
NewNorlize[NewNorlize$date>='2013-01-01' & NewNorlize$date<='2013-12-31',2] = x *normolize2013
###
normolize2014 = NewNorlize[NewNorlize$date>='2014-01-01' & NewNorlize$date<='2014-12-31',2]
summ = sum(normolize2014)
x = productionB[11,2] / summ
NewNorlize[NewNorlize$date>='2014-01-01' & NewNorlize$date<='2014-12-31',2] = x *normolize2014
#new column name
names(NewNorlize)[2] = paste('productionDaily')
#write out
write.xlsx(NewNorlize,file='ponkanProductionDaily.xlsx')
