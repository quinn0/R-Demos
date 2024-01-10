#This code helps lets you view the data, 
#and read a description of the data.
View(InsectSprays)
names(InsectSprays)
?InsectSprays

#this code gives the boxplot for InsectSprays, 
#along with axes labels.
boxplot(count~spray, data=InsectSprays,
        main="Effectiveness of Insecticides",
        xlab="Insecticide Sprays",
        ylab="Number of Survived Insects")

#This Command gives the five number (median, Q1, min, max) summary
#of Insect Spray A. Repeat for the other sprays.
summary(InsectSprays[InsectSprays$spray=="A",]$count)

#This calculates standard deviation of Spray A in InsectSprays
sd(InsectSprays[InsectSprays$spray=="A", "count"])
mean(InsectSprays[InsectSprays$spray=="A", "count"])

#You can use the same code to create a histogram of any Spray (A, B, C, D...)
#Just replace "sd" with "hist"!
hist(InsectSprays[InsectSprays$spray=="A", "count"], 
     main="Insect Spray A Effectiveness",
     xlab= "Number of Bugs that Survive in each experiment",
     ylab= "Number of Trials")

#This Code makes a boxplot for world phones, but horizontally.
#boxplot(WorldPhones, horizontal=T)
View(InsectSprays)
##World Phones is a matrix so we can only select columns like this:
Oceania <- WorldPhones[, "Oceania"]

## To plot different groups of regions (selecting different columns)
boxplot(WorldPhones[ , c("N.Amer","Europe", "Asia")], horizontal=F)
boxplot(WorldPhones[ , c("S.Amer", "Oceania", "Africa","Mid.Amer")], horizontal=F)


#### If you want to Plot World Phones by year####
## add years as a variable
years <- as.numeric(row.names(WorldPhones))
#bind column/variable to dataset
PhonesByYear <- cbind(years, WorldPhones)

####GGPLOT EXAMPLE####
##Selecting more than one column
Oceania_years <- PhonesByYear[,c("years","Oceania")]
library(ggplot2)
### data must be a data.frame to use ggplot
Oceania_years <- as.data.frame(Oceania_years)
ggplot() + geom_col(data = Oceania_years, 
                    mapping = aes(x = years, 
                                  y = Oceania))
