library(tidyverse)
library(tmap)
library(tmaptools)
library(rgdal)
library(rgeos)
library(sp)
library(maptools)


setwd("C:/Users/D-Shield/Documents/Proyecto Delfín/Datos violencia/2020/DelitosMun")
real <- read.csv("Abrilr.csv", encoding="UTF-8")
real <- real[,-1]
prediction1 <- read.csv("Abril.csv", encoding="UTF-8")
prediction1 <- prediction1[,-1]
prediction2 <- read.csv("Abril2.csv", encoding="UTF-8")
prediction2 <- prediction2[,-1]
prediction3 <- read.csv("Abril3.csv", encoding="UTF-8")
prediction3 <- prediction3[,-1]
cvegeo <- sprintf("%05i",prediction1$Clave.municipal)
prediction1 <- cbind(cvegeo,prediction1)
prediction2 <- cbind(cvegeo, prediction2)
prediction3 <- cbind(cvegeo, prediction3)
real <- cbind(cvegeo,real)

MX <- readOGR( "muni_2018gw.shp")
names(MX) <- tolower(names(MX))

breaks <- seq(0, 40, 2)

datosreales <- merge(MX, real, by = intersect("cvegeo", "cvegeo"))

png("C:/Users/D-Shield/Documents/Proyecto Delfín/Datos violencia/2020/DelitosMun/mapar-Abril.png",
    width = 1920, height = 1080, res  = 200)
tmap_style("beaver")
tm_shape(datosreales) +
  tm_fill(col = "Real", palette = "PuOr",
          title = 'Homicidios por arma de fuego (Abril)', breaks = breaks)
dev.off()



predichos1 <- merge(MX, prediction1, by=intersect("cvegeo", "cvegeo"))

png("C:/Users/D-Shield/Documents/Proyecto Delfín/Datos violencia/2020/DelitosMun/mapa1-Abril.png",
    width = 1920, height = 1080, res = 200)
tmap_style("beaver")
tm_shape(predichos1) +
  tm_fill(col = "Predicción.1", palette = "PuOr",
          title = 'Homicidios por arma de fuego (Abril)', breaks = breaks)
dev.off()

predichos2 <- merge(MX, prediction2, by=intersect("cvegeo", "cvegeo"))

png("C:/Users/D-Shield/Documents/Proyecto Delfín/Datos violencia/2020/DelitosMun/mapa2-Abril.png",
    width = 1920, height = 1080, res = 200)
tmap_style("beaver")
tm_shape(predichos2) +
  tm_fill(col = "Predicción.2", palette = "PuOr",
          title = 'Homicidios por arma de fuego (Abril)', breaks = breaks)
dev.off()

predichos3 <- merge(MX, prediction3, by=intersect("cvegeo", "cvegeo"))

png("C:/Users/D-Shield/Documents/Proyecto Delfín/Datos violencia/2020/DelitosMun/mapa3-Abril.png",
    width = 1920, height = 1080, res = 200)
tmap_style("beaver")
tm_shape(predichos3) +
  tm_fill(col = "Predicción.3", palette = "PuOr",
          title = 'Homicidios por arma de fuego (Abril)', breaks = breaks)
dev.off()

