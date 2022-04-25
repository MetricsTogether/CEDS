### Read through CEDS
library(pdftools)
library(tidyverse)
library(tidytext)

setwd("~/Metrics Together/CEDS")

txt <-pdf_data("NCNMEDD.pdf")

fun1 <- function(data,page){
  data[[page]]$text
}

alltext <- sapply(1:52,fun1,data=txt)
alltext <- unlist(alltext)
alltext <- as.tibble(alltext)
names(alltext) <- "word"
#alltext <- paste(alltext, collapse=" ")

## sentiment analysis
sen <- get_sentiments("afinn")

two <- left_join(alltext, sen)
twonique <- unique(two)


