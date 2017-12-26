rm(list = ls())
# K_means clustering

dataset = read.csv("Mall_Customers.csv")
View(dataset)

x <- dataset[,4:5]

#elbow method to find optimal K
set.seed(1)

?kmeans()

wcss <- vector()
for (i in 1:10)
  wcss[i] <- sum(kmeans(x, i)$withinss)

plot(1:10, wcss, type = "b", xlab = "number of clusters", ylab = "#wcss")

#k = 5

set.seed(2)
kmeans <- kmeans(x, 5)

library(cluster)
clusplot(x, kmeans$cluster, lines = 0, shade =  TRUE, color = TRUE, labels = 2, plotchar = FALSE, span = TRUE, main = paste("Clusters of client"), xlab = "Annual income", ylab = "spending score")

