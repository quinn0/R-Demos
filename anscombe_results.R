data("anscombe")
model_1 <- lm(y1~x1, data = anscombe)
model_2 <- lm(y2~x2, data = anscombe)
model_3 <- lm(y3~x3, data = anscombe)
model_4 <- lm(y4~x4, data = anscombe)

summary(model_1)
summary(model_2)
summary(model_3)
summary(model_4)

plot(y1~x1, data = anscombe)
abline(model_1)


plot(y2~x2, data = anscombe)
abline(model_2)
plot(y3~x3, data = anscombe)
abline(model_3)
plot(y4~x4, data = anscombe)
abline(model_4)

plot(model_1$residuals)
plot(model_2$residuals)
plot(model_3$residuals)
plot(model_4$residuals)

par(mfrow=c(2,4))

plot(y1~x1, data = anscombe)
abline(model_1)


plot(y2~x2, data = anscombe)
abline(model_2)
plot(y3~x3, data = anscombe)
abline(model_3)
plot(y4~x4, data = anscombe)
abline(model_4)

plot(model_1$residuals)
plot(model_2$residuals)
plot(model_3$residuals)
plot(model_4$residuals)

x <- 70.5
