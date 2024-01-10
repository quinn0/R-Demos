library(data.table)
library(dplyr)
###Read in CSV and format responses into numeric vector 
##outcomes <- fread("Pass the Pigs Results (Responses) - Form Responses 1.csv") %>% 
#                    .[,3:ncol(.)] %>% unlist(.) %>% as.numeric(.)

#my rolls actually worked out pretty well!
outcomes <- c(0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0)

LawOfLargePigs <- function(outcomes)
{ 
  n <- length(outcomes)
  
  cumul_prop <- cumsum(outcomes)/1:n
  
  plot(x = 1:n, y = cumul_prop, type = 'b', pch = 20, col = "purple", 
       main = "Cumulative Proportion of Razorbacks",
       xlab = "Toss", ylab = "Proportion", cex = 1.5, lwd = 2,
       xaxp = c(0,n,n))
  
}

LawOfLargePigs(outcomes)
