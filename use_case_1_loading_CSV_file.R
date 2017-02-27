# Author : Ahmad Fairuz Ali
# date : 14 February 2017
# Description: 
# 
# This file is written to help auditors in GIA in learning the basic functionality
# in R. Initially, I wanted to write the manual in Power Point and let the reader run
# the code themselves in RStudio. However, I found it very troublesome for you to read
# the Power Point and flip to Rstudio to paste the code and run. Might as well, the 
# manual are written in the source code and allow you to experience executing the code
# while reading the manuals.
# 
# 
# My advise: * The best way to learn is don't afraid of making mistake *
# 
# 

# -------------------------------------Lesson 1:---------------------
# The below function is to know what is your current directory.
getwd()
# 
# If you want RStudio to point to specific directory which contains
# file which you downloaded , kindly use 'setwd' 

setwd("C:/Users/XXXXXX/Training_R_GIA/data/")

getwd()

# Once Rstudio already pointed to your directory, you can load the file which you want
# in below example, Rstudio will read 'sample_OT.csv' and
# assigned the contents of the file into object called 'dsampleOT' 

dsampleOT = read.csv("sample.csv")

# Try view the few lines of object above

head(dsampleOT,n=3) # where n=3 is 3 lines of rows 

# If you want to view the file like in 'Excel', type View

View(dsampleOT)

# How many records contains in the object? 

dim(dsampleOT) 

# This means that there are 9,096 rows and 40 columns 

# What are the column names? 

colnames(dsampleOT)

dsampleOT$STATUS
dsampleOT[,25]

View(dsampleOT[2,])

# How to know the row names ?
# in this example, row names are the number from 1 to 9096 because there are 9096 rows

rownames(dsampleOT)

# -----------------------lesson 2------------------------------------

# When you have load the file above, you need to know how to access the information
# inside the object 

# Since dsampleOT has 40 columns, then you need to know the column names 
# If you want to extract one of the columns, type below.

# example, column 'STAFFNAME'

dsampleOT$STAFFNAME

# The above will list all, but on your console screen, only the first 1000 will be 
# displayed 

# Then you want to display rows. If you type 'dsampleOT', RStudio will display all 
# So, you need to know what rows to display. 

# Let say you wnat to display rows which contains STAFFNAME='NUR ZAHIDAH BINTI CHE MUSA'

myname = dsampleOT[dsampleOT$STAFFNAME == 'MICHEAL JACKSON',]


consumer_KP = dsampleOT[dsampleOT$COST_DESC == 'Consumer X',]

View(consumer_KP)

dim(consumer_KP)

dim(dsampleOT[dsampleOT$COST_DESC == 'Consumer X',])

View(nur_zahidah)

sum(consumer_KP$AMOUNT)

mean(consumer_KP$AMOUNT)




# the above will display all rows with staff name 'MICHEAL JACKSON' above. 
# however, the view doesn't nice in console.

# So, type below.

View(dsampleOT[dsampleOT$STAFFNAME == 'MICHEAL JACKSON',])

# the above will return a nicer view on rows with staff name MICHAEL JACKSON

# ---------------------------LESSON 3----------------------------------
# In R, there are special library that helps you to do a lot of aggregation
# kindly install the below.

install.packages("dplyr")

# run the library

library(dplyr)

# let say you want to display 2 columns only (out of 40 columns)
# example, you want to view cost center of the OT with their amounts 

CostDescAmount = select(dsampleOT,COST_DESC,AMOUNT)
CostDescAmount

# Then, you raise questions, what are the total of OT claimed by each Cost Center 
# step 1
costCenterAmount_GB = group_by(CostDescAmount,COST_DESC)

costCenterAmount_GB

# step 2 
result = summarize(costCenterAmount_GB,total=sum(AMOUNT))

?summarize

View(result)

# what is your questions now? 
# Think! 







