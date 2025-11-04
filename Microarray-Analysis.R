#Author: Anthony, Date: 09/16/2025, Purpose: Microarray analysis

#Install package affy
#Load package affy

library(affy)

#Reading sample microarray data
setwd("/Users/vajones/Desktop/data2")

#Read raw microarray data 
library(oligo)
cel_files <- list.celfiles("/Users/vajones/Desktop/data2", full.names = TRUE)
rawData <- read.celfiles(cel_files)

#Boxplot raw data
boxplot(exprs(rawData))

#Perform Normalization
normdata <- rma(rawData)

#Plot the normalized data
boxplot(normdata)

#Assume first 2 CEL files are cancer type and next 2 CEL files are normal/control

data2 <- exprs(normdata)
Treatment <- data2[,c(1:2)]
Control <- data2[,c(3:4)]


#Take average for treatments and controls
Treatment2 <- rowMeans(Treatment)
Control2 <- rowMeans(Control)  

#Fold change analysis to compare treatment with control
fold_change <- Treatment2-Control2

>2 = gene up-regulated and <-2 gene down-regulated