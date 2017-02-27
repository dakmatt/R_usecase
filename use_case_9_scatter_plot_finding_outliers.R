# Author : Ahmad Fairuz Ali
# date : 14 February 2017
# Description: 
#
# ini adalah contoh menjalankan scatter plot untuk
# mengenalpasti outliers 
#
# Let's run the code 
# Select all below and press [CTRL] + [ENTER]



sel <- read.csv("C:/XXXXXX/Training_R_GIA/data/location_date2rcv_inven.csv")

summary(sel)
library(ggplot2)

# graph 1 
selgraph <- ggplot(sel, aes(x=Equipment_Year_Received, y=Total_Equipment,fill=Location)) + geom_point(shape=1,position=position_jitter(width=1,height=.5)) + geom_smooth(method="auto")

selgraph + aes(group=1)

# graph 2 
selgraphic <- ggplot(sel, aes(x=Equipment_Year_Received, y=Total_Equipment,color=LOB)) + geom_point(shape=2,position=position_jitter(width=4,height=.5)) + geom_smooth(method="auto")

selgraphic + aes(group=1) + ggtitle("Total Equipment based on year of received \n found in IPVPN transit store located in LG2, Menara TM")

+ scale_x_discrete(limits=c("2001","2003","2005","2007","2009","2011","2013","2015"))

# graph 3 
selgraphicPO <- ggplot(sel, aes(x=Equipment_Year_Received, y=Total_PO_Value,color=LOB)) + geom_point(shape=1,position=position_jitter(width=1,height=.5)) + geom_smooth()

selgraphicPO + aes(group=1) + ggtitle("MY TITLE")

