install.packages(" ")
library(readxl)

attach(Costomer_OrderForm)
View(Costomer_OrderForm)

Stacked_Data<- stack(Costomer_OrderForm)
View(Stacked_Data)

attach(Stacked_Data)
table(values,ind)

t2 <- prop.table(table (values))
t1 <- table(ind)

chisq.test(table (values,ind))
# Ho = The defective % does not vary across the centers
# Ha = The defective % varies across the centres
# p-value = 0.2771 > 0.05  => Accept null hypothesis
# => All countries have equal proportions 