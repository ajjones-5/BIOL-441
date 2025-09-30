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