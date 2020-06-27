# Load delivery_time.csv dataset
library(readr)

View(Salary_Data)

#Explanatory Data Analysis
summary(Salary_Data)
attach(Salary_Data)

#graphical representation
hist(Salary_Data$YearsExperience)
hist(Salary_Data$Salary)

qqnorm(Salary_Data$YearsExperience)
qqline(Salary_Data$YearsExperience)

qqnorm(Salary_Data$Salary)
qqline(Salary_Data$Salary)

#Scatter plot
plot(Salary_Data$YearsExperience,Salary_Data$Salary)

#Correlation Coefficient (r)
cor(YearsExperience,Salary)

# Simple Linear Regression model
reg <- lm(Salary~YearsExperience , data = Salary_Data) # lm(Y ~ X)
summary(reg)

confint(reg , level=0.95)
pred<- predict(reg,interval='predict')
View(pred)

#correlation btwn actual and predicted values
cor(reg$fit , Salary_Data$Salary)

# RMSE
sqrt(mean(reg$residuals * reg$residuals))

# correlation between the actual and predicted values is >0.85 ,hence it is a best model.