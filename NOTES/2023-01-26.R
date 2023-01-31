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
DradData <- read.table(file="DATA/Data_set_dryad_2.csv", header=T, sep=",")
dryadData <- read.table(file="DATA/veysey_babbitt_data_buffers_and_amphibians2.csv", header = TRUE, sep=",")
glimpse(dryadData)  
head(dryadData)
table(dryadData$species)  ### allows you to see different groups of character column
summary(dryadData$mean.hydro)


dryadData$species<-factor(dryadData$species, labels=c("Spotted Salamander", "Wood Frog")) #creating 'labels' to use for the plot
str(dryadData$species)

class(dryadData$treatment)

dryadData$treatment <- factor(dryadData$treatment, 
                              levels=c("Reference",
                                       "100m", "30m"))

p<- ggplot(data=dryadData, 
           aes(x=interaction(wetland, treatment), # group treatment and wetland
               y=count.total.adults, fill=factor(year))) + geom_bar(position="dodge", stat="identity", color="black") +
  ylab("Number of breeding adults") +
  xlab("") +
  scale_y_continuous(breaks = c(0,100,200,300,400,500)) + ## y axis should be broken up by 100s
  scale_x_discrete(labels=c("30 (Ref)", "124 (Ref)", "141 (Ref)", "25 (100m)","39 (100m)","55 (100m)","129 (100m)", "7 (30m)","19 (30m)","20 (30m)","59 (30m)")) + # x-axis labels
  facet_wrap(~species, nrow=2, strip.position="right") +
  theme_few() + scale_fill_grey() + 
  theme(panel.background = element_rect(fill = 'gray94', color = 'black'), legend.position="top",  legend.title= element_blank(), axis.title.y = element_text(size=12, face="bold", colour = "black"), strip.text.y = element_text(size = 10, face="bold", colour = "black")) + 
  guides(fill=guide_legend(nrow=1,byrow=TRUE)) 
plot(p)

DryadData <- read.table(file="DATA/Data_set_dryad_2.csv",header = TRUE, sep=",", stringsAsFactors = TRUE)
  
  
  

















