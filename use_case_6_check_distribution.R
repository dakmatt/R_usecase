# Author : Ahmad Fairuz Ali
# date : 14 February 2017
# Description: 
#
# dalam case ini, kita akan check taburan masalah kita ini.
#
#
# Let's run the code 
# Select all below and press [CTRL] + [ENTER]


library(dplyr)
library(ggplot2)

j <- read.csv("C:/XXXXXXX/Training_R_GIA/data_managed_acc_fulfilment_oct16-1.csv")

head(j)

summary(j$RoundDateDiff)
summary(j$FULFILLMENT_TYPE)
mean(j$RoundDateDiff)
sd(j$RoundDateDiff)
View(j$RoundDateDiff)
# jalankan normalized function tersebut 
den <- dnorm(j$RoundDateDiff,0,1)

# buat canvas dulu
par(mfrow=c(1,3), mar=c(3,4,4,2))

# melukis pertama dulu RAW
l <- hist(j$RoundDateDiff,main="Tajuk di sini")
# melukis kedua dulu normalized
t <- hist(den,main="Tajuk di sana")
