# Question 1
df <- read.table(file = "yob2016.txt", header = F, sep = ";")
colnames(df) <- c("Name","Gender","Count")
dim(df)
summary(df)
head(df)

grep("yyy$", df$Name)
df[212,]
y2016 <- df[-212,]

# Question 2
y2015 <- read.csv(file = "yob2015.txt", header = F)
colnames(y2015) <- c("Name","Gender","Count")
tail(y2015, n = 10)
# They are names I wouldn't choose for my child, all Male, and each equals 5

final <- merge(y2016, y2015, by = c("Name","Gender"))
dim(final)
str(final)
summary(final)
head(final)
sum(is.na(final$Count.x))
sum(is.na(final$Count.y))

# Question 3
final["Total"]  = final$Count.x + final$Count.y
head(final)
final <- final[order(-final$Total),]
head(final, n = 10)

final <- final[, -c(3,4)]
colnames(final) <- c("Name", "Gender", "Total")
attach(final)
final <- final[Gender == "F",]
detach(final)
head(final, n = 10)
finalResult <- head(final[,-c(2)], n = 10)
finalResult
write.csv(finalResult, file = "TopTenGirlNames.csv", row.names = F)
