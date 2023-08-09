###########################################################################
# Function: Comparison of the two matrixes using the Mantel test, Procuste test based on Ordination analysis (same sample Name is required) 
# Call: Rscript Matrixes_Comparison.R matrixA matrixB
# Last update: 2020-09-01, Zheng Sun 
###########################################################################

#setwd('./')

#Args input
#args=commandArgs(T)
#if(is.na(args[1])) stop("Please input the matrix A")
#if(is.na(args[2])) stop("Please input the matrix B")
#args[1] #input abundance table A
#args[2] #input abundance table B

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")
library(vegan)
library(Rtsne)
library(umap)
library(ape)
library(ade4)

input <- function(inputfile) {
   thefiles <<- readSequential(inputfile)
}

run <- function() {}

output <- function(outputfile) {
	pfix = prefix()
distA <- read.table(paste(pfix, thefiles[1], sep="/"),row.names = 1,header = T,sep="\t")
distB <- read.table(paste(pfix, thefiles[2], sep="/"),row.names = 1,header = T,sep="\t")


#p <- c("vegan","Rtsne","umap","ape","ade4")
#usePackage <- function(p) {
#  if (!is.element(p, installed.packages()[,1]))
#    install.packages(p, dep=TRUE, repos="http://cran.us.r-project.org/")
#  suppressWarnings(suppressMessages(invisible(require(p, character.only=TRUE))))
#}
#invisible(lapply(p, usePackage))
#=======Mantel test for the two distance table/matrixes 
AB_mantel <- mantel(distA,distB,method = "spearman", permutations = 9999, na.rm = TRUE)
print(paste("Mantel statistic r (based on Spearman) is ",AB_mantel$statistic,", p-value is: ",AB_mantel$signif,sep=""))
detach("package:vegan", unload=TRUE)
}



