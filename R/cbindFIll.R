files = list.files(path=".", pattern="*.csv") 
library(rowr)
wrinkle = read.csv(file='wrinkle.csv',header=T)
wrinkle[,1]=as.Date(wrinkle[,1])

wrinkle2004 = wrinkle[wrinkle$date>='2004-01-01' & wrinkle$date<='2004-12-31',]

for(i in 2005:2015){  
  #年份區間
  startday = paste(i,'-01-01',sep="")  
  enday = paste(i,'-12-31',sep="")  
  trye = paste(i,'test',sep="")
  #將檔名及時間結合再一起
  trye = wrinkle[wrinkle$date>=startday & wrinkle$date<=enday,2]  
  wrinkle2004 = cbind.fill(wrinkle2004,trye,fill=NULL)
}

for(i in 1:ncol(wrinkle2004)){
  names = paste(i+2002,'year',sep="")
  colnames(wrinkle2004)[i] = names  
  
}
colnames(wrinkle2004)[1] = 'date' 

write.csv(wrinkle2004,file='wrinkle2004.csv')
