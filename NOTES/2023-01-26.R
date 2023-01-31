##### Lecture 8: Loading in Data
##### 26 January 2023
##### LVA

### Create and save a dataset:
### write.table(x=varName, file"outputFileName.csv", header=TRUE, sep=",") - allows you to specify characters


### These functions read in a data set
### read.table(file="path/to/data.csv", header=TRUE, sep = ",")
### read.csv(file="data.csv", header=T)

#### Use RDS object when only working in R. Helpful with large datasets
## saveRDS(my_data, file="FileName.RDS")
## readRDS("FileName.RDS")
## p<- readRDS("FileName.RDS")

### Long vs Wide data formats
### wide format = contains values that do not repeat in the ID column
### long format = contains values that DO repeat in the ID column

library(tidyverse)
glimpse(billboard)
b1 <- billboard %>% 
  pivot_longer(
    cols=starts_with("wk"), # specify which columns you want to make longer
    names_to = "Week", # name of new column which will contain the header names
    values_to = "Rank",# name of new column which will contain the values
    values_drop_na = TRUE # removes any rows where the valuws = NA
  )
View(b1) ## rmarkdown does NOT like this - remove if knitting

#### pivot_wider
### best for making occupancy matrix
glimpse(fish_encounters)

fish_encounters %>%
  pivot_wider(names_from = station, # which column you want to turn into multiple columns
              values_from = seen) # which column contains the values for new column cells
  
fish_encounters %>%
  pivot_wider(names_from = station,
              values_from = seen,
              values_fill = 0) # replaces NAs with 0s 

##### Dryad: makes research data freely reusable, citable, and discoverable

## read.table()
dryadData <- read.table(file="DATA/veysey_babbitt_data_buffers_and_amphibians2.csv", header = TRUE, sep=",")
glimpse(dryadData)  
head(dryadData)
table(dryadData$species)  # allows you to see different groups of character column
summary(dryadData$mean.hydro)
  
  
  
  
  

















