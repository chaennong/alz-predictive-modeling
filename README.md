# Alzheimer Predictive Modeling

This repository presents an end-to-end predictive modeling project using a synthetic Alzheimer’s disease dataset. The project performs predictive machine learning to build and evaluate models for disease diagnosis prediction.

The project is designed to demonstrate skills relevant to clinical data analysis, biostatistics, and statistical/clinical programming, with an emphasis on reproducibility and transparent model evaluation.

---

## Project Objectives

1. **Predictive Modeling**
   Develop and compare multiple classification models to predict Alzheimer’s diagnosis, focusing on discrimination and clinical relevance.

2. **Model Evaluation & Interpretation**
   Evaluate models using ROC-based metrics and clinically meaningful performance measures such as sensitivity.

---

## Dataset

* **Type**: Synthetic Alzheimer’s disease dataset
* **Motivation**: Enables open sharing and reproducible analysis without privacy concerns
* **Variables include**:

  * Demographics
  * Lipid biomarkers (e.g., HDL cholesterol)
  * Clinical and cognitive measurements
  * Binary diagnosis outcome

> ⚠️ This dataset is **synthetic** and intended for methodological demonstration only, not for clinical decision-making.

---

## Analysis Workflow

### 1. Predictive Modeling

Outcome:

* Binary Alzheimer’s disease diagnosis

Models implemented:

* **Baseline Logistic Regression (full model)**
* **Stepwise Logistic Regression**
* **LASSO (L1-regularized logistic regression)**
* **Elastic Net (L1 + L2 regularization)**

Regularization parameters were selected using cross-validation.

---

### 2. Model Evaluation

Model performance was evaluated on held-out test data using:

* **ROC–AUC** (overall discrimination ability)
* **Optimal classification threshold**
* **Confusion matrix**
* **Sensitivity (Recall)** – emphasized due to clinical importance of minimizing false negatives

This evaluation framework reflects real-world clinical screening priorities.

---

## Key R Functions

To promote reproducibility and consistency across models, the core modeling and evaluation workflow was modularized into reusable R functions. Each script encapsulates a distinct stage of the analysis pipeline, mirroring a standardized clinical/statistical programming workflow.

### Data Preprocessing (`preprocess.R`)

* **`preprocess()`**
  Cleans and prepares raw data by removing unnecessary variables and correctly encoding categorical variables.

* **`split_data()`**
  Splits the dataset into training and test sets (70% training, 30% testing).

* **`split_x_y()`**
  Separates independent and dependent variables and converts them into matrix/vector formats compatible with `glmnet()`.

---

### Model Fitting (`fit.R`)

* **`fit_baseline()`**
  Fits a baseline logistic regression model using all candidate predictors.

* **`fit_stepwise()`**
  Fits a stepwise logistic regression model with bidirectional variable selection.

* **`fit_penalized_cv()`**
  Fits penalized logistic regression models using cross-validation.

  * Default: LASSO (`alpha = 1`)
  * Elastic Net: set `alpha = 0.5`

---

### Model Evaluation (`evaluate.R`)

* **`evaluate_model()`**
  Evaluates baseline and stepwise models using ROC–AUC, optimal classification threshold, and confusion matrix–based metrics.

* **`evaluate_glmnet()`**
  Evaluates LASSO and Elastic Net models using ROC–AUC, optimal classification threshold, and confusion matrix–based metrics.

---

### Experiment Orchestration (`run.R`)

* **`run_experiment()`**
  Executes the full modeling and evaluation pipeline for baseline and stepwise models.
  Returns model summaries, evaluation metrics, and selected variables for the stepwise model.

* **`run_penalized_experiment()`**
  Executes the full modeling and evaluation pipeline for LASSO and Elastic Net models.
  Returns model summaries, evaluation metrics, optimal tuning parameter (`lambda`), and the mixing parameter (`alpha`).
  
---

## Key Results (Summary)

- All models demonstrated strong discriminatory performance (ROC–AUC ≈ 0.90).
- Regularized models (LASSO and Elastic Net) achieved comparable performance to the full logistic model with improved parsimony.
- Sensitivity-focused evaluation highlighted trade-offs between model complexity and clinical interpretability.

(See the final report for detailed numerical results and ROC curves.)

---

## Tools & Technologies

- **Language**: R
- **Key Packages**:
  - `glm`, `glmnet`
  - `pROC`
  - `caret`
  - `dplyr`, `ggplot2`
- **Reporting**: R Markdown

---

## Reproducibility

To reproduce the analysis:

1. Clone this repository
2. Install required R packages
3. Run analysis scripts in the order:
   - Data preprocessing
   - Predictive modeling
   - Model evaluation

All random seeds are set where applicable to ensure reproducibility.
---

## Data Source & Citation

The dataset used in this project originates from a publicly available Alzheimer’s disease dataset hosted on Kaggle.

If you use this dataset or build upon this project, please cite the original data source:

```

@misc{rabie_el_kharoua_2024,
title     = {Alzheimer's Disease Dataset},
author    = {Rabie El Kharoua},
year      = {2024},
publisher = {Kaggle},
doi       = {10.34740/KAGGLE/DSV/8668279},
url       = {[https://www.kaggle.com/dsv/8668279}](https://www.kaggle.com/dsv/8668279})
}

```

---

## Disclaimer

This project is for educational and portfolio purposes only. Results are based on a publicly available dataset and should not be interpreted as clinical evidence.
