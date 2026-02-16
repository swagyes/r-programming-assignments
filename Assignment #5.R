A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

dim(A)
dim(B)

detA <- det(A)
detA

#try(solve(A))
#try(det(B))
#try(solve(B))

qr(A)$rank
#https://rprogramingorestes.blogspot.com/2026/02/module-5-assignment.html
