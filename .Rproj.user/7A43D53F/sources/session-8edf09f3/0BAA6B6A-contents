fit_baseline <- function(train) {
  set.seed(123) 
  glm(Diagnosis ~ ., data = train, family = binomial)
}

fit_stepwise <- function(train) {
  set.seed(123)
  full_model <- glm(Diagnosis~., data = train, family = binomial)
  MASS::stepAIC(full_model, direction = "both", trace= FALSE)
}

fit_penalized_cv <- function(x, y, alpha = 1) {
  set.seed(123) 
  glmnet::cv.glmnet(x, y, family = "binomial", alpha = alpha, standardize = TRUE)
}