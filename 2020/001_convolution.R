## file <- "001_convolution.R"
##
##
##

{
start  <- Sys.time()
options(error = browser)
options(error = NULL)
L  <- 10
x   <- 1:10
counter = 1
## initialize to zero
v  <- vector(mode = "integer", length = L*L)

for (i in 1:L) { 
    if (i+1 < L) {

        for (j in i+1:L){
            if (j == 9) browser()
            v[[counter]]  <- x[[i]] + x[[j]]
            counter  <<-  counter + 1
        }
        rm(j)
    }
}

print(Sys.time() - start)

}



for (i in 1:5) {
    for (j in seq(i+1, 5)) {
        if (i +1 < 5)
        cat (i, ", ", j , "\n")
    }
}
