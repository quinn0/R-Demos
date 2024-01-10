
load("PepperPrice.Rdata")

boxplot(PepperPrice$black, horizontal = T, 
        main = "Descriptive title in context of the data", 
        xlab = "UNits")
