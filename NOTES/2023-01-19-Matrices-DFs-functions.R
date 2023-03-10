###### Finishing up Matrices ond Data Frames
###### 19 January
###### LVA

m <- matrix(data = 1:12, nrow=3)

## subsetting based on elements
m[1:2, ]
m[, 2:4]

## subset with logical (conditional) statements
## select all columns for which the totals are > 15

colSums(m) > 15 #totals up elements in columns, gives logical output for sums > 15
m[, colSums(m) >15]

## rows sums now
## select rows that sum up to 22
m[rowSums(m)==22,] # rows with sums that equal 22
m[rowSums(m)!=22,] # rows whose sums do not equal 22

### Logical operators: ==, !=, >, <

## subsetting to a vector changes the data type
z <- m[1,]
print(z)
str(z)

z2 <- m[1, , drop=FALSE]
z2

# simulate new matrix
m2 <- matrix(data=runif(9), nrow=3)
m2
m2[3,2] #counts down columns NOT across rows


### use assignment operator to substitute values
m2[m2 > 0.6] <- NA
m2 

data <- iris
head(data)
tail(data)

data[3,2] # numbered indices still work

dataSub <- data[c("Species", "Petal.Length")]
str(dataSub)

#### sort a data frame by values
orderedIris <- iris[order(iris$Petal.Length), ]
head(orderedIris)

########## FUNCTIONS in R!!
sum(3,2) # sum
3 + 2 # '+' sign is a function
sd

### User-defined functions

#functionName <- "fucntion(argX=defaultX, argY=defaultY){
  ## curly brackets starts the body of the function 
  ### Lines of R code ### and notes
  ### create local variables (only 'visible' to R within the function
  #argX <- c("IDK")
  ### return(z) (within a function we cannot use the 'print' function; if you return a variable and save it to a folder, then you can access it in the global environment outside the function)
#}

myFunc <- function(a=3, b=4){
 z<- a+b
 return(z)
}
myFunc() # runs defaults
z <- myFunc()
myFunc(a=100, b=3.4)
b <- 50 # define anything in the global environment above your function
myFuncBad <- function(a=3){
  z<- a+b
  return(z)
}
myFuncBad() # error, object b not found
z

#### Multiple return statements

############################################################
# FUNCTION: HardyWeinberg
# input: all allele frequency p (0,1)
# output: p and the frequencies of 3 genotypes AA AB BB
#--------------------------------------------------------
HardyWeinberg <- function(p= runif(1)){
  if(p > 1.0 | p < 0.0){
    return("Function failure: p must be between 0 and 1")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p, AA=fAA, AB=fAB, BB=fBB
), digits=3)
  return(vecOut)
}
###########################################################

HardyWeinberg()
freqs <- HardyWeinberg()
freqs

### Create a complex default value
##################################
# FUNCTION: fitLinear2
# fits simple regression line 
# input: numeric vector (p) of predictor (x) and response (y)
# outputs: slope and p-value

fitLinear2 <- function(p=NULL){
  if(is.null(p)){
    p <- list(x=runif(20), y=runif(20))
  }
  myMod <- lm(p$x~p$y)
  myOut <- c(slope = summary(myMod)$coefficients[2
    ,1],
                   pValue = summary(myMod
)$coefficients[2,4])
  plot(x=p$x, y=p$y) #quick plot to check output 
  return(myOut)
}
fitLinear2() 
myPars <- list(x=1:10, y=runif(10))
fitLinear2(p=myPars)
