library(neuralnet)
library(Metrics)
library(ggplot2)
library(vioplot)
setwd("C:/Users/D-Shield/Documents/Proyecto Delfín/Datos violencia/2020/DelitosMun")

data1 <- read.csv('NN14051.csv')
data0 <- data1[,-1]
data <- data0


for (i in 1:21){
  data[,i] <- (data[,i]-min(data[,i]))/(max(data[,i]-min(data[,i])))
}

data[is.na(data)] <- 0

train_data <- data[1:30, ]
test_data <- data[31:47, ]

set.seed('29')
n <- neuralnet(H ~ d2 + d5 + d6 + d14 + d23 + d34 + d37 +
                 d42 + d43 + d48 + d52 + d55 +
                 d59 + d62 + d64 + d69 + d72 + d77 + d91 +
                 d98,
               data = train_data, 
               hidden = c(1, 20, 80, 180, 1),
               threshold = 0.01,
               linear.output = F)


set.seed('29')
nn <-  neuralnet(H ~ d2 + d5 + d6 + d14 + d23  + d34 + d37 +
                   d42 + d43 + d48 + d52 + d55 +
                   d59 + d62 + d64 + d69 + d72 + d77 + d91 +
                   d98,
                 data = train_data, 
                 hidden = c(80, 40, 20, 10, 1),
                 threshold = 0.01,
                 linear.output = F)

set.seed('29')
rn <-  neuralnet(H ~ d2 + d5 + d6 + d14 + d23  + d34 + d37 +
                   d42 + d43 + d48 + d52 + d55 +
                   d59 + d62 + d64 + d69 + d72 + d77 + d91 +
                   d98,
                 data = train_data, 
                 hidden = c(40, 20, 10, 7, 5),
                 threshold = 0.01,
                 linear.output = F)

set.seed('29')
nnn <-  neuralnet(H ~ d2 + d5 + d6 + d14 + d23  + d34 + d37 +
                   d42 + d43 + d48 + d52 + d55 +
                   d59 + d62 + d64 + d69 + d72 + d77 + d91 +
                   d98,
                 data = train_data, 
                 hidden = c(40, 20, 10, 7, 5, 4, 1),
                 threshold = 0.01,
                 linear.output = F)

actual <- data0[45:47, 21]/max(data0[,i])
actual[is.na(actual)] <- 0
actual0 <- data0[45:47, 21]

predicted <- predict(n, test_data[15:17, ])
prediction <- predicted*max(data0[, i])
predicted2 <- predict(nn, test_data[15:17, ])
prediction2 <- predicted2*max(data0[, i])
predicted3 <- predict(rn, test_data[15:17, ])
prediction3 <- predicted3*max(data0[, i])
predicted4 <- predict(nnn, test_data[15:17, ])
prediction4 <- predicted4*max(data0[, i])

mse(actual, predicted)
mse(actual, predicted2)
mse(actual, predicted3)
mse(actual, predicted4)

mean(abs(actual- predicted))
mean(abs(actual- predicted2))
mean(abs(actual- predicted3))
mean(abs(actual- predicted4))
