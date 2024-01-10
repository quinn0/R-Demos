library(readr)
anime <- fread("anime.csv")  

###maybe I code a cleaning walkthrough?
# anime <- read_csv("anime.csv", col_types = cols(MAL_ID = col_number(), 
#                                                 Score = col_number(), Episodes = col_number(), 
#                                               Popularity = col_number(), 
#                                                 Members = col_number(), Favorites = col_number(), 
#                                                 Watching = col_number(), Completed = col_number(), 
#                                                 `On-Hold` = col_number(), Dropped = col_number(), 
#                                                 `Plan to Watch` = col_number(), `Score-10` = col_number(), 
#                                                 `Score-9` = col_number(), `Score-8` = col_number(), 
#                                                 `Score-7` = col_number(), `Score-6` = col_number(), 
#                                                 `Score-5` = col_number(), `Score-4` = col_number(), 
#                                                 `Score-3` = col_number(), `Score-2` = col_number(), 
#                                                 `Score-1` = col_number())) ## what is intended here ?
# 
#Examine any problems with the dataset. Notice that there are a lot of random problems where we treated a column as a numeric vector, but the actual data value was "Unknown" instead. R will convert the value to "NA," which is fine with us.
problems(anime)
#If you look, for some reason the "Genres" column is named "Genders." Let's rename to "Genres." 
View(anime)
#names(anime)[names(anime)=="Genders"] <- "Genres"
#data.table: 
setnames(anime, names(anime), "Genres")

#Verify that the column names are now correct.
names(anime)
#Save the new file as a R dataframe.
save(anime, file="anime.RData")

#This uses subsets all rows within the anime dataframe based on the condition in the brackets, and then saves it into a new dataframe called action_anime. The condition is satifised with the "grep" function, which will search for any character string and return "TRUE" if it contains "Action" within the column anime$Genres. 
#action_anime<- anime[grep("Action", anime$Genres), ]
action_anime<- anime[Genres %like% "Action"] ##like is super useful
## data..table dplyr biz

#view the d=ataframe. How many animes do you recognize? 
View(action_anime)
head(action_anime)

#We're interested in how people rated these animes. Let's calculate the score column for each. 
mean(action_anime$Score, na.rm=TRUE)
mean(anime$Score, na.rm=TRUE)

#Interesting! Let's isolate the score columns from both dataframes and store them as separate vectors. 
anime_score<- anime$Score
action_anime_score <- action_anime$Score

#Examine the boxplot. 
boxplot(anime_score, action_anime_score, 
        ylim=c(0,10),
        main= "Boxplot comparison of All Anime vs. Action Anime",
        xlab= "Rating",
        names=c("Anime", "Action Anime"),
        col=c("Red", "Green"),
        horizontal=TRUE,
        ann=TRUE)

#Looks like there's a difference. Action animes appear to be rated higher than the rest. Set the alternative hypothesis to be that the true average score of all animes is LOWER than the true average score for action animes. 
action_t_test <- t.test(anime_score, action_anime_score, alternative= "less", var.equal=TRUE)

#View the results. 
action_t_test

#Wow! There's a serious difference. Look at the p-value for that. Now we need to graph this. LEt's start by storing the degrees of freedom in a variable called action_t_test.
action_t_test_df<- length(anime_score) +length(action_anime_score) -2

#t_d_st_x_axis sets the x-axis. We're making a massive sequence 10^4 numbers long (so 10000 numbers) between -15.5 and 15.5. This helps fit in my massive test statistic of -14.34
t_dist_x_axis<- seq(-15.5, 15.5, length= 10^4)
plot(t_dist_x_axis, dt(t_dist_x_axis, df=action_t_test_df), 
     type='l', 
     xlab='t', 
     ylab='',
     main="The most ridiculous t-test graph ever",
     sub="Look at that test statistic in the dotted line. Just look.")
#I want to show how ridiculous this is. We're going to store the critical t* value of 0.01 in it's own variable, and plot that with red lines. 
crit_t_value_0.01<- qt(0.01, df=action_t_test_df)
abline(v=crit_t_value_0.01, col='red')
abline(v=-crit_t_value_0.01, col='red')

#Finally, plot the test statistic, using a dotted line. 
abline(v=action_t_test$statistic, lty=2)

