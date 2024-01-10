data(cars)
?cars
### looking at the begging of the data
head(cars)
###making Scatter plot with stopping distance as my response Y
###### and speed as my explanatory variable X
plot(dist~speed, data = cars, main = "Car Stopping Distance",
     ylab = "Stopping Distance(ft)", xlab ="Speed(MPH)")

## Modeling my response against my explanatory!
car_reg <- lm(dist ~ speed, data = cars) 

#adding regression line over plot 
abline(car_reg)

summary(car_reg)

## residual plot

plot(car_reg$residuals, main = "Residual Plot..")

