Stock Market Clustering (Unsupervised Learning)
Grouping S&P 500 stocks into segments with similar financial behaviour, so an
investor can understand the structure of the market and build a more diversified
portfolio rather than picking stocks in isolation.
Type: Machine Learning / Data Science (Unsupervised) · Tools: Python, pandas, scikit-learn, scipy
---
Problem
Given financial attributes for ~340 large-cap (S&P 500) companies, the goal is to
discover natural groupings of stocks that behave similarly — useful for
diversification, risk management and portfolio construction.
Data & Approach
~340 stocks with attributes: current price, price change, volatility, ROE, cash ratio, net cash flow, net income, EPS, estimated shares outstanding, P/E ratio, P/B ratio, and GICS sector.
Exploratory analysis of how P/E and volatility vary across sectors; outlier checks; feature scaling.
K-means clustering — number of clusters chosen using the elbow method and silhouette analysis.
Hierarchical (Agglomerative) clustering — cophenetic-correlation comparison across linkage methods and dendrogram inspection.
The two techniques were compared on cluster distinctness, group membership and the number of clusters each suggested.
Results
The final K-means model segmented the stocks into 3 clusters (silhouette ≈ 0.40 at k = 3).
Financial-sector stocks (e.g. major banks) separated into their own distinct cluster, reflecting their different ROE, leverage and valuation profile.
Hierarchical clustering produced broadly consistent groupings, supporting the K-means structure.
Why It's Useful
Clusters give an investor a map of which stocks move and behave alike. Diversifying
across clusters — rather than holding many names from the same cluster — spreads
risk more effectively than sector labels alone.
---
Author: Adewale Adeyinka Falade. Notebook is self-authored; the course brief is not
redistributed. The dataset is public S&P 500 financial data.
