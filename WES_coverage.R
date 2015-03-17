library("ggplot2")
resluts <- read.delim("Y:/Bu/Bu Exome/Results/xml/resluts.txt")
results=subset(resluts,select=c("SampleID","BasesCovered1","BasesCovered10","BasesCovered30"))
results.m=melt(results,id.vars = "SampleID")
results.m
p<-ggplot(results.m, aes(x = reorder(SampleID,value), y = value,color=variable,group=variable))+geom_point()+geom_line()
p+xlab("aHUS WES Samples")+
  ylab("% Coverage")+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90, hjust=1, vjust=.5))+
  guides(color=guide_legend(title=NULL))+
  scale_color_discrete(labels=c("Bases covered 1X", "Bases covered 10X","Bases covered 30X"))
