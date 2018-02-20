library(plyr)

setwd("C:/Users/Brett/OneDrive - Southern Methodist University/DoingDataScience/CaseStudy1")

dfBeer <- read.csv("Beers.csv", header = T, sep = ",", encoding = 'UTF-8')
dfBrewery <- read.csv("Breweries.csv", header = T, sep = ",", encoding = 'UTF-8')

colnames(dfBeer)
colnames(dfBrewery) <- c("Brewery_id", "Name", "City", "State")

trim.leading <- function (x) sub("^\\s+", "", x)
stateList <- unique(trim.leading(tolower(dfBrewery$State)))
stateList <- stateList[stateList != "dc"]

myCount <- count(dfBrewery, "State")

df <- merge(dfBeer, dfBrewery, by = "Brewery_id", all = T)

head(df, n = 6)
tail(df, n = 6)

nmissing <- function(x) sum(is.na(x))

missingResult <- colwise(nmissing)(df)

abvMax <- max(df$ABV, na.rm = T)
ibuMax <- max(df$IBU, na.rm = T)

abvState <- df[which(df$ABV == abvMax), ][10]
ibuState <- df[which(df$IBU == ibuMax), ][10]

