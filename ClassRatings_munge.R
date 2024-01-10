Class_F <- as.data.table(c(Class_F, NA))
Class_G <- as.data.table(Class_G)
Class_H <- as.data.table(c(Class_H, NA))
Class_I <- as.data.table(Class_I)
Class_J <- as.data.table(c(Class_J, rep(NA, 7)))

ClassRatings <- cbind(Class_F, Class_G, Class_H, Class_I, Class_J)

names(ClassRatings) <- c("Class_F","Class_G","Class_H","Class_I","Class_J")


write.xlsx(ClassRatings, "ClassRatings.xlsx")
