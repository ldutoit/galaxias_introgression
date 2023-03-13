data<-read.table("~/allBBAA2.txt",h=T)
data<-data[-c(12,15,18),] # 13 15 for sets.txt, 12 15 for sets2.txt Those had a minimum D value not matching the trees, suggesting possible incongruence on the tree
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

wilcox.test(data$Dstatistic[11:15],(data$Dstatistic[6:10])) # past contact vs allopatry
W = 4, p-value = 0.09524


wilcox.test(data$Dstatistic[1:5],(data$Dstatistic[11:15])) # sympatry vs allopatry
W = 22, p-value = 0.05556


wilcox.test(data$Dstatistic[1:10],(data$Dstatistic[11:15])) # past contact and sympatry V allopatry
W = 43, p-value = 0.02797


###With overlaps measurements from Jon

data_overlap<-read.table("~/Desktop/allBBAA.j.txt",h=T)
pdf("overlap_all_comp.pdf")
plot(data_overlap$overlap,data_overlap$Dstatistic,pch=19,xlab = "Overlap",ylab="D statistic")
model<- lm(data_overlap$Dstatistic~data_overlap$overlap)
abline(model) 
legend("topleft",paste("R2 =",round(as.numeric(summary(model)[8]),3),"; p =",round(as.numeric( (summary(model)$coefficients[8])),3)))
dev.off()

#Pearson's product-moment correlation
#
#data:  data_overlap$overlap and data_overlap$Dstatistic
#t = 2.5437, df = 13, p-value = 0.02448
#alternative hypothesis: true correlation is not equal to 0
#95 percent confidence interval:
#0.09111036 0.84052206
#sample estimates:
#cor 0.576468 

summary(lm(data_overlap$Dstatistic~data_overlap$overlap))


#Call:
#  lm(formula = data_overlap$Dstatistic ~ data_overlap$overlap)#

#Residuals:
#  Min       1Q   Median       3Q      Max 
#-0.13797 -0.03280 -0.00567  0.05191  0.12767 #

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)           0.14073    0.03164   4.448 0.000657 ***
#  data_overlap$overlap  0.03286    0.01292   2.544 0.024484 *  
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1#

#Residual standard error: 0.08659 on 13 degrees of freedom
#Multiple R-squared:  0.3323,	Adjusted R-squared:  0.281 
#F-statistic:  6.47 on 1 and 13 DF,  p-value: 0.02448

data_overlap<-data_overlap[-which(data_overlap$overlap==0),]
cor.test(data_overlap$overlap,data_overlap$Dstatistic)

#     Pearson's product-moment correlation#

#data:  data_overlap$overlap and data_overlap$Dstatistic
#t = 1.2925, df = 8, p-value = 0.2323
#alternative hypothesis: true correlation is not equal to 0
#95 percent confidence interval:
# -0.2898632  0.8284506
#sample estimates:
#      cor 
#0.4156151 #

summary(lm(data_overlap$Dstatistic~data_overlap$overlap))#

#Call:
#lm(formula = data_overlap$Dstatistic ~ data_overlap$overlap)#

#Residuals:
#      Min        1Q    Median        3Q       Max 
#-0.132660 -0.019481 -0.006716  0.067443  0.100620 #

#Coefficients:
#                     Estimate Std. Error t value Pr(>|t|)  
#(Intercept)           0.17486    0.05339   3.275   0.0113 *
#data_overlap$overlap  0.02300    0.01780   1.292   0.2323  
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1#

#Residual standard error: 0.08422 on 8 degrees of freedom
#Multiple R-squared:  0.1727,  Adjusted R-squared:  0.06933 
#F-statistic:  1.67 on 1 and 8 DF,  p-value: 0.2323

pdf("overlap_comp_noallopatry.pdf")
plot(data_overlap$overlap,data_overlap$Dstatistic,pch=19,xlab = "Overlap",ylab="D statistic")
model<- lm(data_overlap$Dstatistic~data_overlap$overlap)
abline(model) 
legend("topleft",paste("R2 =",round(as.numeric(summary(model)[8]),3),"; p =",round(as.numeric( (summary(model)$coefficients[8])),3)))
dev.off()
