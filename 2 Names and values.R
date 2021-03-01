# 2.1 Introduction --------------------------------------------------

library(lobstr)

# 2.2 Binding basics ------------------------------------------------

x <- c(1, 2, 3)
# R is creating an object, a vector of values (1, 2, 3) and binding that object to a
# name, x.

y <- x
# Access an object's identifier with lobstr::obj_addr()
obj_addr(x)
obj_addr(y)

# 2.2.1 Non-syntatic names ------------------------------------------

# A syntactic name must consist of letters10, digits, . and _ but can’t begin with _ 
# or a digit. Additionally, you can’t use any of the reserved words like TRUE, NULL, 
# if, and function (see the complete list in ?Reserved)

# 2.2.2 Exercises ---------------------------------------------------

# 1. Explain the relationship between a, b, c and d in the following code:
a <- 1:10
b <- a
c <- b
d <- 1:10

# a, b and c are all point to the same object, a vector of value 1:10. d points to
# a different object with the same values.

obj_addrs(list(a, b, c, d))

# 2. The following code accesses the mean function in multiple ways. Do they all 
# point to the same underlying function object? Verify this with lobstr::obj_addr().

mean
base::mean
get("mean")
evalq(mean)
match.fun("mean")

# Yes they all point to the same underlying function object:-
obj_addrs(list(mean, base::mean, get("mean"), evalq(mean), match.fun("mean")))

# 3. By default, base R data import functions, like read.csv(), will automatically
# convert non-syntactic names to syntactic ones. Why might this be problematic? 
# What option allows you to suppress this behaviour?

# Often we want to keep the column names as they are in the import file. To do this
# select check.names = FALSE in the read.csv() function arguments.

# 4. What rules does make.names() use to convert non-syntactic names into syntactic 
# ones?
  
# 5. I slightly simplified the rules that govern syntactic names. Why is .123e1 not 
# a syntactic name? Read ?make.names for the full details.

