tukey.outlier <- function(x, k = 1.5) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  x < (q1 - k * iqr) | x > (q3 + k * iqr)
}

tukey_multiple_buggy <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])  # BUG: && here
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

tryCatch(
  tukey_multiple_buggy(test_mat),
  error = function(e) cat("ERROR:", conditionMessage(e), "\n")
)


a <- c(TRUE, FALSE, TRUE)
b <- c(TRUE, TRUE, FALSE)
cat("a && b (scalar, first elements only):", a && b, "\n")
cat("a &  b (element-wise, all elements): ", a &  b, "\n")


  quakes
corrected_tukey <- function(x) {
  if (!is.matrix(x)) {
    stop("x must be a matrix.")
  }
  if (!is.numeric(x)) {
    stop("x must be a numeric matrix.")
  }
  
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])  # FIX: & not &&
  }
  
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  outlier.vec
}

cat
result <- corrected_tukey(test_mat)
print(result)
cat("Length:", length(result), "\n")
cat("Is logical vector:", is.logical(result), "\n")


tryCatch(
  corrected_tukey(data.frame(a = 1:3, b = 4:6)),
  error = function(e) cat("Error caught:", conditionMessage(e), "\n")
)

tryCatch(
  corrected_tukey(matrix(c("a", "b", "c", "d"), nrow = 2)),
  error = function(e) cat("Error caught:", conditionMessage(e), "\n")
)
