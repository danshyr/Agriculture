#將台中產地資料讀近來
banana = read.xlsx(header=TRUE,file='Taichung_banana.xlsx',sheetIndex=1,encoding='UTF-8')
#檢查所需內容在哪裡
head(banana[4:624,2])
#確認屬性
str(banana)
#將所需內容放入一個變數
revise = banana[4:621,2]
#複製並合併成十個重複的數值(先預設都是30天),這個變數晚點會再用到,怕修改到可以存檔備用
Revised2 = data.frame(revise,revise,revise,revise,revise,revise,revise,revise,revise,revise)
#將複製後的檔案存出,備用
write.csv(Revised2,file='Revised2.xlsx')
#用向量取下旬的欄位位置
lastweek = seq(3,618,3)
#取出下旬的欄位位置成一個變數
lastmonth = Revised2[lastweek,]
#先將第31天的資料改成999方便修改
Revised2[,11]=999
#將取出下旬的資料檔案存出,用EXCEl新增兩個欄位,一個是年,一個是月份,作為等等判斷天數用
# EX 1998 1 ...價格...
write.csv(lastmonth,file='text23.xlsx')

#讀取已修改的檔案
RDateData = read.xlsx(header=TRUE,file='text23.xlsx',sheetIndex=1,encoding='UTF-8' )
#檢察屬性
str(RDateData)

#以下就是判斷最後一天天數的迴圈,欄位為1到206,用迴圈跑,由第一個欄位判斷年分,第二個欄位判斷月份


for(i in 1:206){
x = RDateData[i,1]
y = RDateData[i,2]
#閏年判斷公式,如果是29天,第30天為999,方便修改,28天同理
if(x%%400==0 | (x%%4==0 & x%%100 !=0)){
  if(y==2){
    RDateData[i,12]=999;
  }
}else{
  if(y==2){
    RDateData[i,11]=999;
    RDateData[i,12]=999;
  }
}
}
#如果是31天,則後面再新增一個值
for(i in 1:206){
  y = RDateData[i,2]  
  if(y==1|y==3|y==5|y==7|y==8|y==10|y==12){
    RDateData[i,13]=RDateData[i,12]; 
  }else{
    RDateData[i,13]=999
  }
}
#將天數修改完成的值存成新變數
newRDateData = RDateData
#把年月去掉
newRDateData[1:2]=list(NULL)
#將新修改好的下旬資料替換掉原來的欄位(ROW),如果出現NULL取代問題是正常的
Revised2[lastweek,] = newRDateData
#寫出檔案備份,記得打開看一下NA或999部分是否正確
write.csv(Revised2,file='texfinal.csv')
#備份一個後再讀進來,讀檔案前用EXCEL將999取代成NA
chainTest = read.csv(header=TRUE,file='texfinal.csv')
#依樣檢查一下屬性
str(chainTest)
#去除無意義的欄位(數字順序)
chainTest[,1] = NULL
#將所有數值置換成一個大長串數字,並忽略NA值
chain = na.omit(as.vector(t(chainTest)))
#寫出檔案,記得在EXCEL上標題打清楚水果及農會
write.csv(chain,file='chain.csv')



