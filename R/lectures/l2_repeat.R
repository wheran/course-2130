# Title     : TODO
# Objective : TODO
# Created by: Ilya
# Created on: 11/4/2020

# Разница между NULL и NA?


# Как создать вектор?
c(1, 2, 3)
1:10

# Что такое class(...) и какой будет результат при выполнении c(1, '1')
?class

class(c(1, '1'))

c(1, '1')


# В чем разница между matrix(...) и c(...)? В чем разница между структорой данных matrix и vector



# В чем разница между list[...] и list[[...]] при обращении к элементам структуры данных matrix

l <- list(x = 1:10, y = c('a', 'b', 'c', 'b'), c(1L, 2L))

class(l['x'])  # > list

l['x']$x

class(l[['x']])  # > c

# Не используя rep вывести элементы вектора c(1, 2, 3) следующим образом 1 1 1 2 3 1 2 3
?rep

a <- c(1, 2, 3)

a[c(1, 1, 1, 2, 3)]

# С прошлого раза
df <- data.frame(x = 1:3, y = c('a', 'b', 'c'))

df

merged_df <- cbind(df, df)  # bind columns

merged_df$x

merged_df[, names(merged_df) == 'x']

names(merged_df)

merged_df[, names(merged_df) == 'x']

merged_df$x

merged_df['x.1']

?data.frame

merged_df$x[1] <- 1000
merged_df
