library("ggplot2")
resluts <- read.delim("Y:/Bu/Bu Exome/ahus_exome/3_coverage/resluts.txt")
results=subset(resluts,select=c("SampleID","ReadsTotal","ReadsOverlappingTarget"))
results$unmap<-resluts$ReadsTotal-resluts$ReadsOverlappingTarget
results2=subset(results,select=c("SampleID","ReadsOverlappingTarget"))
library("reshape2")
results2=subset(results,select=c("SampleID","ReadsOverlappingTarget","unmap"))
results2.m=melt(results2,id.vars = "SampleID")
p<-ggplot(results2.m, aes(x = reorder(SampleID,value), y = value,fill=variable))+geom_bar(stat='identity')
p+xlab("aHUS WES Samples")+
  ylab("Number of Reads")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1, vjust=.5))+
  scale_fill_discrete(labels=c("Overlapping Target", "Off Target"))+
  guides(fill=guide_legend(title=NULL))+
  geom_hline(aes(yintercept=mean(resluts$ReadsOverlappingTarget)),linetype="dashed",size=0.5)
