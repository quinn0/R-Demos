
library(data.table)

plots <- data.table(c(4,7,6,5), c(29,31,27,32), c(94, 98, 92, 97), c(150,153,148,147))



stratify <- function(plots, row_col = "col"){
  sm <- sample(4,4, replace = T)
  if(row_col == "col") {
  avg <- mean(c(as.numeric(plots[,1][sm[1]]), 
                as.numeric(plots[,2][sm[2]]), 
                as.numeric(plots[,3][sm[3]]), 
                as.numeric(plots[,4][sm[4]])))
  }
  else{
    avg <- mean(c(as.numeric(plots[1,])[sm[1]], 
                  as.numeric(plots[2,])[sm[2]], 
                  as.numeric(plots[3,])[sm[3]], 
                  as.numeric(plots[4,])[sm[4]]))
  }
  return(avg)
}


Stratified_col <- replicate(30, stratify(plots))

Stratified_row <- replicate(30, stratify(plots, row_col = "row"))


comb <- list("By Column" = Stratified_col,
             "By Row" = Stratified_row)

stripchart(comb, method = "stack", 
           col = c("green", "red"),
           pch = 16)

# stripchart(Stratified_row, method = "stack")

