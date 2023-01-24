### Entering the tidyverse
### 23 January 2023
### LVA

### tidyverse: collection of "opinionated" packages that share philosophy, grammar (or how the code is structured), and data structures

## Operators: symbols that tell R to perform different operations (between variables, functions, etc.)

## Arithmetic operators: + - * / ^ ~
## Assignment operator: <-
## Logical operators ! & |
## Relational operators: == != > < >= <=
## Miscellaneous operators: %>% (forward pipe operator) %in%

### only need to install packages once
library(tidyverse) #library function to load in packages

# dplyr: new(er) packages provides a set of tools for manipulating data sets
# specifically written to be fast
# individual functions that correspond to common operations

#### The core verbs
## filter()
## arrange()
## select()
## group_by() and summarize()
## mutate()


## built in data set
data(starwars)
class(starwars)
## Tibble; modern take on data frames
# great aspects of dfs and drops frustrating ones (change variables)
glimpse(starwars) #muchcleaner!

### NAs
anyNA(starwars) #is.na #complete.cases
starwarsClean <- starwars[complete.cases(starwars[,1:10]),]
starwarsClean
glimpse(starwarsClean)

### filter(): picks/subsets observations (ROWS) by their values

filter(starwarsClean, gender=="masculine" & height < 180 )
filter(starwarsClean, gender == "masculine" & height < 180 & height > 100) #multiple conditions for the same variable

filter(starwarsClean, gender == "masculine" | gender == "feminine")

#### %in% operator (matching); similar == but you can compare vectors of different length
#sequence of letters
a <- LETTERS [1:10]
length(a) #length of vector

b <- LETTERS[4:10]
length(b)

## output of %in% depends on first vector
a %in% b # are the elements in a also in b
b %in% a

# use %in% subset
eyes <- filter(starwars, eye_color %in% c ("blue", "brown"))
View(eyes)
eyes2 <- filter(starwars, eye_color == "blue" | eye_color == "brown")
View(eye2s)


## arrange(): reorders rows
arrange(starwarsClean, by=height) # default is ascending order
# can use helper function des() for desceding order
arrange(starwarsClean, by=desc(height))

arrange(starwarsClean, height, desc(mass)) #second variable used to break ties

sw <- arrange(starwars, by=height) 
tail(sw) #missing values are at the end

#### select(): chooses variables (COLUMN) by their names
select(starwarsClean, 1:10)
select(starwarsClean, name:species)
select(starwarsClean, -(films:starships))
starwarsClean[,1:11]

### Rearrange columns
select(starwarsClean, name, gender, species, everything()) #everything is a helper function useful is you have a couple of variables you wish to move to the front

# contains() helper function
select(starwarsClean, contains("color")) #other helper functions include ends_with(), starts_with(), num_range()

# select can also rename columns
select(starwarsClean, haircolor = hair_color) # returns only renamed column
rename(starwarsClean, haircolor = hair_color) # returns whole df

### mutate(): creates new variables using functions of existing variables
# let's create a new column that is height divide by mass
View(mutate(starwarsClean, ratio = height/mass))

starwars_lbs <- mutate(starwarsClean, mass_lbs = mass*2.2, .after=mass) #before/after #have to use . before argument
View(starwars_lbs)
starwars_lbs <- select(starwars_lbs, 1:3, mass_lbs, everything())
glimpse(starwars_lbs) #brought it to the front using select

# transmute function
transmute(starwarsClean, mass_lbs=mass*2.2) # only returns mutated columns
transmute(starwarsClean, mass, mass_lbs=mass*2.2, height)

### group_by() and summarize()
summarize(starwarsClean, meanHeight = mean(height)) #throws NA if any NAs are in df - need to use na.rm
summarize(starwarsClean, meanHeight = mean(height), TotalNumber = n())

# use group_by or maximum usefulness
starwarsGenders <- group_by(starwars, gender)
head(starwarsGenders)
head(starwarsGenders, 10)
summarize(starwarsGenders, meanHeight=mean(height, na.rm=TRUE), TotalNumber = n())

# Piping %>%
# used to emphasize a sequence of actions
# allows you to pass an intermediate result onto the next function (uses output of one function as input of the next function)
# avoid if you need to manipulate more than one obejct/variable at a time; or if variable is meaningful
# formatting: should have a space before the %>% followed by new line

starwarsClean %>%
  group_by(gender) %>%
  summarize(meanHeight=mean(height, na.rm =TRUE), TotalNumbers=n())

##### more complex coding:
## case_when() is useful for multiple if/ifelse statements
starwarsClean %>% 
  mutate(sp=case_when(species == "Human" ~ "Humans", TRUE ~ "Non-Human")) # uses condition, puts "Human" if























