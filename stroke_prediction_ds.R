

stroke_ds <- read.csv("E:/Courses/AIUB Courses/9th Semester/Introduction to stroke_ds science/Final Term/Strock Prediction Project/stroke_ds.csv")
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


stroke_ds$bmi[stroke_ds$bmi == "N/A"] <- NA
bmi_missing_value_rows <- which(is.na(stroke_ds$bmi))
cat("Potential rows of missing value in BMI: ", bmi_missing_value_rows, "\n")

mode_bmi <- as.numeric(names(sort(table(stroke_ds$bmi), decreasing = TRUE)[1]))
stroke_ds$bmi <- as.numeric(as.character(stroke_ds$bmi))

stroke_ds$bmi[is.na(stroke_ds$bmi)] <- mode_bmi


bmi_outliers <- boxplot(stroke_ds$bmi, main = "Boxplot for BMI column", ylab = "BMI")$out
cat("Potential outliers of BMI column: ", bmi_outliers, "\n")

bmi_outliers_rows <- which(stroke_ds$bmi < 0 | stroke_ds$bmi > 47 | stroke_ds$bmi < 15)
cat("Potetial rows of outliers of BMI column: ", bmi_outliers_rows, "\n")


for (i in 1:length(stroke_ds$bmi)){
  if (stroke_ds$bmi[i] < 0 | stroke_ds$bmi[i] > 40 | stroke_ds$bmi[i] < 15){
    stroke_ds$bmi[i] <- mode_bmi
  }
}


mode_smoking_status <- names(sort(table(stroke_ds$smoking_status), decreasing = TRUE))[1]
mode_smoking_status
stroke_ds$smoking_status[stroke_ds$smoking_status == "Unknown"] <- mode_smoking_status



glucose_categories <- cut(stroke_ds$avg_glucose_level, breaks = c(-Inf, 50, 100, Inf), labels = c("Low", "Medium", "High"))
stroke_ds$avg_glucose_level <- glucose_categories


age_ranges <- c(0, 18, 35, 50, Inf)
age_labels <- c("Children", "Adult", "Middle Age Adult", "Senior Adult")
stroke_ds$age <- cut(stroke_ds$age, breaks = age_ranges, labels = age_labels, include.lowest = TRUE, right = FALSE)


bmi_range <- c(-Inf, 18.5, 24.9, 29.9, Inf)
bmi_labels <- c("Underweight", "Normal Weight", "Overweight", "Obese")
stroke_ds$bmi <- cut(stroke_ds$bmi, breaks = bmi_range, labels = bmi_labels, include.lowest = TRUE)

# Id column

contingency_table_id <- table(stroke_ds$stroke, stroke_ds$id)
chi_square_result_id <- chisq.test(contingency_table_id)
print(chi_square_result_id)


# Gender column

contingency_table_gender <- table(stroke_ds$stroke, stroke_ds$gender)
chi_square_result_gender <- chisq.test(contingency_table_gender)
print(chi_square_result_gender)


# age column (ok)


contingency_table_age <- table(stroke_ds$stroke, stroke_ds$age)
chi_square_result_age <- chisq.test(contingency_table_age)
print(chi_square_result_age)


# Hypertension column (ok)

contingency_table_hypertension <- table(stroke_ds$stroke, stroke_ds$hypertension)
chi_square_result_hypertension <- chisq.test(contingency_table_hypertension)
print(chi_square_result_hypertension)


# heart disease column 

contingency_table_heart_disease <- table(stroke_ds$stroke, stroke_ds$heart_disease)
chi_square_result_heart_disease <- chisq.test(contingency_table_heart_disease)
print(chi_square_result_heart_disease)


# ever married column 

contingency_table_ever_married <- table(stroke_ds$stroke, stroke_ds$ever_married)
chi_square_result_ever_married <- chisq.test(contingency_table_ever_married)
print(chi_square_result_ever_married)









