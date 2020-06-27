# Load delivery_time.csv dataset
library(readr)

View(emp_data)

#Explanatory Data Analysis
summary(emp_data)
attach(emp_data)

#graphical representation
hist(emp_data$Salary_hike)
hist(emp_data$Churn_out_rate)

qqnorm(emp_data$Salary_hike)
qqline(emp_data$Salary_hike)

qqnorm(emp_data$Churn_out_rate)
qqline(emp_data$Churn_out_rate)

#Scatter plot
plot(emp_data$Salary_hike,emp_data$Churn_out_rate)

#Correlation Coefficient (r)
cor(Salary_hike,Churn_out_rate)

# Simple Linear Regression model
reg <- lm(Churn_out_rate~Salary_hike , data = emp_data) # lm(Y ~ X)
summary(reg)

confint(reg , level=0.95)
pred<- predict(reg,interval='predict')
View(pred)

#correlation btwn actual and predicted values
cor(reg$fit , emp_data$Churn_out_rate)

# RMSE
sqrt(mean(reg$residuals * reg$residuals))

# correlation between the predicted values is >0.85 ,hence it is a best model.