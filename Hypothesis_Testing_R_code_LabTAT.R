install.packages(" ")
install.packages("car")
install.packages("Summary")
install.packages("aov")
library (readxl)

attach(LabTAT)
View(LabTAT)

Stacked_Data <- stack(LabTAT)
View(Stacked_Data)

attach(Stacked_Data)
 # Normality Check

shapiro.test(LabTAT $ `Laboratory 1`)
shapiro.test(LabTAT $ `Laboratory 2`)
shapiro.test(LabTAT $ `Laboratory 3`)
shapiro.test(LabTAT $ `Laboratory 4`)

# Ho = Samples are normalized
# Ha = samples are not normalized
# All Samples p values > 0.05 (alpha); P high null fly, accept null hypothesis

# variance equality check

y <- c(`Laboratory 1`,`Laboratory 2`,`Laboratory 3`,`Laboratory 4`)
group <- as.factor(c(rep(1, length(`Laboratory 1`)), rep(2, length(`Laboratory 2`)),rep(3, length(`Laboratory 3`)),rep(4, length(`Laboratory 4`))))

library(car)
leveneTest(y, group)

Anova_results <- aov(values~ind,data = Stacked_Data)
summary(Anova_results)

# Ho = there is no difference in the average Turn Around Time (TAT) of reports of the laboratories.
# Ha = there is difference in the average Turn Around Time (TAT) of reports of the laboratories.
# p values is relatively low < 0.05 , p low null go , we accept alternate hypothesis.
# Conclusion : there is difference in the avg TAT of reports of laboratory.



