
library(xlsx)

test.data = read.xlsx(header=TRUE,file='ty.xlsx',sheetIndex=1,encoding='UTF-8')
#讀颱風資料原始檔
str(weather_data)
head(weather_data)
#檢查資料

class(weather_data[,12])
head(weather_data[,12])
#確認資料位置

start_time =(test.data[seq(1,nrow(test.data),2),12])
leave_time = (test.data[seq(2,nrow(test.data),2),12])
#取出所要資料部位
class(start_time)
#確認時間屬性

RawData = test.data = read.csv(header=TRUE,file='hurrcine.csv')
#取出清除空白的資料

newdata2 = cbind(RawData[,1:11],start_time,leave_time)
head(newdata2)
#將所要的資料整理再一起
class(newdata2[,12])

write.csv(newdata2,file='hurrcine2.csv')
#整理完寫出
write.xlsx(newdata2,file='hurrcine2.xlsx')
#整理完寫出

class(newdata2[,12])


