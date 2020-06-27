getwd()
View(calories_consumed)
install.packages("lattice")
library("lattice")

# renaming Colnames
colnames(calories_consumed)<- c("weight","calories")
View(calories_consumed)

# Explanatory Data Analysis
summary(calories_consumed)

#Scatter plot
plot(calories_consumed$weight, calories_consumed$calories)  # plot(X,Y)

attach(calories_consumed)

#Correlation Coefficient (r)
cor(weight,calories)             # cor(X,Y)

# Simple Linear Regression model
reg <- lm(weight ~ calories) # lm(Y ~ X)

summary(reg)

confint(reg, level=0.95)
pred<- predict(reg,interval='predict')
pred<-as.data.frame(pred)
View(pred)

#correlation between the predicted values and actual values
cor(pred$fit , calories_consumed$weight)

# RMSE
sqrt(mean(reg$residuals * reg$residuals))

#the correlation btwn the actual and predicted values which is good, Hence not applying any transformation techniques as the performance of the model is good.






