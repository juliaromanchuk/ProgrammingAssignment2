makeCacheMatrix <- function (x = matrix()) {
  invrs <- NULL
  set <- function(y) {
    x <<- y
    invrs <<- NULL
  }
  get <- function() x
  setinvrs <- function(inverse) invrs <<- inverse
  getinvrs <- function() invrs
  list(set = set, get = get, setinvrs = setinvrs, getinvrs = getinvrs)
}

cacheSolve <- function(x, ...){
  invrs <- x$getinvrs()
  if(!is.null(invrs)) {
    message("getting cached data")
    return(invrs)
  }
  matrix.invrs <- x$get()
  invrs <- solve(matrix.invrs,...)
  x$setinvrs(invrs)
  return(invrs)
  
}