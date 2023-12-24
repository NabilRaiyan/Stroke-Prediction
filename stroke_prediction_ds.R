
stroke_ds <- read.csv("E:/Courses/AIUB Courses/9th Semester/Introduction to data science/Final Term/Strock Prediction Project/stroke_ds.csv")
stroke_ds

head(stroke_ds)
tail(stroke_ds)
str(stroke_ds)

summary(stroke_ds)
colSums(is.na(stroke_ds))
names(stroke_ds)

is.na(stroke_ds)
dim(stroke_ds)


stroke_ds$gender <-  ifelse(stroke_ds$gender == "Male", 1, ifelse(stroke_ds$gender == "Female", 0, NA))
missing_value_row_gender <- which(is.na(stroke_ds$gender))
cat("Row number of missing value in gender is: ", missing_value_row_gender, "\n")


mode_gender <- as.numeric(names(sort(table(stroke_ds$gender), decreasing = TRUE)[1]))
stroke_ds$gender[is.na(stroke_ds$gender)] <- mode_gender

