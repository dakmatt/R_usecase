# Author : Ahmad Fairuz Ali
# date : 14 February 2017
# Description: 
#
# In this script, we shall run some scatter plot 
#
#
# Let's run the code 
# Select all below and press [CTRL] + [ENTER]

setwd("C:/Users/XXXXXXXX/Training_R_GIA/data")
ML_trans = read.csv("all_ml_2june16.csv")

head(ML_trans,n=3) # where n=3 is 3 lines of rows 
View(ML_trans)
dim(ML_trans)
colnames(ML_trans)


#-------------------------------LESSON 1---------------------------------------
# Let says that you want to know what are the distribution of AMOUNT(RM) claim 
# just one line!

library(ggplot2)

qplot(Qty.Issue,Amount.LC,data=ML_trans,geom="point")

qplot(Qty.Issue,Balance.Qty,data=ML_trans,geom="point",color=factor(carb))
