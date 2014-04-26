## Put comments here that give an overall description of what your
## functions do



## The first function takes an argument x of type matrix.

## It returns a list of 4 elements. These 4 elements are functions.

## So this first function can be used to create a special object, like: 

## special_object <- makeCacheMatrix(matrix(1:4,2)) 

##  Now we can call the second function, and use our created special object as an argument, like so:

### cacheSolve(special_object)




## Write a short comment describing this function

## Using the first function, we create a special object containing 4 functions.

## This is like a toolbox with 4 specialised tools.

## And also inside this object (or rather, in the environment of the object) we stow our matrix data.


makeCacheMatrix <- function(x = matrix()) {

        cachedMatrix <- NULL

        set <- function(y) {

                x <<- y

                cachedMatrix <<- NULL

        }

        get <- function() x

        setInverse <- function(bob) cachedMatrix <<- bob

        getInverse <- function() cachedMatrix

        list(set = set, get = get,

             setInverse = setInverse,

             getInverse = getInverse)

}


## Write a short comment describing this function

## This function takes our object created via the first function as an argument

## It checks if the the matrix contained in the object has already been inverted via the solve function beforehand.

## If this is the case, then it just returns the cached data (the already inverted matrix) and prints a message.

## If this is not the case, then it takes the original, non-inverted matrix data contained in the object and inverts it via the solve function.

## ... and saves this inverted matrix via the setInverse function. So that for the next call, the cache is no longer empty, but full.

cacheSolve <- function(x, ...) {

        m <- x$getInverse()

        if(!is.null(m)) {

                message("getting cached data")

                return(m)

        }

        data <- x$get()

        m <- solve(data)

        x$setInverse(m)

        m

}