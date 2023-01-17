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
