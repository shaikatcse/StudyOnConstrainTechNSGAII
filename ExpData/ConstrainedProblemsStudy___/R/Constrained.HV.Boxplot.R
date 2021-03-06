#postscript("Constrained.HV.Boxplot.eps", horizontal=FALSE, onefile=FALSE, height=8, width=12, pointsize=10)
pdf("combined_comparison.pdf", onefile=FALSE, width=8.5, height = 6)
resultDirectory<-"../data/"
qIndicator <- function(indicator, problem)
{
fileNSGAII<-paste(resultDirectory, "NSGAII", sep="/")
fileNSGAII<-paste(fileNSGAII, problem, sep="/")
fileNSGAII<-paste(fileNSGAII, indicator, sep="/")
NSGAII<-scan(fileNSGAII)

fileNSGAIISR<-paste(resultDirectory, "NSGAIISR", sep="/")
fileNSGAIISR<-paste(fileNSGAIISR, problem, sep="/")
fileNSGAIISR<-paste(fileNSGAIISR, indicator, sep="/")
NSGAIISR<-scan(fileNSGAIISR)

fileNSGAIIATM<-paste(resultDirectory, "NSGAIIATM", sep="/")
fileNSGAIIATM<-paste(fileNSGAIIATM, problem, sep="/")
fileNSGAIIATM<-paste(fileNSGAIIATM, indicator, sep="/")
NSGAIIATM<-scan(fileNSGAIIATM)

algs<-c("NSGAII","NSGAIISR","NSGAIIATM")
boxplot(NSGAII,NSGAIISR,NSGAIIATM,names=algs, notch = FALSE)
titulo <-paste(indicator, problem, sep=":")
title(main=titulo)
}
par(mfrow=c(2,5))
indicator<-"HV"
qIndicator(indicator, "ConstrEx")
qIndicator(indicator, "Tanaka")
qIndicator(indicator, "Srinivas")
qIndicator(indicator, "Binh2")
qIndicator(indicator, "Osyczka2")

indicator<-"Epsilon"
qIndicator(indicator, "ConstrEx")
qIndicator(indicator, "Tanaka")
qIndicator(indicator, "Srinivas")
qIndicator(indicator, "Binh2")
qIndicator(indicator, "Osyczka2")

dev.off()