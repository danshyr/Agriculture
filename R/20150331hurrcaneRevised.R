test.data =read.xlsx(header =TRUE,file='test1.xlsx',sheetIndex=1,encoding='UTF-8')
#先把原始颱風資料讀近來

head(test.data)
#用HEAD檢查資料內容

head(test.data[,6])
#取風災 期間的COLUMN

start_time =(test.data[seq(1,nrow(test.data),2),6])
leave_time = (test.data[seq(2,nrow(test.data),2),6])
#將奇數欄位及偶數欄位取出，分開開始與結束日期

test2.data =read.xlsx(header =TRUE,file='text2.xlsx',sheetIndex=1,encoding='UTF-8')
#一部分颱風資料因為襲擊時間多次，所以用人工成多筆之後再讀近來
head(test2.data)
#檢查部分內容

newdata = cbind(test2.data,start_time,leave_time)
#合成新的dataframe

head(newdata)
#檢查部分內容

write.xlsx(newdata,file='hurrcine2.xlsx')
#寫出資料