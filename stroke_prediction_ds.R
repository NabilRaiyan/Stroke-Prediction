
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


age_outliers <- boxplot(stroke_ds$age, main = "Boxplot for age attribute", ylab = "Age")$out
cat("Potentials outliers on age attribute are: ", age_outliers, "\n")



avg_glucose_level_outliers <- boxplot(stroke_ds$avg_glucose_level, main = "Boxplot for Avg Glucose level attribute", ylab = "Avg Glucose level")$out
cat("Potentials outliers for Avg Glucose level are: ", avg_glucose_level_outliers, "\n")

avg_glucose_level_outliers_rows <- which(stroke_ds$avg_glucose_level > 115)
cat("Potential rows for outliers in avg glucose level column: ", avg_glucose_level_outliers_rows, "\n")


mode_glucose_level <- as.numeric(names(sort(table(stroke_ds$avg_glucose_level), decreasing = TRUE)[1]))

for (i in 1: length(stroke_ds$avg_glucose_level)){
  if (stroke_ds$avg_glucose_level[i] > 115){
    stroke_ds$avg_glucose_level[i] <- mode_glucose_level
  }
}

stroke_ds$ever_married <- ifelse(stroke_ds$ever_married == 1, "Yes", ifelse(stroke_ds$ever_married == 0, "No", NA))
