# Chapter 17 > Making packages > R learning 

# Packages
installr::install.Rtools()

install.packages(c("devtools", "roxygen2"))
install.packages("Rcpp")
install.packages("knitr")

hypotenuse <- function(x, y)
{
  sqrt(x ^ 2 + y ^ 2)
}
pythagorean_triples <- data.frame(
  x = c(3, 5, 8, 7, 9, 11, 12, 13, 15, 16, 17, 19),
  y = c(4, 12, 15, 24, 40, 60, 35, 84, 112, 63, 144, 180),
  z = c(5, 13, 17, 25, 41, 61, 37, 85, 113, 65, 145, 181)
)

package.skeleton(
  "pythagorus",
  c("hypotenuse", "pythagorean_triples")
)

library(R.oo)
Rdoc$getKeywords()

library(devtools)
check("path/to/root/package")
build("path/tp/root/of/package")

hypotenuse <- function(x, y, p =2)
{
  if(!missing(p))
  {
    .NotYetUsed("p")
  }
  sqrt(x ^ 2 + y ^ 2)
}
hypotenuse(5, 12, 1)

hypotenuse <- function(x, y, p = 2)
{
  (x ^ 2 + y ^ p) ^ (1 / p)
}

hypotenuse <- function(x, y, p = 2)
{
  .Depreceated("p_norm")
  (x ^ p + y ^ p) ^ (1 / p)
}
hypotenuse(5, 12)

hypotenuse <- function(x, y, p = 2)
{
  .Defunct('p_norm')
}
hypotenuse(5 ,12)
























