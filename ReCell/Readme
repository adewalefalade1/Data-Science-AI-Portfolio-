ReCell — Used Phone Price Prediction
A linear-regression model that predicts the price of used and refurbished phones
for ReCell, a used-device marketplace, so the business can price inventory and
decide which devices are worth buying for resale.
Type: Machine Learning / Data Science · Tools: Python, pandas, statsmodels, scikit-learn
---
Problem
The used and refurbished phone market is large and growing fast. ReCell needed a
data-driven way to estimate a fair price for a used device from its specifications,
to price stock consistently and maximise margin.
Data & Approach
Dataset of used-phone listings with specs: screen size, cameras, memory, RAM, battery, weight, brand, network (4G/5G), release year, and new price.
Linear regression (OLS, statsmodels) with full diagnostics.
Feature engineering, multicollinearity checks via VIF (dropping high-VIF predictors), and tests for linearity, independence and residual normality.
Evaluated on RMSE, MAE, R², adjusted R² and MAPE for both train and test sets.
Results
Metric	Train	Test
R-squared	0.847	0.833
Adjusted R-squared	0.846	0.831
MAPE	4.32%	4.51%
The model explains ~83% of the variation in used-phone price on unseen data, with
an average percentage error under 5% — strong and stable across train and test.
Key Findings
The strongest predictors of used-phone price are screen size, main and selfie cameras, memory, RAM, weight, and the phone's normalized new price.
Brand matters — Nokia and Xiaomi appear as significant brand effects.
4G capability is a meaningful price driver.
High-VIF features were dropped with negligible loss of R², giving a leaner, more stable model.
Recommendation
ReCell should prioritise devices with strong values on these predictive features
(camera quality, memory/RAM, screen size, recent new price) when buying used stock,
since these drive both demand and resale price.
---
Author: Adewale Adeyinka Falade. Notebook is self-authored; the course brief and
dataset are not redistributed.
