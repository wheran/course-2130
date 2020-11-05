# Title     : TODO
# Objective : TODO
# Created by: Ilya
# Created on: 11/4/2020


# matrix
m <- matrix(1:18, nrow = 3, ncol = 6)
m

matrix(1:18, nrow = 4, ncol = 6)

matrix(1:18, nrow = 4, ncol = 6, byrow = TRUE)

# masks
m[m[, 1] > 1, m[1, ] > 1]

# more complicated
m[m[, 1] > 1 | m[, 2] > 1, ]

m[m[, 1] > 1 & m[, 2] > 1, ]

#
m[m > 4]

# we can assign names
a <- 1:3
names(a)  # unname(...)
names(a) <- c('C++', 'Python', 'R')
a
a['C++']

# same for matrices
rownames(m) <- c('C++', 'Python', 'R')
# colnames ...
m[1, ]
m['C++', ]

# List
a <- list(1:4, c('A', 'B', 'C'))

a

class(a[1])
class(a[[1]])


measure <- function(x, y) {
  return(abs(y - x))
}

my_list <- list(x=1, y=2, mesuare = measure)

my_list[['mesuare']](my_list[['x']], my_list[['y']])

# Removing elements
my_list[length(my_list)] <- NULL

x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
lapply(x, mean)

sapply(x, mean)

# data.frame

employees <- data.frame(
  employee_id = 1:6,
  employee_name = c('E', 'L', 'H', 'P', 'E', 'M'),  # Eric, Leo, Helen, Piper, Emma, Maya
  salary = c(4400.34, 3900.5, 4500.2, 3900.5, 2599.1, 3800.12),

  start_date = as.Date(c('2020-10-01', '2020-09-01', '2020-10-01', '2020-10-01', '2020-10-01', '2020-10-01')),
  stringsAsFactors = FALSE
)

View(employees)  # dplyr

employees[, c('salary', 'start_date')]

employees[1:3, ]

order(employees[, 'salary'])

employees[order(employees[, 'salary']), ]

ordered_by_salary <- employees[order(-employees[, 'salary']), ]

class(employees[['start_date']])

format(employees[['start_date']], '%Y')

library('date')

date.mdy(employees[['start_date']])


# rbind(employees, data.frame(employee_id = 7, employee_name = '!', salary = 0., start_date = as.Date('2020-10-01')))
# rbind(employees, data.frame(7, '!', 0., as.Date('2020-10-01')))
employees[nrow(employees) + 1, ] <- list(7, '!', NA, as.Date('2020-10-01'))

employees_west <- data.frame(
  employee_id = 1:6,
  employee_name = c('A', 'B', 'C', 'D', '?', '.'),  # Eric, Leo, Helen, Piper, Emma, Maya
  salary = c(4400.34, 3900.5, 4500.2, 3900.5, NA, NA),

  start_date = as.Date(c('2020-10-01', NA, '2020-10-01', '2020-10-01', '2020-10-01', '2020-10-01')),
  stringsAsFactors = FALSE
)

employees <- rbind(employees, employees_west)

na.omit(employees)

library('dplyr')

help(filter)

mtcars_data <- mtcars

head(mtcars_data, 5L)

select(mtcars_data, starts_with('c'))

filter(mtcars_data, disp > 108. & disp < 200.)

arrange(mtcars_data, qsec, hp)

mutate(mtcars_data, dh = disp / hp)

mtcars_data %>% mutate(dh = disp / hp)

group_by(mtcars_data, gear)

mtcars_data %>% group_by(gear) %>% summarise(
  mean_mpg = mean(mpg),
  sd_drat = sd(drat)
)

aggregate(gear ~ wt + qsec, mtcars_data, median)


View(mtcars_data)


# reading data

getwd()
# setwd()

path_to_lectures <- file.path(getwd(), 'R', 'lectures')


# load/read.csv/read.table

# load to load .Rdata files
save(mtcars_data, file = file.path(path_to_lectures, 'mtcars.RData'))

load(file.path(path_to_lectures, 'mtcars.RData'))

# read.csv - shortcut for read.table
titanic <- read.csv(file.path(path_to_lectures, 'titanic_data_from_kaggle.csv'))

head(titanic)

# read.table

titanic2 <- read.table(file.path(path_to_lectures, 'titanic_data_from_kaggle.csv'), header = TRUE, sep = ',')

View(titanic)


# S3 / S4

person <- list(Name = 'Ilya', Age = 23, Affiliation = 'MSU', heigh = 190)
class(person) <- 'Entity'

person

print.Entity <- function (object) {
  paste0('EntityName=', person$Name, ' EntityAge=', person$Age, ' Affiliation=', person$Affiliation)
}

print(person)

# setClass()

setClass('student', slots = list(name = 'character', affiliation = 'character', age = 'numeric'))

student_1 <- new('student', name = 'Ilya', affiliation = 'MSU', age = 18)

student_1@name <- 'Dima'


setMethod("show","student", function(object) {
  return(paste0(paste0("name=",object@name, " "), paste0("affiliation=",object@affiliation, " "),
                paste0("age=", object@age)))
}
)

student_1

show(student_1)