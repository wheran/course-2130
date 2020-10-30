# Title     : TODO
# Objective : TODO
# Created by: Ilya
# Created on: 10/30/2020

# Title     : Lecture 1
# Objective : Base R syntax
# Created by: Ilya
# Created on: 10/29/2020


# Типы данных
# logical
print(class(TRUE))
print(class(FALSE))

# numeric
print(class(23))
print(class(2.2))

# integer
print(class(2L))

# complex
print(class(2 + 2i))

# character
print(class('Hi'))
print(class("Hi"))

# raw
print(class(as.raw(12)))
print(class(charToRaw('Hello')))


# Combine Values into a Vector or List
c(1, 2, 3)

1:3

seq(1, 3, by = 1)

rep(1:3, times = 1)

c(c(1, 2), c(3, 4))

# Access to elements
x <- 1:10

x[1]  # In R we are starting from 1 instead of 0 in Python
x[-1]  # Different from Python. We get all number except 1
x[2:4]  # Get a slice
x[-(2:4)]  #
x[c(1, 5)]  # Get values by mask

x[x == 4]
x[x < 0]
x[x %in% c(1, 2, 3)]

a <- c(1, 2, 3, apple = 4)
a['apple']

# Functions
sort(x, decreasing = TRUE)

table(x)  # See counts of values

rev(x)  # Return x reversed

unique(x)  # See unique values


# Matrices
m <- matrix(x, nrow = 2, ncol = 5)
m

m[2,]  # select row
m[, 1]  # select column
m[2, 1]  # select element

t(m)

m %*% t(m)

solve(matrix(1:4, nrow = 2, ncol = 2), matrix(1:4, nrow = 2, ncol = 2))

# Lists
a <- list(x = 1:10, y = c('a', 'b'))
a

a[[2]]  # Second element of list
a[2]  # New list with only the second element
a$x  # element named x
a['y']  # new list with only element named y

# Factor
factor(c('python', 'C++', 'R', 'R', 'C++', 'python'))

factor(c('python', 'C++', 'R', 'R', 'C++', 'python'), levels = c('R', 'python', 'C++'), ordered = TRUE)



# Data Frame
df <- data.frame(x = 1:3, y = c('a', 'b', 'c'))
df

head(df, n = 2L)

df$x
df[[2]]
df[, 2]
df[2,]
df[2, 2]

nrow(df)  # number of rows
ncol(df)  # number of columns
dim(df)  # dimension. In `numpy` or `pandas` from Python it's .shape

cbind(df, df)  # bind columns
rbind(df, df)  # bind rows

# Math
11 + 2
11 - 2
11 * 2
11 / 2
11^2
144^(1 / 2)
11 %% 2  #
11 %/% 2  # integer division

log(11)
exp(11)
max(c(1, 2))
min(c(1, 2))
round(1.3213231111, digits = 2)
signif(1.2291313213, digits = 2)
cor(c(1, 2, 3), c(2, 4, 6))
sum(c(1, 2, 3))
mean(c(1, 2, 3))
median(1:10)
quantile(rep(1:10, 2))
rank(1:4)
var(1:10)
sd(1:10)

# Conditions
1 == 1
1 != 1
1 > 1
1 < 1
1 >= 1
1 <= 1
is.na(NA)
is.null(NULL)

# how to use help
help.start()

help('ifelse')
?ifelse

help.search('linear models')
??linear

# NA and NULL
class(NA)
class(NULL)

as.numeric('12')
# ...


# If statement
if (1 == 1) {
  print('Hello')
}

# ...

# For loop
for (i in 1:10) {
  print(i)
}

# while loop
i <- 1
while (i <= 10) {
  print(i)
  i <- i + 1
}


# functions
my_function <- function (input) {
  print(input)
  return(input)
}

my_function(10)

