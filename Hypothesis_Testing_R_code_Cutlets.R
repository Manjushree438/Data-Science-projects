install.packages(" ")
library (readxl)

attach(Cutlets)
View(Cutlets)

# Normality Check for both Samples #
shapiro.test(`Unit A`)
# Ho = Samples are normalised , Ha = Samples are not normalized
# p-value = 0.32 >0.05(alpha) , so p high null fly , It follows normal distribution #

shapiro.test(`Unit B`)
# Ho = Samples are normalised , Ha = Samples are not normalized
# p-value = 0.52 >0.05(alpha) , so p high null fly , It follows normal distribution #

# Variance Test #

var.test(`Unit A`,`Unit B`)
# Ho = variances are equal , Ha= variances are not equal
# p-value = 0.3136 which is greater than alpha (0.05),so p high null fly , Ho is true  and variances are equal #

# Variance are equal, we perform 2- Sample Test 

t.test(`Unit A`,`Unit B`,alternative = "two.sided", conf.level = 0.95, correct = TRUE  )
 # p-value = 0.47 > 0.05 (alpha) accept null hypothesis 
# Ho = there is no significant difference in the diameter of the cutlet between two units
# Ha = there is significant difference in the diameter of the cutlet between two units
