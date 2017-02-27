# Author : Fairuz
# Date : 15 Feb 2017
# Description: 
# Use case for loading more than 1 million records, example of performing BIG DATA
#  
# The reason of this use case is to show what are the advantages using R rather than Excel
# Apart of simplify code to execute, R also provide the ability to process data 
# more than 1 million? Why 1 million? Because that was the benchmark used againts Excel 

# Check what is your current directory 
getwd()

# Set your directory 
setwd("C:/Users/XXXXX/Training_R_GIA/data")

# Before you load, better if you can clear all 'Global Environment' under 'Environment'
# by click on the broom icon (penyapu)
# 

# This file contains 4 millions of records! 
# Let's load the file ~! 
cust_profile=read.csv("customer_profile.csv") 

# In my laptop, Rstudio took 3 minutes to load the above file
# What is the dimension ? 

dim(cust_profile) 

# it contains 4,143,808 rows and 3 columns 

# Let's view the first 5 rows

head(cust_profile,n=5)

cust_profile_df =as.data.frame(cust_profile)

head(cust_profile_df,n=5)

colnames(cust_profile_df)

rownames(cust_profile_df)

res = cust_profile_df[cust_profile_df$ADDRESS_TYPE == 'PO BOX',]

View(res)

# The data contain name of customer, date since commission and address type

# What are the type of ADDRESS_TYPE ?

sum_add_type = summary(cust_profile_df$ADDRESS_TYPE)

View(sum_add_type)

sum_add_type[1:9]

typeof(sum_add_type)

colnames(sum_add_type)
rownames(sum_add_type)

# The above contains NULL value with 1,201,383 rows , 'C' with 1,108 , 'High-Rise' 14,496 
# and so on. 

# It's hard to see from the Console. Let's do some visualization

install.packages("ggplot2")

library(ggplot2)

myplot = ggplot(data=cust_profile_df, aes(x=ADDRESS_TYPE)) + geom_bar(stat="count")

myplot 

# the word 'count' di atas akan automatically count total 'ADDRESS_TYPE' and display 
# the result on the bar chart, but the x label is not proper .
# so, type below 

myplot + theme(axis.title.x = element_text(face="bold", colour="#990000", size=10),axis.text.x  = element_text(angle=45, vjust=0.5, size=10))

# Think! what else you want to know about this 
