load("~/PepperPrice.RData")


par(mfrow=c(2, 1)) #This tells R to plot all the following graphs by using 2 rows, and 1 column. 
stripchart(PepperPrice$black, method="stack", at=0, main="Price of Black Pepper")
stripchart(PepperPrice$white, method="stack", at=0, main="Price of White Pepper")
