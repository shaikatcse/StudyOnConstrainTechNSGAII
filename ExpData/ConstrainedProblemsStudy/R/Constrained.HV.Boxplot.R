postscript("Constrained.HV.Boxplot.eps", horizontal=FALSE, onefile=FALSE, height=4, width=10, pointsize=10)
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

algs<-c("NSGAIICDP","NSGAIISR","NSGAIIATM")
boxplot(NSGAII,NSGAIISR,NSGAIIATM,names=algs, notch = FALSE)
titulo <-paste(indicator, problem, sep=":")
title(main=titulo)
}
par(mfrow=c(2,3))
indicator<-"HV"
qIndicator(indicator, "CONSTREx")
qIndicator(indicator, "TNK")
qIndicator(indicator, "SRN")
qIndicator(indicator, "BNH")
qIndicator(indicator, "OSY")
qIndicator(indicator, "GLK")
