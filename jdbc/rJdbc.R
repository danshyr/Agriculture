install.packages("RJDBC",dep=TRUE)
#install.packages("rJava")
Sys.getenv("JAVA_HOME")
if (Sys.getenv("JAVA_HOME")!="")
  Sys.setenv(JAVA_HOME="")
library("RJDBC")
library("rJava")

.Platform$OS.type
drv <- JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver",
            "D:/JDBC/lib/sqljdbc4.jar")
class(drv)
drv <- JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver",
            "D:/JDBC/lib/sqljdbc4.jar") 
conn <- dbConnect(drv, "jdbc:sqlserver://localhost:1433;databaseName=jdbc", "sa", "passw0rd")
class(conn)
#Build a query and run it
sqlText <- paste("SELECT * FROM dbo.employee", sep="")
queryResults <- dbGetQuery(conn, sqlText)
close(conn)


#library(RODBC);
#channel = odbcConnect("agriculture", uid="sa", pwd="passw0rd");
#market_banana = sqlQuery(channel, "select * from market_banana");
#close(channel);

library(RODBC);
channel = odbcConnect("BigData-PC", uid="sa", pwd="passw0rd");
market_banana = sqlQuery(channel, "select * from employee");
close(channel);


