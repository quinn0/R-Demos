Class_F <- as.data.table(c(Class_F, NA)) %>% setnames(names(.), "Class_F")
Class_G <- as.data.table(Class_G)
Class_H <- as.data.table(c(Class_H, NA)) %>% setnames(names(.), "Class_H")
Class_I <- as.data.table(Class_I)
Class_J <- as.data.table(c(Class_J, rep(NA, 7))) %>% setnames(names(.), "Class_J")

ClassRatings <- cbind(Class_F, Class_G, Class_H, Class_I)

write.xlsx(ClassRatings, "ClassRatings.xlsx")
