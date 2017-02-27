# Author : Ahmad Fairuz Ali
# date : 14 February 2017
# Description: 
#
# Trending 
#
#
# Let's run the code 
# Select all below and press [CTRL] + [ENTER]



revisedRFSordersduetoTMallStatus <- read.csv("C:/XXXXXX/Desktop/Training_R_GIA/data/revised_RFS_525_dueToTM_all_status.csv")

View(revisedRFSordersduetoTMallStatus)

library(ggplot2)
library(scales)

cr <- qplot(ORIGINAL_RFS_MONTH,gapsRevised_OrigRFS,data=revisedRFSordersduetoTMallStatus,geom=c("point","smooth"))

cr

cr <- ggplot(revisedRFSordersduetoTMallStatus, aes(x=ORIGINAL_RFS_MONTH, y=gapsRevised_OrigRFS)) + geom_point(shape=1,position=position_jitter(width=1,height=.5)) + geom_smooth() 

cr

cr + aes(group=1) + theme(axis.title.x = element_text(face="bold", colour="#990000", size=10),axis.text.x  = element_text(angle=45, vjust=0.5, size=10)) + ggtitle("Total Gaps (Days) from Original RFS Date") + scale_x_discrete(limits=c("July-13","August-2013","September-2013","October-2013","November-2013","December-2013","January-2014","February-2014","March-2014","April-2014","May-2014","June-2014","July-2014","August-2014","September-2014","October-2014","November-2014","December-2014","January-2015","February-2015"))

cr + aes(group=1) + theme(axis.title.x = element_text(face="bold", colour="#990000", size=1),axis.text.x  = element_text(angle=45, vjust=0.5, size=1)) + ggtitle("Gaps in days from Original RFS date") + geom_text(data = revisedRFSordersduetoTM, aes(x=Revise_Ori,y=ORIGINAL_RFS_MONTH,label=ORIGINAL_RFS_MONTH),size=5,colour="red",angle=45,hjust=1,vjust=-1)

