US Visa Certification Classification
Predict whether a US work-visa application will be Certified or Denied, to help
shortlist applications and surface the factors that drive case status.
Business context
US employers face large applicant volumes each year. A model that flags applications with a
higher likelihood of certification — and explains the drivers — speeds screening and
supports fairer, evidence-based decisions.
Dataset
25,480 applications with 12 features — continent, education, job experience, training
requirement, number of employees, year of establishment, region of employment, prevailing
wage, wage unit and full-time status. Target: case status (Certified / Denied), which is
class-imbalanced (~67% certified).
Approach
Preprocessing — categorical encoding, outlier and data-quality review (including
invalid negative employee counts), train/validation split.
Class imbalance — compared models on the original data, and after over- and
under-sampling, plus balanced class weights.
Models — Bagging, Random Forest, AdaBoost, Gradient Boosting and XGBoost.
Tuning & selection — GridSearchCV with F1 as the scoring metric (F1 balances the
cost of wrongly certifying vs wrongly denying a qualified applicant).
Results
Tuned XGBoost gave the best balance — F1 ≈ 0.85 with the strongest recall — with
Random Forest a close competitor (F1 ≈ 0.845). Boosting methods (AdaBoost, Gradient
Boosting) generalised well between training and validation, while bagging/Random Forest
showed more overfitting before tuning.
Key drivers of certification
Higher likelihood: higher education level (Doctorate > Master's > Bachelor's), prior
job experience, certain continents (Europe, Africa), and prevailing-wage band.
Recommendation
Use the tuned XGBoost model for certification prediction; favour Gradient Boosting where an
under-sampled training regime is preferred. Pair predictions with the driver analysis to
guide applicant shortlisting.
Tools
Python · pandas · NumPy · scikit-learn (RandomForest, AdaBoost, GradientBoosting, GridSearchCV) · XGBoost · matplotlib · seaborn
Files
`visa_certification.ipynb` — full analysis notebook (add your notebook here)
