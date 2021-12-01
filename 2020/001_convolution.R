## file <- "001_convolution.R"
##
##
##

{
start  <- Sys.time()
#options(error = browser)
options(error = NULL)
L  <- 10
x   <- 1:10
counter = 1
## initialize to zero
v  <- vector(mode = "integer", length = L*L)

for (i in 1:L) { 
        for (j in i:L){
#            if (counter == 45) {browser()}
            if( i < j){
                v[[counter]]  <- x[[i]] + x[[j]]
                if (v[[counter]] == 13) print("you win prize")
                counter  <<-  counter + 1
            }
        }
}

print(Sys.time() - start)
v

}




#### sapply version
{

start  <- Sys.time()
#options(error = browser)
options(error = NULL)
L  <- 10
x   <- 1:10
counter = 1
## initialize to NA
v  <- matrix(ncol=L, nrow=L)
sapply(1:L, function(i) {
           if (i < j)   # removes diagonal (lower triangle already skipped)
           sapply(i:L, function(j) { v[[i, j]] <<- x[[i]] + x[[j]] })
        })
print(Sys.time() - start)
v
}
