### Probability and statistics task 1 Part A: Coin Flips
library(dplyr)
library(data.table)

##Sample N = 100
N <- 100
s_100 <- data.table(flip = sample(c("heads","tails"), 100, replace = T)) %>% 
                      .[, score := 1*(flip == "heads")] %>% 
  write.csv(., "CoinFlipSample_100.csv", row.names = F)



#Sample N = 10,000

N <- 1000
s_10000 <- data.table(flip = sample(c("heads","tails"), 10000, replace = T)) %>% 
  .[, score := 1*(flip == "heads")] %>% 
  write.csv(., "CoinFlipSample_10000.csv", row.names = F)


flips_9 <- fread("CoinFlips_9.csv")
flips_25 <- fread("CoinFlips_25.csv")
flips_100 <- fread("CoinFlipSample_100.csv")
flips_10000 <- fread("CoinFlipSample_10000.csv")



dice_sum <- sample(6, 10000, replace = T) + sample(6, 100000, replace = T)
dice_dat <- data.table(roll = 1:length(dice_sum), sums = dice_sum)

fake_dat <- data.table(roll = 1:10000, sums = sample(2:12, 100000, replace = T))

true_dist <- ggplot() + geom_bar(dat = dice_dat, aes(x = sums, fill = stat(count))) + 
  scale_x_continuous(breaks = 1:12) + 
  scale_fill_gradient2(low = "darkblue", mid = "green", high = "orange", midpoint = 10000) +
  ylab("") +
  xlab("")+
  #ggtitle("Rolling a Pair of Dice:\n Likelihood of Resulting Roll") + 
  theme(title = element_blank(), 
        plot.title = element_blank()) +
  guides(fill = F)
  
  
fake_dist <- ggplot() + geom_bar(dat = fake_dat, aes(x = sums, fill = stat(count))) + 
  scale_x_continuous(breaks = 2:12) +
  ylab("") +
  xlab("Possible Outcomes") +
  guides(fill = FALSE)

grid.arrange(true_dist, fake_dist, 
             top = "Sum of a Pair of Dice:\ 
             Correct Number of Favorable outcomes?", left = "Sum of Dice Rolls")


  
  