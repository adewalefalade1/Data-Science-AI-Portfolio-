Booking Cancellation Prediction — INN Hotels
Predicting which hotel bookings are likely to be cancelled in advance, so revenue
and operations teams can act before the cancellation happens.
Type: Machine Learning / Data Science · Tools: Python, pandas, scikit-learn, statsmodels
---
Problem
INN Hotels Group was losing revenue to a high rate of booking cancellations, many of
them last-minute. The goal was a data-driven way to flag high-risk bookings in advance
and inform smarter cancellation and pricing policies.
Data & Approach
Dataset: 36,275 hotel bookings (lead time, guests, price, market segment, booking history, special requests, meal plan, etc.).
Models: Logistic Regression (statsmodels) and a Pruned Decision Tree.
Feature engineering: categorical encoding, multicollinearity handling, and iterative variable elimination.
Evaluation: Accuracy, Precision, Recall, F1, ROC-AUC, and confusion matrices, with threshold tuning.
Key Findings
Lead time is the strongest predictor — longer lead times raise cancellation risk.
Repeat guests, offline bookings, and guests with special requests are less likely to cancel.
Higher room prices, no-meal-plan bookings, and prior cancellations raise cancellation risk.
Multicollinearity was found among market-segment variables; dropping `market_segment_type_Online` improved model stability.
Threshold optimisation: optimal threshold = 0.37, giving F1 = 70.3% on test.
ROC-AUC: 86.2% (train) / 85.1% (test) — strong, stable discrimination.
Recommendations
Embed the model in the booking platform to flag high-risk cancellations in real time.
Use a 0.37 threshold for the best precision/recall balance.
Apply targeted policy: stricter cancellation terms for high-risk bookings; incentives for guests who confirm early or add special requests.
Feed insights into CRM and pricing systems, and build dashboards for risk monitoring.
---
Author: Adewale Adeyinka Falade. This summary is self-authored; underlying course
materials are not redistributed.
