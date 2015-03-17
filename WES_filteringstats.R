library("ggplot2")
variants<-c(5983375,4153632,448031,30809,7298)
#df<-data.frame(x=log(variants),y=log(variants))
#filter<-c("All","QC","Rare","Rare coding","Novel coding")
#df<-data.frame(var=log(variants),fil=filter)
df<-data.frame(x=sqrt(variants),y=sqrt(variants))
ggplot(df,aes(xmin = -x/2, xmax = x/2, ymin = 0, ymax = y,fill=factor(x)))+ 
  geom_rect(color="black",alpha=0.4)+
  scale_fill_brewer(palette="Blues")+
  annotate("text", x=0, y=sqrt(5983375)-90, label=" Number of total variants\n5,983,375")+
  annotate("text", x=0, y=sqrt(4153632)-90, label="Number of variants passed QC\n4,153,632")+
  annotate("text", x=0, y=sqrt(448031)-90, label="Number of rare variants\n448,031")+
  annotate("text", x=430, y=sqrt(30809)-30, label="Number of rare coding variants 30,809")+
  annotate("text", x=430, y=sqrt(7298)-120, label="Number of novel coding variants 7,298")+
  theme(axis.line=element_blank(),axis.text.x=element_blank(),
       axis.text.y=element_blank(),axis.ticks=element_blank(),
       axis.title.x=element_blank(),
       axis.title.y=element_blank(),legend.position="none",
       panel.background=element_blank(),panel.border=element_blank(),panel.grid.major=element_blank(),
       panel.grid.minor=element_blank(),plot.background=element_blank())
