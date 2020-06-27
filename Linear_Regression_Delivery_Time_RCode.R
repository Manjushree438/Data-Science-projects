# Load delivery_time.csv dataset
library(readr)

View(delivery_time)

#Explanatory Data Analysis
summary(delivery_time)
attach(delivery_time)

#graphical representation
hist(delivery_time$`Delivery Time`)
hist(delivery_time$`Sorting Time`)

qqnorm(delivery_time$`Delivery Time`)
qqline(delivery_time$`Delivery Time`)

qqnorm(delivery_time$`Sorting Time`)
qqline(delivery_time$`Sorting Time`)

#Scatter plot
plot(delivery_time$`Delivery Time`,delivery_time$`Sorting Time`)

#Correlation Coefficient (r)
cor(`Sorting Time`,`Delivery Time`)

# Simple Linear Regression model
reg <- lm(`Delivery Time` ~ `Sorting Time`) # lm(Y ~ X)
summary(reg)

confint(reg , level=0.95)
pred<- predict(reg,interval='predict')
View(pred)

#correlation btwn actual and predicted values
cor(reg$fit , delivery_time$`Delivery Time`)

# RMSE
sqrt(mean(reg$residuals * reg$residuals))

library(ggplot2)

ggplot(data = delivery_time, aes(x = `Sorting Time`, y = `Delivery Time`)) + 
  geom_point(color='blue') +
  geom_line(color='red',data = delivery_time, aes(x=`Sorting Time`, y=`Delivery Time`))

#transformation of input variable for improving accuracy of the model
reg_sqrt<-lm(`Delivery Time`~`Sorting Time`,data = delivery_time)
summary(reg_sqrt)

confint(reg_sqrt , level=0.95)
pred<- predict(reg_sqrt,interval='predict')
View(pred)

#correlation btwn actual and predicted values
cor(reg_sqrt$fit , delivery_time$`Delivery Time`)

# RMSE
sqrt(mean(reg_sqrt$residuals * reg_sqrt$residuals))

# Logrithamic Model

# x = log(sorting time); y = Delivery time

plot(log(`Sorting Time`), `Delivery Time`)
cor(log(`Sorting Time`), `Delivery Time`)


reg_log <- lm(`Delivery Time` ~ log(`Sorting Time`))   # lm(Y ~ X)

summary(reg_log)
# this model is not significant as the probability of intercept is > 0.05.

######################

# Exponential Model

# x = sorting time and y = log(delivery time)

plot(`Sorting Time`, log(`Delivery Time`))

cor(`Sorting Time`, log(`Delivery Time`))

reg_exp <- lm(log(`Delivery Time`) ~ `Sorting Time`)  #lm(log(Y) ~ X)

summary(reg_exp)

confint(reg_exp, level=0.95)
pred<- predict(reg_exp,interval='predict')
pred<-as.data.frame(pred)
View(pred)

#correlation between the predicted values and actual values
cor(pred$fit , delivery_time$`Delivery Time`)

# RMSE
sqrt(mean(reg_exp$residuals * reg_exp$residuals))

##############################
# Polynomial model with 2 degree (quadratic model)

plot(`Sorting Time`, `Delivery Time`)
plot(`Sorting Time`*`Sorting Time`, `Delivery Time`)

cor(`Sorting Time`*`Sorting Time`, `Delivery Time`)

plot(`Sorting Time`*`Sorting Time`,log(`Delivery Time`))

cor(`Sorting Time`, log(`Delivery Time`))
cor(`Sorting Time`*`Sorting Time`,log(`Delivery Time`))

# lm(Y ~ X + I(X*X) +...+ I(X*X*X...))


reg2degree <- lm(log(`Delivery Time`) ~ `Sorting Time` + I(`Sorting Time`*`Sorting Time`))

summary(reg2degree)

confint(reg2degree, level=0.95)
pred<- predict(reg2degree,interval='predict')
pred<-as.data.frame(pred)
View(pred)

#correlation between the predicted values and actual values
cor(pred$fit , delivery_time$`Delivery Time`)

# RMSE
sqrt(mean(reg2degree$residuals * reg2degree$residuals))


##############################
#  Polynomial model with 3 degree

reg3degree<-lm(log(`Delivery Time`)~`Sorting Time` + I(`Sorting Time`*`Sorting Time`) + I(`Sorting Time`*`Sorting Time`*`Sorting Time`))

summary(reg3degree)

#Compared to all the model polynomial 2 degree model is better as it has r squared value better than other models.


