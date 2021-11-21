library(dplyr)
rm(list=ls())

# Set working directory as needed
setwd("./")
con <- file("./file19.txt", "r")
line=readLines(con,n=1)
isAddTable = FALSE
table <- matrix(nrow = 0, ncol = 1)
while( length(line) != 0 ) {
  if(grepl(pattern = "Name",x = line) && !grepl(pattern = "#",x = line)){
    isAddTable = TRUE
  }
  if(isAddTable){
    str <- ""
    for(item in strsplit(line,split = " ")){
      #print(item)
      if(length(item) > 1 && !grepl(pattern = " ",x = item)){
        str <- paste0(str,item)
        print(item)
      }else if(length(item) == 1 && !grepl(pattern = " ",x = item)){
        str <- paste0(str,",",item)
      }
    }
    #print(str)
    #table <- rbind(table, )
  }
  line=readLines(con,n=1)
}
close(con)