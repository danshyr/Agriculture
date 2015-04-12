# A R program to convert 10-days-each-price records, from an xlsx file, to a daily-record data frame and save the data frame
#   into another xlsx file.
#   Filename: Taichung_longan.R
#   Author: Daniel Shyr
#   Date: 2015 April 11
#   Input: a file with a hard-coded file name "Taichung_longan.xlsx", the file contains records wherein 
#          each record using a price to represent for a 10-day period.
#   Output: a file with a hard-coded file name "Taichung_longan-DAILY.xlsx" with records wherein each record
#           indicates a day with a price.
#   

# Use functions read.xlsx and write.xlsx in package 'xlsx' to read in / write out xlsx files
install.packages("rJava")
library(rJava)
library(xlsx)
# Set up your data input directory
setwd("D:/YB103/__Big Data Project/Agricultural Products/已整理-台中產地價格")
# Read in the Taichung_longan.xlsx as a data frame
df_10dayPeriod = read.xlsx ("Taichung_longan.xlsx", sheetIndex = 1, header = F, startRow = 2, endRow = 624, stringsAsFactors = FALSE)
# Set the missing values as -1's
df_10dayPeriod$X2[df_10dayPeriod$X2=="-"] = -1
df_10dayPeriod$X3[df_10dayPeriod$X3=="-"] = -1

library(lubridate)
# Create a new, empty data frame for expanded daily records in the future
df = data.frame(X1 = as.Date(character()), X2 = numeric(), X3 = numeric())
# Start to convert each 10-day record to corresponding 10 daily records
#   the following for-loop uses nrow(), but does not check if df_10dayPeriod$X1[i] is a valid date,
#   RUN AT YOUR OWN RISK if you don't validate the date value in advance!
for (i in 1:nrow(df_10dayPeriod)){
  # Find current 10day record
  currentMonth = month(df_10dayPeriod$X1[i])
  currentDay = day(df_10dayPeriod$X1[i])
  startDateOffset = currentDay %% 10 - 1
  # Find the first date 
  currentDate = df_10dayPeriod$X1[i] - startDateOffset
  for (j in 1:10){
    if (month(currentDate) != currentMonth) {
      break
    }
    #print (currentDate)
    newRow = data.frame(X1 = currentDate, X2 = df_10dayPeriod$X2[i], X3 = df_10dayPeriod$X3[i],  stringsAsFactors = FALSE)
    df = rbind(df, newRow)
    currentDate = currentDate + 1
    if (day(currentDate) == 31) {
      #print (currentDate)
      newRow = data.frame(X1 = currentDate, X2 = df_10dayPeriod$X2[i], X3 = df_10dayPeriod$X3[i], stringsAsFactors = FALSE)
      df = rbind(df, newRow)
    }
  }
}
require(xlsx)
# Write out the converted daily records into an xlsx file
write.xlsx(df, "Taichung_longan-DAILY.xlsx")
