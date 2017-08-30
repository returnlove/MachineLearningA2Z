# data processing

# importing datasets

dataset = read.csv("Data.csv")

# taking care of missing values

dataset$Age = ifelse(is.na(dataset$Age), mean(dataset$Age, na.rm = TRUE),dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary), mean(dataset$Salary, na.rm = TRUE),dataset$Salary)

#Encoding categorical data


dataset$Country = factor(dataset$Country, levels = c('France', 'Spain', 'Germany'),
                                                     labels = c(1,2,3))
dataset$Purchased = factor(dataset$Purchased, levels = c('No','Yes'),
                         labels = c(0,1))
