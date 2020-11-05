# Title     : TODO
# Objective : TODO
# Created by: Ilya
# Created on: 11/4/2020

# Разница между NULL и NA?


# Как создать вектор?


# Что такое class(...) и какой будет результат при выполнении c(1, '1')


# В чем разница между matrix(...) и c(...)? В чем разница между структорой данных matrix и vector


# В чем разница между matrix[...] и matrix[[...]] при обращении к элементам структуры данных matrix

# Не используя rep вывести элементы вектора c(1, 2, 3) следующим образом 1 1 1 2 3 1 2 3

# С прошлого раза
df <- data.frame(x = 1:3, y = c('a', 'b', 'c'))
merged_df <- cbind(df, df)  # bind columns
merged_df$x[1] <- 1000
merged_df
# Обсудить


matrix(1:25, nrow = 5, ncol = 6)
matrix(1:25, nrow = 5, ncol = 6, byrow = TRUE)
