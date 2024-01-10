#### SOFT WRAP LINES: Select Code >> Soft Wrap Lines (5th option)####

#### 1) Do an R Cleanse.#### 
# Click the broom icon in the top right hand corner of R, under the "Environment." Close out of all other tabs on the top left hand corner

####Load the Required Libraries####
library(tidyverse)


#### 2) Download the class_scores. load and view data #### 
load("~/class_scores.rdata")
View(class_scores)


#### 3) How Many Students are in each class? ####
sum(class_scores$Class == "A")
sum(class_scores$____ == ____)

##### 4) Calculate population mean for ALL Scores.####
mean(class_scores$______)

#### 5) Calculate sample mean, sample size = 20 #### 
SRS_sample <- sample_n(____, ___)
#How many of each class Now?
View(SRS_sample) 

### Calculate Sample mean of SRS_sample
mean(___$___)

#### 7) Subset Class Scores by Class A & B####
Class_A<- subset(class_scores, Class== "A")
Class_B<- subset(class_scores, Class== __)


#### 9) Use the subsets to create a stratified sample. ####
Class_A_Sample <- sample_n(Class_A, __)
Class_B_Sample <- sample_n(Class_B, __)

#### 10) Combine both Stratified datasets ####
stratified_class_sample<- rbind(Class_A_Sample, Class_B_Sample)

### Calculate THIS sample mean now and compare
mean(stratified_class_sample$Scores)


#### Blue Assignment: Your Turn! ####


#####Black Assignment: Stratify zip codes based on rural vs urban population.####

#### Copy your U3 Project code and download your data used from Censusreporter ####
library(tidycensus)

#### Population Parameters ####
mean(___ , na.rm = T)
sd(___, na.rm = T) * sqrt((dim(__)[1]-1)/dim(__)[1])

                          
#### SRS Sample ####


#####Subset my two dataframes into separate urban and rural, based on urban_zips####
load("~/urban_zips.rdata")

###Example of using %in% with subset####
cars_with_gears124or8<- subset(mtcars, gear %in% c(1,2,4,8))


