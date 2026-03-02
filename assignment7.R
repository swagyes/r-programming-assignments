data("mtcars")
head(mtcars, 6)

class(mtcars)
typeof(mtcars)
isS4(mtcars)
summary(mtcars)


s3_student <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_student) <- "student_s3"

print.student_s3 <- function(x, ...) {
  cat("S3 Student\n")
  cat("Name:", x$name, "\n")
  cat("Age:", x$age, "\n")
  cat("GPA:", x$GPA, "\n")
}

summary.student_s3 <- function(object, ...) {
  out <- list(
    name = object$name,
    standing = ifelse(object$GPA >= 3.0, "Good standing", "Needs improvement")
  )
  class(out) <- "summary_student_s3"
  out
}

print.summary_student_s3 <- function(x, ...) {
  cat("S3 Student Summary\n")
  cat("Name:", x$name, "\n")
  cat("Standing:", x$standing, "\n")
}

s3_student
summary(s3_student)

s3_course <- list(code = "LIS4761", credits = 3, semester = "Spring 2026")
class(s3_course) <- "course_s3"

print.course_s3 <- function(x, ...) {
  cat("S3 Course\n")
  cat("Code:", x$code, "\n")
  cat("Credits:", x$credits, "\n")
  cat("Semester:", x$semester, "\n")
}

s3_course
library(methods)


setClass(
  "student_s4",
  slots = c(
    name = "character",
    age  = "numeric",
    GPA  = "numeric"
  )
)

setMethod("show", "student_s4", function(object) {
  cat('An object of class "student_s4"\n')
  cat('Slot "name":', object@name, "\n")
  cat('Slot "age":', object@age, "\n")
  cat('Slot "GPA":', object@GPA, "\n")
})

s4_student <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)
s4_student
isS4(s4_student)
slotNames(s4_student)


setClass(
  "course_s4",
  slots = c(
    code     = "character",
    credits  = "numeric",
    semester = "character"
  )
)

s4_course <- new("course_s4", code = "LIS4761", credits = 3, semester = "Spring 2026")
s4_course
isS4(s4_course)
slotNames(s4_course)

#https://rprogramingorestes.blogspot.com/2026/03/r-object-s3-vs-s4-assignment.html
