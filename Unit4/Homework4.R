library("fivethirtyeight")
df <- college_recent_grads

names <- colnames(df)
colCount <- length(names)

majorCategory <- unique(df$major_category)

mCount <- c()
mFreq <- c()

for (major in majorCategory) {
  mCount <- append(mCount, sum(df$major_category == major))
  mFreq <- append(mFreq, mean(df$major_category == major))
}

major_count <- data.frame(mCount, mFreq)

row.names(major_count) <- majorCategory
colnames(major_count) <- c("Count", "Frequency")

par(las=2)
barplot(major_count$Count, names.arg = row.names(major_count), 
        horiz = T, main = "2014 College Graduate Majors", xlab = "Count", 
        legend.text = "Majors", xlim = c(0,30), col = "blue")

barplot(major_count$Frequency, names.arg = row.names(major_count), 
        horiz = T, main = "2014 College Graduate Majors", xlab = "Percentage", 
        legend.text = "Majors", xlim = c(0,.2), col = "blue")

        