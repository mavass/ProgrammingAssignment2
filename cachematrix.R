## The function below creates a list containing a function to:
##set the value of the matrix
##get the value of the matrix
##set the value of the inversion
##get the value of the inversion

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set <- function (y){
    x<<-y
    m<<-NULL
  }
  get<- function() x
  setinverse<- function (solve) m <<-solve
  getinverse<- function () m
  list (set=set, get=get, setinverse=setinverse,getinverse=getinverse)
}


## The function below, works in the following manner:
##  first checks to see if the inversion has already been calculated
##  it gets the mean from the cache and skips the computation, if so.
##  it calculates the mean of the data and sets the value of the mean 
## in the cache via the setmean function, otherwise
cacheSolve <- function(x, ...) {
  m<- x$getinverse()
  if (!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<- solve(data,...)
  x$setinverse(m)
  m
}
