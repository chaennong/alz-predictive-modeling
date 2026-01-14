run_experiment <- function(train, test, model_type = c("baseline", "stepwise")) {
  set.seed(123)
  model_type <- match.arg(model_type)
  
  if(model_type == "baseline") {
    model <- fit_baseline(train)
  } else if(model_type == "stepwise") {
    model <- fit_stepwise(train)
  }
  
  eval <- evaluate_model(model, test)
  
  selected_vars <- if(model_type == "stepwise") names(coef(model))[-1] else NULL
  
  list(
    model = model,
    evaluation = eval,
    selected_variables = selected_vars
  )
}

run_penalized_experiment <- function(x_train, y_train, x_test, y_test, alpha) {
  set.seed(123)
  
  cv_model <- fit_penalized_cv(x_train, y_train, alpha)
  best_lambda <- cv_model$lambda.min
  
  final_model <- glmnet::glmnet(x_train, y_train, family = "binomial", alpha = alpha, lambda = best_lambda, standardize = TRUE)
  
  eval <- evaluate_glmnet(final_model, x_test, y_test, lambda = best_lambda)
  
  list(
    model = final_model,
    evaluation = eval,
    lambda = best_lambda,
    alpha = alpha
  )
}