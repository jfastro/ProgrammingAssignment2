## Put comments here that give an overall description of what your
## functions do
The functions below allow the user to either compute the
inverse of a given matrix directly or get the value of the
inverse from cache memory if it has already been computed.

## Write a short comment describing this function
The function makeCacheMatrix returns a list containing the
functions used to set and get the cache values of both the
matrix (x) and its inverse (inv).

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv) m <<- inv
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function
The function cacheSolve takes as argument the list
returned by the function makeCacheMatrix. It first
checks if the matrix inverse already exists in cache
memory using getinv() and returns the result if that
is indeed the case. If not, it evaluates the matrix
inverse directly using solve() and then caches the
value of the matrix inverse using setinv(), the
value of the matrix inverse is returned. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}

