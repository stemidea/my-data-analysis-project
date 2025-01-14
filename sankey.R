n=10*sample(100,9) 


n
cancer = rep(paste0('c', 1:9), n)
table(cancer)
p=c(rep(paste0('p', 1:5), n[1:5]), sample(paste0('p', 1:5), sum(n[6:9]), replace = T))
table(p)
table(cancer,p)
library(gplots)
balloonplot(table(cancer, p))
library(vcd)
#install.packages("vcd")
dat <- table(cancer,p)
mosaic(dat, shade= T, legend=T)
df = data.frame(cancer, p)
head(df)
library(ggplot2)
library(ggalluvial)
install.packages("ggalluvial")
options(stringsAsFactors = F)
gg <- ggplot(df, aes(axis1 = cancer, axis2 = p))
gg
gg <- gg + geom_alluvium(aes(fill=as.factor(cancer)), width =2/5, discern =F)
pdf("gg.pdf")
gg
gg <- gg + geom_stratum(width = 2/5, discern = FALSE)
gg
gg <- gg + geom_text(stat = "stratum", discern = FALSE, aes(label = ..stratum..))
gg
gg <- gg + theme(legend.position = "none", 
                 panel.background = element_blank(),
                 axis.ticks = element_blank(), 
                 axis.text.y = element_blank(),
                 axis.text.x =element_text(size=15, colour = "black"),
                 axis.title = element_blank()) + scale_x_discrete(position = "top")
gg
pdf("gg.pdf", width = 6, height = 6, useDingbats = FALSE)
gg
dev.off()
