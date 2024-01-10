caps<- c(rep(0, times=5), 1)
trials<- replicate(20000, sample(caps, 7, replace=TRUE))
wins<- colSums(trials)
table(wins)
hist(wins, breaks=c(0:6))


letters <- c("H", "E", "L", "L", "O")





sample(letters, 5, replace=F)

shuffle <- replicate(100, sample(letters, 5, replace=F))

scrabble<- c(rep("v", times=42), rep("c", times=58))
draws<- replicate(100, sample(scrabble, 7, replace=F))



scrabble<- c(rep("V", 42), rep("C", 56), rep("B", 2))

scrabble<- c(rep(1, times=42), rep(0, times=58))


draw<- replicate(10000, sample(scrabble, 7, replace=FALSE)) 
### I did not know replicate(). been reinventing the wheel in one form or another
##### for the 4 years doh! 
melty_draw<-melt(draw)
pivot_draw <-dcast(Var2 ~Var1, data=melty_draw)




vcount<- colSums(draw)
table(vcount)


###Quinn counts Hello's here 
letters <- c("H", "E", "L", "L", "O")
sample(letters, 5, replace = T)
#my response to replace = T:
# sampling with replacement but order matters if dealt L -> R in scenario
# we are finding permutations of a hand replace = F

hellos <- replicate(100, sample(letters, 5, replace = F)) 

glued <- apply(hellos, 2, paste0, collapse = "")
## in apply 2 designates column. lapply produces the same results but if I
#### used 1 instead of 2 would do row-wise operations which you might find useful

#just to demonstrate another function, which() 

which(glued == "HELLO") # return index or indices of occurrence

sum(glued == "HELLO") # return count of occurrence



