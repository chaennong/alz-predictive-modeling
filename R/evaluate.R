evaluate_model <- function(model, test) {
  prob_test <- predict(model, newdata = test, type = "response")
  roc_obj <- pROC::roc(test$Diagnosis, prob_test)
  auc_val <- as.numeric(pROC::auc(roc_obj))
  
  threshold <- as.numeric(pROC::coords(roc_obj, "best", ret= "threshold", best.method = "youden"))
  
  pred_class <- ifelse(prob_test > threshold, 1, 0)
  cm <- table(Predicted = pred_class, Actual = test$Diagnosis)
  list(AUC = auc_val,
       Threshold = threshold,
       ConfusionMatrix = cm)
}

evaluate_glmnet <- function(model, x, y, lambda) {
  prob <- as.numeric(predict(model, newx = x, s = lambda, type = "response"))
  roc_obj <- pROC::roc(y, prob, quiet = TRUE)
  auc_val <- as.numeric(pROC::auc(roc_obj))
  
  threshold <- as.numeric(pROC::coords(roc_obj, "best", ret = "threshold", best.method = "youden"))
  
  pred <-  ifelse(prob > threshold, 1, 0)
  cm <- table(Predicted = pred, Actual = y)
  list(AUC = roc_obj,
       Threshold = threshold,
       ConfusionMatrix = cm)
}