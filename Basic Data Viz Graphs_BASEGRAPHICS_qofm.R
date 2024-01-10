library(dplyr)
library(ggplot2)
library(hrbrthemes)
library(reshape2)
library(scales)

setwd("G:\\.shortcut-targets-by-id\\1dbde-cCHxc3zv56Y1-KzqhMUVB9mFOO9\\New RS1\\R Files\\Units 2+3 Project Files\\")

load("Combined_Teachers.rdata")

#### BASE Graphics Version 


single_hist_dat <- as.data.table(Combined_Teachers) %>% 
                                   .[,.N, by = "Male_Teachers"] %>% 
                                  .[, N := log10(N)]



par(ylog = F)



single_histo1 <- hist(as.data.table(Combined_Teachers) %>% 
                        .[Male_Teachers!= 0,Male_Teachers],
                      # beside = T, col = '#69b3a2', 
                      xlab = "Number of Teachers",
                      ylab = "Count", 
                      main = "Histogram of Male Teachers in the US") #%>% 
                
                            

####
#Creates Histogram of Male Teachers
single_histo <- Combined_Teachers %>%
  ggplot( aes(x=Male_Teachers))+
  geom_histogram(color='#69b3a2', alpha=0.6, binwidth=500)+
  scale_fill_manual(values=c("#69b3a2","#404080"))+
  #            ylim(c(0,200))+
  theme_ipsum()+
  labs(fill="", title="Histogram of Male Teachers in the US by ZCTA", 
       x="Number of Teachers", y="Count")+
  scale_y_log10()
print(single_histo)



#Creates Stacked Histogram of Male vs. Female Teacher Count
#Creates long dataframe. Required for ggplot2. 
longdf <- data.frame(
  Gender = c( rep("Male Teachers", 33120), rep("Female Teachers", 33120) ),
  value = c(Combined_Teachers$Male_Teachers, Combined_Teachers$Female_Teachers )
)
#Remove some outliers, to make it prettier
longdf[longdf<50]<- NA
longdf$value[longdf$value>1000] <-NA
dropped_na_longdf<- longdf[complete.cases(longdf), ]

#ggplot2 code to create stacked histogram
stacked_histo <- dropped_na_longdf %>%
  ggplot( aes(x=value, fill=Gender)) +
  geom_histogram(color="#e9ecef", alpha=.6, position = 'dodge', bins=10) +
  scale_fill_manual(values=c("#69b3a2", "#404080")) +
  theme_ipsum() +
  labs(fill="", title="Stacked Histogram of Male vs Female Teachers",sub="ZCTAs with fewer than 50 and more than 3000 teachers are dropped", x="Number of Teachers in ZCTA", y="Count")+
  scale_y_log10()

print(stacked_histo)


boxplot<- dropped_na_longdf %>%
  ggplot(aes(x=as.factor(Gender), y=value))+
  geom_boxplot(position="dodge2", outlier.colour="black", outlier.shape=19)+
  labs(title="Boxplot Comparing Male and Female Teachers Count", x="Gender", y="Number of Teachers per ZCTA")+
  theme_light()

print(boxplot)         

#Create a long df that does percentages
longdf_percent <- data.frame(
  Gender = c( rep("Male Teachers", 33120), rep("Female Teachers", 33120) ),
  Value = c(Combined_Teachers$Male_Percentage, Combined_Teachers$Female_Percentage )
)

#stacked_dotplot
stacked_dotplot<-longdf_percent %>%
  ggplot(aes(x=Value,
             fill=as.factor(Gender)))+
  geom_dotplot(dotsize=0.1)+
  labs(title="Dotplot of male vs. female teacher percentage", x="Percentage",fill="Gender")+
  scale_y_log10(limits=c(1,1000))+
  scale_x_continuous()+
  theme_ipsum()

print(stacked_dotplot)

