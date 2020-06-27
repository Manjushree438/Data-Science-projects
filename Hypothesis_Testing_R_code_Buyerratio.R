install.packages(" ")
library (readxl)

attach(BuyerRatio)
View(BuyerRatio)

# proportion test in east region
table(`Observed Values`,East)
t2 <- prop.table(table (East))
t1 <- table(`Observed Values`)

chisq.test(table (`Observed Values`,East))

# proportion test in west region

table(`Observed Values`,West)
t2 <- prop.table(table (West))
t1 <- table(`Observed Values`)

chisq.test(table (`Observed Values`,West))

# proportion test in north region

table(`Observed Values`,North)
t2 <- prop.table(table (North))
t1 <- table(`Observed Values`)

chisq.test(table (`Observed Values`,North))

# proportion test in south region

table(`Observed Values`,South)
t2 <- prop.table(table (South))
t1 <- table(`Observed Values`)

chisq.test(table (`Observed Values`,South))
# Ho = all proportions are equal.
# Ha = all proportions are not equal
# p >0.05 , p high null fly , accept null hypothesis