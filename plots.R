data<-read.table("~/allBBAA.txt",h=T)
data<-data[-c(13,15),] # Those had a minimum D value not matching the trees, suggesting possible incongruence on the tree
plot(data)
colnames(data)
pdf("~/Galaxiasintro.pdf")
boxplot(data$Dstatistic~data$type,xlab= "type of contact", ylab="D statistic")
dev.off()

pdf("~/Galaxiasintrogg.pdf")
library("ggplot2")
ggplot(data = data, mapping = aes(x =type , y = Dstatistic)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato",pch=19,cex=4) +theme_bw()
dev.off()
