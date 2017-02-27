# Author : Ahmad Fairuz Ali
# date : 14 February 2017
# Description: 
#
# contoh dalam menjalankan cumulative boxplot
#
# Let's run the code 
# Select all below and press [CTRL] + [ENTER]

longerdelivery <- read.csv("C:/XXXXX/Training_R_GIA/data/longer_delivery_4r.csv")

summary(longerdelivery)

library(ggplot2)

bp <- ggplot(data=longerdelivery, aes(x=Date_of_PO, y=Ageing, fill=Product)) + geom_boxplot()

bp + theme(axis.title.x = element_text(face="bold", colour="#990000", size=10),
           axis.text.x  = element_text(angle=45, vjust=0.5, size=10)) + ggtitle("Ageing of date delivery from the PO Date") + geom_abline(intercept=42,slope=0,colour="red",size=0.3,linetype="dotted")

# Dalam hal ini, what most important adalah preparation of the data 
# mari lihat raw file tersebut

View(longerdelivery)

# ada 3 column utama,
# 1. Product
# 2. Ageing.
# 3. PODate. 



