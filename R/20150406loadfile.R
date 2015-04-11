#這是一個DEMO，請修改檔案內容，我也是網路找來在修改的
#=============================================================
#單一檔案欄位取值測試
filea = read.xlsx(header = FALSE, encoding = "UTF-8",file='2005Production.xlsx', sheetIndex = 1)
#取不同sheet記得的改SHEETINDEX

#將所要取的欄位位置數用向量合成

row = c(8,20)        #取8及20欄位(ROW)，此欄位8為標題，20為內容
column = seq(1,14,1) #也可以用自動產向量的方式

#將產生出的向量放到要取的部位[ROW,COLUMN]
revise = filea[row,]   #測試結果
filea[8,column]        #測試結果

colnamess = filea[8,column] #這是標題

#================================================================

#多個檔案讀取
 files = list.files(path=".", pattern="*.xlsx")  #取得當下目錄(path=".")所有XLSX檔案
 bindtemp = data.frame()   #變數類型為data.frame
 temp = data.frame()

#用迴圈讀取多個檔案
 for (file in files) {      
      bindtemp = read.xlsx(header = FALSE, encoding = "UTF-8",file=file, sheetIndex = 1)
      revisedtemp = bindtemp[20,column]   #只取所要的欄位值
      temp = rbind(temp,revisedtemp)      #所有值合併
      
   }
       tempfinal = rbind(colnamess,temp)  #最後再把標題的欄位補上

write.xlsx(tempfinal, file= 'temp.xlsx')  #寫出檔案
#有個問題要注意，不適每個檔案的同個位置都是台中，這部分可能要人工去喬位置



