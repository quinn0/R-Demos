#+eval=FALSE
install.packages(c("tidyverse", "tidycensus", "reshape", "hrbrthemes"))

library("tidycensus")
library("tidyverse")
library("reshape")
library("ggplot2")
library("hrbrthemes")
library("data.table")

setwd("G:\\.shortcut-targets-by-id\\1dbde-cCHxc3zv56Y1-KzqhMUVB9mFOO9\\New RS1\\R Files\\Units 2+3 Project Files\\")


## Q: 4eaa446396f3865137b81dc72e9cbbd6971ef980
census_api_key("API KEY", install=TRUE, overwrite = T)

#Pull variable data into dataframe. Notice the "geography" is "zcta," which is the Census Bureau's equivalent of a ZIP Code. 
#state="VA" variable helps limit the scope of our data to just VA, otherwise it will download all US. 
male_and_female_VA_teachers <- get_acs(key = "API KEY",
                                       geography = "zcta",
                                       state="VA",
                                       variables=c("C24010_014", "C24010_050"),
                                       year=2019) %>% as.data.table %>% 
                                .[variable == "C24010_014", variable := "Male_Teachers"] %>% 
                                .[variable == "C24010_050", variable := "Female_Teachers"] 
  
                              
# male_and_female_VA_teachers[male_and_female_VA_teachers== "C24010_014"]<- "Male_Teachers"
# male_and_female_VA_teachers[male_and_female_VA_teachers== "C24010_050"]<- "Female_Teachers"
## data.table way in piping above


wide_VA_Teachers<- cast(male_and_female_VA_teachers, GEOID+NAME ~ variable, value="estimate") %>% 
  #I would do the same thing in data table^^^^^^^^^
  .[, Total_Teachers := Male_Teachers + Female_Teachers]

#wide_VA_Teachers <- wide_VA_Teachers %>%
 # mutate(Total_Teachers= Male_Teachers+ Female_Teachers)
###Data table way shown in the above piping

load("below_100.rdata")

VA_teachers_and_below_100 <- as.data.table(merge(wide_VA_Teachers, below_100, by = c("GEOID", "NAME")))

#VA_teachers_and_below_100 <- VA_teachers_and_below_100[,-c(2,6,9)] %>% 
                      ##column selection is the same in data.table ^^^ though can also reference by name

VA_teachers_and_below_100[VA_teachers_and_below_100== "estimate"]<- "below_100"
#I'm not sure what this is meant to do'
## if trying to change the column names use the ?setnames function

save(VA_teachers_and_below_100, file="VA_teachers_and_below_100")

x<- VA_teachers_and_below_100$Total_Teachers
y<- VA_teachers_and_below_100$estimate ### originally estomate but we changed the name to below_100

plot(x, y, main="Scatter Plot of Education Sector Jobs vs People living below 100% Poverty Level, by ZCTA")
reg_line<- lm(y~x)
summary(reg_line)
abline(reg_line, col="blue")

plot(reg_line$residuals)


Male_Teachers<- wide_VA_Teachers$Male_Teachers
###equivalent but just noting you can also do wide_VA_Teachers[, Male_Teachers] to the same effect
Female_Teachers<- wide_VA_Teachers$Female_Teachers

#Unsurprising. Linear regression of male teachers vs female teachers.
plot(Male_Teachers, Female_Teachers, main="Unsurprising Graph: the more female teachers there are, the more male teachers there are too!")
reg_line<- lm(Female_Teachers ~ Male_Teachers)
summary(reg_line)
abline(reg_line, col="red")

plot(reg_line$residuals, main="Residual Plot of Male vs. Female Teachers Linear Model")

stacked_histo <- male_and_female_VA_teachers %>%
  ggplot( aes(x=estimate, fill=variable)) +
  geom_histogram(color="#e9ecef", alpha=.6, position = 'dodge', bins=11) +
  scale_fill_manual(values=c("#69b3a2", "#404080")) +
  theme_ipsum() +
  labs(fill="", title="Stacked Histogram of Male vs Female Teachers in VA", x="Number of Teachers in ZCTA", y="Count")+
  scale_y_continuous(breaks=c(seq(0,30, by=5), seq(50, 200, by=50), seq(200,1000, by=200)),trans="pseudo_log")

print(stacked_histo)

6
overlapped_histo <- wide_VA_Teachers %>%
  ggplot()+
  geom_histogram(aes(x=Male_Teachers), fill="#f54242", color="black", alpha=.6, bins=12, position='identity') +
  geom_histogram(aes(x=Female_Teachers), fill="#003399", color="black", alpha=.6, bins=12, position='identity')+
  labs(fill="", title="Stacked Histogram of Male vs Female Teachers in VA", x="Number of Teachers in ZCTA", y="Count")+
  scale_y_continuous(breaks=c(seq(0,30, by=5), seq(50, 200, by=50), seq(200,1000, by=200)),trans="pseudo_log")


print(overlapped_histo)


