library(data.table)
library(dplyr)
library(tidycensus)
#from 2010 census but accurate enough representation 
totes_pops <- fread("Zipcode-ZCTA-Population-Density-And-Area-Unsorted.csv") %>%
                      setnames("Zip/ZCTA" , "NAME") %>% 
                        .[, NAME := as.character(NAME)]
  
#NAME != "ZTCA"
PopulousZips <- get_acs(geography="zcta",
                        state="VA", 
                        variables=c("B01001_001"),
                        year = 2019) %>% as.data.table %>% 
                .[, .(NAME)] %>% 
                .[, NAME := unlist(strsplit(NAME, " "))[seq(2,dim(.)[1]*2,by = 2)]] %>% 
                  merge(totes_pops, ., by= "NAME") %>% 
                .[order(`Density Per Sq Mile`,decreasing = T)] %>% 
                .[`Density Per Sq Mile` >= quantile(`Density Per Sq Mile`, .9)] 
zips <- PopulousZips$NAME

big_outlier_zip <- PopulousZips[`Density Per Sq Mile` > 50000, NAME] 

##This is Farmville VA where there's a big university driving that population density

