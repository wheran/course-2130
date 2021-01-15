# Title     : TODO
# Objective : TODO
# Created by: Ilya
# Created on: 11/4/2020

install.packages("hflights")

library('hflights')
library('dplyr')

flights <- hflights

View(flights)

# Выберите только те полеты, которые были в июне по понедельникам (будем считать что day_of_week = 1)
filter(flights, Month == 6 & DayOfWeek == 1)

# Расположите отмененные рейсы в начале (1.(6))
head(arrange(flights, -Cancelled), 10L)

# Выделите все колонки которые end_with на `time`
head(select(flights, ends_with('time')), 10L)

# Посчитайте среднюю, медианную продолжительность полета по месяцам
# Иванов 1.6
flights %>% group_by(Month) %>% summarise(
  mean_at = mean(AirTime, na.rm = TRUE),
  median_at = median(AirTime, na.rm = TRUE)
)

# Отсортируйте данные по ArrTime и ArrDelay
head(arrange(flights, ArrTime, ArrDelay), 5L)

# Посчитайте среднюю скорость полета V = distanse / time
# 1.(6) / 4 -> Иванов, Гусейнова, Являнская, Зайцев
mean(ArrTime, na.rm = TRUE)

head(flights %>% mutate(speed = Distance / (ArrTime - DepTime)), 5L)

flights %>% mutate(speed = Distance / (ArrTime - DepTime)) %>% summarise(mean(speed, na.rm = TRUE))

flights %>% summarise(
  mean_speed = mean(Distance / (ArrTime - DepTime), na.rm = TRUE)
)

mean(flights$Distance/(flights$ArrTime-flights$DepTime), na.rm = TRUE)


# Почитатйте количество рейсов, среднюю дистанцию, и задержку для каждого TailNum
# Иванов
filter(flights, Cancelled == 0) %>% group_by(UniqueCarrier) %>% summarise(
  n_count = n(),
  mean_dist = mean(Distance, na.rm = TRUE),
  med_delay = mean(DepDelay, na.rm = TRUE)
) %>% arrange(-n_count)

