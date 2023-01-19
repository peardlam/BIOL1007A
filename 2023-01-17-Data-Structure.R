##### Vectors, Matrices, Data Frames, and Lists
##### 17 January 2023


##### Vectors (cont'd)
##### Properties

## Coercion

### All atomic vectors are of the same data type
### If you use c() to assemble different types, R coerces them
### logical -> integer -> double -> character

a <- c(2, 2.2)
a #coerces to double

b <- c("purple", "green")
typeof(b)

d <- c(a,b)
typeof(d)

### comparison operators yeild a logical result
a <- runif(10) # simulates random uniform numbers in a range of values between 0 and 1
print(a)

a > 0.5 # conditional statement 

### How many elements in the vector are > 0.5
sum(a > 0.5)
mean(a > 0.5) # what proportion of vector are greater than 0.5


#### Vectorization
## add a constant to a vector

z <- c(10, 20, 30)
z + 1 # adds 1 to each element of the vector

## What happens when vectors are added together?
y <- c(1, 2, 3)

z + y # results in an "element by element" operation on the vector

z^2

## Recycling
# what if vector lengths are not equal?

z
x <- c(1,2)
z + x # warning issue but calculation is still made   
# shorter vector is always recycled

#### Simulating data: runif and rnorm()

runif(n=5, min=5, max=10) # n is the sample size, min = minimum value, max = maximum value

set.seed(111) # set.seed can be any number, sets random generator (is reproducible)
runif(n=5, min=5, max=10)

hist(runif(n=100, min=5, max=100))

## rnorm: random normal values with mean 0 and sd 1.   

randomNormalNumbers <- rnorm(100)
mean(randomNormalNumbers) # hist function shows distribtion

rnorm(n=100, mean=100, sd=30)
hist(rnorm(n=100, mean=100, sd=30))

##### Matrix data structure
### 2 dimensional (rows and columns)
### homogenous data type

# matrix is an atomic vector organized into rows and columns
my_vec <- 1:12

m <- matrix(data = my_vec, nrow=4)
m

m <- matrix(data = my_vec, ncol=3)
m

m <- matrix(data= my_vec, ncol=3, byrow=T)
m

#### Lists
## these are atomic vectors BUT each element can hold different data tyeps (and different sizes)

myList <- list(1:10, matrix(1:8, nrow=4, byrow=TRUE), letters[1:3], pi)
class(myList)
str(myList)

### subsetting lists
## using [] gives you a single item BUT not the elements
myList[4]
myList[4] - 3 # single bracket gives you only elements in the slot which is only type list

# to grab object itself use [[]]
myList[[4]]
myList[[4]] - 3 # now we access contents only in that part

myList[[2]] # we can access different parts of the matrix
myList[[2]][4,1] ## 2 dimensional subsetting, -> first number is row index, second is column [4,1] gives 4th row, first column

myList[c(1,2)] # to obtain multiple compartments of the list use single brackets

### Name list items when they are created
myList2 <- list(Tester = FALSE, littleM = matrix(1:9, nrow=3))
myList2$Tester

myList2$littleM[2,3] #extracts second row, thir column of littleM

myList2$littleM[2,] #leave blank if you want all elements [2,1] = second row, all columns

myList2$littleM[2] #gives second element

### unlist to string everything back to vector
unRolled <- unlist(myList2)
unRolled


data(iris)
head(iris)
plot(Sepal.Length ~ Petal.Length, data=iris)
model <- lm(Sepal.Length ~ Petal.Length, data=iris)
results <- summary(model)
results
class(results)
typeof(results)
str(results)
results$coefficients
results$coefficients[2,4]
unlist(results)
unlist(results$coefficients[2,4])
unlist(results$coefficients)
unlist(results)$coefficients8

### Data frames 
## (list of) equal-lengthed vectors, each of which is a column

varA <- 1:12
varB <- rep(c("Con", "LowN", "HighN"), each=4)
varC <- runif(12)

dFrame <- data.frame(varA, varB, varC, stringsAsFactors = FALSE)
str(dFrame)

# add another row
newData <- list (varA=13, varB="HighN", varC=0.668)

# use rbind()
dFrame <- rbind(dFrame, newData)

### why can't we use c?
newData2 <- c(14, "HighN", 0.668) # coerces to charater
dFrame <- rbind(dFrame, newData2) #all character data types now!

### add a column
newVar <- runif(14)

# us dim() to check rows and columns

# use cbind() function to add column
dFrame <- cbind(dFrame, newVar)
head(dFrame)

### Data framez vs Matrices
zMat <- matrix(data=1:30, ncol=3, byrow=T)
zDframe <- as.data.frame(zMat)

str(zDframe)

zMat[3,3]
zMat [,3]
zMat[3] # gives third element from first column (top to down)
zDframe[3] # different !! whole third row is given

##### Eliminating NAs
# complete.cases() function
zD <- c(NA, rnorm(10), NA, rnorm(3))
complete.cases(zD) # gives logical output

# clean out NAs
zD[complete.cases(zD)]
which(!complete.cases(zD))
which(is.na(zD))
m[1,1] <- NA
m
m[5,4] <- NA

complete.case(m) #gives T/F as to whether whole row is 'complete' (no NAs)
m[complete.cases(m),]

## get complete cases for only certain rows
m[complete.cases(m[,c(1:2)]),]











