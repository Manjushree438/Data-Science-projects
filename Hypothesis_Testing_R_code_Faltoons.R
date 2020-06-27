install.packages(" ")
library(readxl)

attach(Faltoons)
View(Faltoons)

Stacked_Data <- stack(Faltoons)
View(Stacked_Data)

attach(Stacked_Data)
table(values, ind)

t2<- prop.table(table(values))
t1 <- table(ind)

chisq.test(table (values,ind))
# Ho = males versus females walking in to the store does not differ based on day of the week
# Ha = males versus females walking in to the store differ based on day of the week
# p-value = very less < 0.05  => reject null hypothesis
# Conclusion :males versus females walking in to the store differ based on day of the week.



