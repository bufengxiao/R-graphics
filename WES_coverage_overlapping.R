library("ggplot2")
library("reshape2")
resluts<- read.delim("Y:/Bu/Bu Exome/Results/xml/resluts.txt")
ggplot(resluts, aes(x = ReadsOverlappingTarget, y = BasesCovered1))+
  geom_point(color="red")+
  geom_point(aes(y=BasesCovered10),color="green")+
  geom_point(aes(y=BasesCovered30),color="blue")+
  xlab("Overlapping Target Reads")+
  ylab("Base Coverge")+
  theme_bw()
