library(plyr)
library(data.table)

Student <- read.table(file.choose(), header = TRUE, sep = ",")
Student

StudentAverage <- ddply(Student, "Sex", transform, Grade.Average = mean(Grade))
StudentAverage

write.table(StudentAverage, "Students_Gendered_Mean", sep = ",")

i_students <- subset(Student, grepl("[iI]", Student$Name))
i_students
write.table(i_students, "DataSubset", sep = ",")

#https://rprogramingorestes.blogspot.com/2026/03/module-8-inputoutput-string.html
