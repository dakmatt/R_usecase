# Author : Ahmad Fairuz Ali
# date : 14 February 2017
# Description: 
# 
# Dalam use case 3,i dah tukar dari commenting in English kepada Malay Rojak English (MRE)
# The reason of using MRE ialah untuk visualizing yang I sedang share the code with you
#
# Kadangkala, MRE senang untuk menerangkan sesuatu concept from my perspective. Sorry!

# Dalam use case ini, kita akan berkenalan dengan how to retrieve data dari EDWH

# kalu blum ada 'RJDBC' cuba run install.packages("RJDBC")

library(RJDBC)
# membina rangkaian JDBC dengan driver ORACLE 
drv <- JDBC("oracle.jdbc.OracleDriver",
            classPath="C:/YOURPATH/product/11.2.0/client_1/sqldeveloper/jdbc/lib/ojdbc5.jar", " ")
# membina connection dengan EDWH. sila tukar username dan password accordingly 
con <- dbConnect(drv, "jdbc:oracle:thin:@address:1521/sss", "username", "password")
# run the query to EDWH! This query akan amik the cancelled order for the last 7 days by state
data <- dbGetQuery(con, "select X from Y group by X")
# let's plot
library(ggplot2)

gambar = ggplot(data=data, aes(x=STATE, y=TOTAL)) + geom_bar(stat="identity")
gambar + theme(axis.title.x = element_text(face="bold", colour="#990000", size=10),axis.text.x  = element_text(angle=45, vjust=0.5, size=10)) + ggtitle("The Cancel order for the last 7 days")
