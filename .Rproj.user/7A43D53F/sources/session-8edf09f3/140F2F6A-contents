preprocess <- function(data) {
  library(dplyr)
  data <- data %>% 
    select(-c(PatientID, DoctorInCharge))
  data$Gender <- as.factor(data$Gender)
  data$Ethnicity <- as.factor(data$Ethnicity)
  data$EducationLevel <- as.factor(data$EducationLevel)
  data$Smoking <- as.factor(data$Smoking)
  data$FamilyHistoryAlzheimers <- as.factor(data$FamilyHistoryAlzheimers)
  data$CardiovascularDisease <- as.factor(data$CardiovascularDisease)
  data$Diabetes <- as.factor(data$Diabetes)
  data$Depression <- as.factor(data$Depression)
  data$HeadInjury <- as.factor(data$HeadInjury)
  data$Hypertension <- as.factor(data$Hypertension)
  data$MemoryComplaints <- as.factor(data$MemoryComplaints)
  data$BehavioralProblems <- as.factor(data$BehavioralProblems)
  data$Confusion <- as.factor(data$Confusion)
  data$Disorientation <- as.factor(data$Disorientation)
  data$PersonalityChanges <- as.factor(data$PersonalityChanges)
  data$DifficultyCompletingTasks <- as.factor(data$DifficultyCompletingTasks)
  data$Forgetfulness <- as.factor(data$Forgetfulness)
  data$Diagnosis <- as.factor(data$Diagnosis)
  data
}

split_data <- function(data) {
  set.seed(123)
  idx <- caret::createDataPartition(data$Diagnosis, p = 0.7, list = FALSE)
  list(
    train = data[idx,],
    test = data[-idx,]
  )
}

split_x_y <- function(data) {
  list(
    x = model.matrix(Diagnosis~., data = data)[,-1],
    y = data$Diagnosis
  )
}

