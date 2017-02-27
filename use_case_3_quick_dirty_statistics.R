# Author : Ahmad Fairuz Ali
# date : 14 February 2017
# Description: 
#
# This description is to show how we can get quick dirty statistics 
#
# Let's refer to the first use case 'use_case_1_loading_CSV_file.R'

# Let's run the code 
# Select all below and press [CTRL] + [ENTER]

setwd("C:\Users\XXXXXXXX\Training_R_GIA\data")

dsampleOT = read.csv("sample_OT.csv")
head(dsampleOT,n=3) # where n=3 is 3 lines of rows 
View(dsampleOT)
dim(dsampleOT)
colnames(dsampleOT)

#-------------------------------LESSON 1---------------------------------------
# Let says that you want to know what are the distribution of AMOUNT(RM) claim 
# just one line!

# what is inside AMOUNT? 

View(dsampleOT$AMOUNT)
dsampleOT$AMOUNT

barplot(dsampleOT$AMOUNT) # this is bar plot 

# Let's do some statistic 
boxplot(dsampleOT$AMOUNT)

#  boxplot will give you mean,mod,1st quartile, maximum value of the distribution 
#  what the heck is that ??? 

# refer to below
# http://www.physics.csbsju.edu/stats/box2.html

# Notes : If your console return 'Error in plot.new() : figure margins too large', 
# try to resize the plot console bigger 
#

#-------------------------LESSON 2-----------------------------------------------

# Let say you want amongst the 9k claims, who make the highest claim transaction
# this is siapa yg buat single with amount paling banyak
# berbeza dengan soalan, siapa yg buat claim paling banyak!(yg mana kita akan huraikan in Lesson 3 )

# If you observe the boxplot graph, you know that the maximum value is RM800. Hence, lets get the detail who perform the claim with more than RM800

dsampleOT$AMOUNT[dsampleOT$AMOUNT > 800] # nak check, apakah jumlah claim yg lebih dari RM800, RM831.46 

dsampleOT$STAFFNAME[dsampleOT$AMOUNT > 800] # keluarkan nama org tersebut

dsampleOT[dsampleOT$AMOUNT > 800,] # keluarkan semua colum , tapi view tak best 

result = dsampleOT[dsampleOT$AMOUNT > 800,] # assign it to an object
 
View(result) # view the object 

#----------------------------LESSON 3----------------------------------------------------

# seperti dijanjikan (maaf lah, tulis dalam bahasa melayu),kita akan cari siapakah yg
# claim paling banyak??

# load the ggplot2 
library(dplyr)

StaffNameAmount = select(dsampleOT,STAFFNAME,AMOUNT)
StaffNameAmount

# Then, you raise questions, what are the total of OT claimed by each Cost Center 
# step 1
StaffNameAmount_groupby = group_by(StaffNameAmount,STAFFNAME)
# step 2 
result = summarize(StaffNameAmount_groupby,total=sum(AMOUNT))

View(result) # then click 'Total' untuk sort by highest! 

# didapati 'AHMAD' punyai cumulative claim paling banyak
# let's graph distribution of claim En.Ahmad ini

dsampleOT[dsampleOT$STAFFNAME == 'AHMAD',] # cuba fahamkan syntax ini

# mari kita lukis graph si Ahmad ini

x = dsampleOT[dsampleOT$STAFFNAME == 'AHMAD',]$AMOUNT
# code di atas mengambil value AMOUNT dari Ahmad ini

# convertkan result di atas ke dalam table dulu
x1 = table(x)

# then baru boleh lukis 
barplot(x1,xlabs="Amount(RM) Claim") 

# En.Ahmad di atas claim RM119.13 sebanyak 8 kali! 
