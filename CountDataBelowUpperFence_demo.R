##Question: How to I find how many data points are 
#### less than the upper fence of these Pepper Prices?
#### lets do it with black pepper
load("PepperPrice.Rdata")

summary(PepperPrice) ## find Q1 and Q3 of black pepper
Q1 <- 1292 ## storing variables along the way makes code easier
Q3 <- 2382 ##### to keep track of
IQR <- Q3-Q1
UpperFence <- 1.5 * IQR + Q3
black <- PepperPrice$black ## use $ to isolate a column of your data
sum(black < UpperFence) ## why does this work? remove sum() and see what 
                      ### is printed in your console. True --> 1 False-->0