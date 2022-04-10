# MechaCar Statistical Analysis

- Software: RStudio 2022.02.1

## Linear Regression to Predict MPG (Deliverable 1)

**Purpose.**

Analyze the data for MechaCar protoypes which contains multiple metrics in order to establish the relationship to miles per gallon (MPG) efficiency.

**Resources.**  
- Data source: "MechaCar_mpg.csv" dataset that contains mpg test results for 50 prototype MechaCars.

**Analysis.**

The dataset contains 50 data points with 6 variables:

![MechaCar Dataset](/Resources/mechacarDB.png)

From the data provided we established the following multiple linear model to establish the relation of design metrics to MPG.

$MPG = \a_0 vehicle_lenght + \a_1 vehicle_weight + \a_2 spoiler_angle + \a_3 ground_clearance + \a_4 AWD + \beta $

**Results.**

|Regressiion summary                                    |Correlation matrix                                |
|-------------------------------------------------------|--------------------------------------------------|
|![Summary regression table](/Resources/regression1.png)|![Correlation matrix](/Resources/correlation1.png)|

1. It can be seen that p-values for vehicle_length and ground_clearance are low (<0.05), meaning that these slope values are different from zero, thus providing meaningful information to the model.  Vehicle_weight's p-value is a little over at 0.0776, whereas AWD and spoiler_clearance seem not to be a good fit for the model.

2. The F-test shows a low p-value (<0.05), thus indicating that at least one of the slopes is not zero and thus a linear model to predict MPG is feasable. The $R^2 has a value of 0.7149 and the Adjusted $R^2 of 0.6825, meaning that the multiple linear model does provide a good statistical explanation to MPG.  

3. As seen, we found that the multiple linear model does provide a good explanatory power with a high $R^2 and p-values for F-test and t-tests for the slopes of some factors told us that they are statistical good contributors for the model.  However, the model could be enhanced by transforming some of the variables to logarithms to see if their distributions adjust better and if not deleting them from the model, one by one.  The correlation matrix indicates that there are strong correlations among the variables, thus we need to address this issue.


## Summary Statistics on Suspension Coils (DELIVERABLE 2)

**Purpose.**

Calculate the main statistics for the suspension coils PSI.

**Resources.**  
- Data source: "Suspension_Coil.csv" dataset that contains 150 lines with the vechicle ID, manufacturing lot and coil PSI.

**Results.**

|Total stats summary                                 |Per lot stats summary                           |
|----------------------------------------------------|------------------------------------------------|
|![Total Stats Summary](/Resources/total_summary.png)|![Lot Stats Summary](/Resources/lot_summary.png)|

As we can observe, the total statistics summary show that the overall PSI variance is <100. However, when looking at individual lot variances, Lot3 presents a variance of 170 which is way to high.

If we plot the the observations, we find that there are several outliers which run both ways making the variance increase.

![All Coil PSI Boxplot](/Resources/boxplot1.png)


## T-Tests on Suspension Coils (DELIVERABLE 3)

**Purpose.**

Calculate t-tests to test if mean PSI is equal to 1,500, with a significance level of 0.05.

**Resources.**  
- Data source: "Suspension_Coil.csv" dataset that contains 150 lines with the vechicle ID, manufacturing lot and coil PSI.

**Results.**

1. When running the t-test for all manufacturing lots we obtained a p-value of 0.06028 > 0.05, so we cannot reject our null hypotesis that mean is equal to 1,500. This means that there is statistical evidence to say that the PSI mean for all lots could be 1,500.  However, this p-value is very close to our significance level.

![t-test for all lots](/Resources/t-test_all.png)

2. When running the t-test for each lot against the mean of 1,500 PSI, we found that for Lot1 (p-value = 1 > 0.05) and Lot2 (p-value = 0.6027 > 0.05) we cannot reject the null hypotesis, thus their means could be considered statistically equal to 1,500.  However, for Lot3 (p-value = 0.04168 < 0.05) we reject the null hypotesis, thus concluiding that its mean is statistically different from 1,500 PSI.

|t-test Lot1                               |t-test Lot2                               |t-test Lot3                               |
|------------------------------------------|------------------------------------------|------------------------------------------|
|![t-test Lot1](/Resources/t-test_lot1.png)|![t-test Lot2](/Resources/t-test_lot2.png)|![t-test Lot3](/Resources/t-test_lot3.png)|

Furthermore, the following boxplot shows the boxplot for each lot.  It is evident that in each lot the variance is increasing and the more outliers show, thus incrementing the difference to the reference value.

![Each Lot Coil PSI Boxplot](/Resources/boxplot.png)


## Study Design: MechaCar vs Competition

For our study we will compare MechaCar pricing of economy cars as they aim to increase sales in urban cities.   

### Metrics

From recent surveys, average consumer in urban cities are mostly concerned about the following factors:
1. Selling price,
2. Fuel efficiency in the city (mpg),
3. Safety rating, and
4. 3-years maintenance cost

### Hypotesis

Null Hypotesis:  Purchase price for each model of MechaCar is fairly priced according to factors and compared to competition
Alternate Hypotesis:  Purchase price for each model of MechaCar is not fairly priced

### Statistical tests

It would be necessary to make a multiple linear regresion of purchase price against all the factors described in the form of:

$Selling Price = \a_0 MPG + \a_1 Safety_Rating + \a_2 Maintenance_cost + \beta $

We'll have to analyze correlations and distributions to address any transformation needed and to validate if each factor contributes to the model or has to be eliminated or replaced.

Resulting selling prices should be compared to actual selling prices to assess which cars are over-priced and which under-priced.

### Data

We'll need to have a dataset that contains technical data for MecaChars and all competitors economy cars regarding selling price, fuel efficiency and maintenance costs.

Regarding safety rating, we need to consult data from independent safety evaluators.
