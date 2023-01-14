# Chapter 9 > Advanced looping > R learning 

# Packages 
install.packages("tidyverse")
library(tidyverse)
install.packages("class")
library(class)
install.packages("dtplyr")
library(dtplyr)
install.packages("Matrix")
library(Matrix)
install.packages("ggplot2")
library(ggplot2)


#Replication
# Mainly used in the Monte Carlo analysis
rep(runif(1), 5)
replicate(5, runif(1))

# Time for commute function

time_for_commute <- function()
{
  #Choose a mode of transport for the day
  mode_of_transport <- sample(
    c("car", "bus", "train", "bike"),
    size = 1,
    prob = c(0.1, 0.2, 0.3, 0.4)
  )
  # Find the time travel, depending upon mode of transport
  time <- switch(
    mode_of_transport,
    car = rlnorm(1, log(30), 0.5),
    bus = rlnorm(1, log(40), 0.5),
    train = rnorm(1, 30, 10),
    bike = rnorm(1, 60, 5)
  )
  names(time) <- mode_of_transport
}

replicate(5, time_for_commute())

# Looping over lists

prime_factors <- list(
  two = 2,
  three = 3,
  four = c(2, 2),
  five = 5,
  six = c(2, 3),
  seven = 7,
  eight = c(2, 2, 2),
  nine = c(3, 3),
  ten = c(2, 5)
)

head(prime_factors)

unique_primes <- vector("list", length(prime_factors))
for (i in seq_along(prime_factors))
{
  unique_primes[[i]] <- unique(prime_factors[[i]])
}

names(unique_primes) <- names(prime_factors)
unique_primes

lapply(prime_factors, unique)
vapply(prime_factors, length, numeric(1)) # list that return a vector
sapply(prime_factors, unique) # return to list

sapply(prime_factors, length) # return a vector 
sapply(prime_factors, summary) # return an array
sapply(list(), length)
vapply(list(), length, numeric(1))

# r_files <- dif(pattern = "\\.R$")
# lapply(r_files, source)

complemented <- c(2, 3, 6, 18)
lapply(complemented, rep.int, times = 4)
rep4x <- function(x) rep.int(4, times = x)
lapply(complemented, rep4x)
lapply(complemented, function(x) rep.int(4, times = x))

env <- new.env()
env$molien <- c(1, 0, 1, 0,1, 1, 2, 1, 3)
env$larry <- c("Really", "leery", "rarely", "Larry")
eapply(env, length)

# Looping over arrays 

install.packages("matlab")
library(matlab)

(magic4 <- magic(4))
rowSums(magic4)

apply(magic4, 1, sum)
apply(magic4, 1, toString)
apply(magic4, 2, toString)

(baldwins <- data.frame(
  name = c("Alec", "Daniel", "Billy", "stephen"),
  date_of_birth = c(
    "1958-Apr-03", "1960-Oct-05", "1963-Feb-21", "1966-May-12"
  ),
  n_spouses = c(2, 3, 1, 1),
  n_children = c(1, 5, 3, 2),
  stringAsFactors = FALSE
))

apply(baldwins, 1, toString)
sapply(baldwins, range)

# Multiple-Input apply

msg <- function(name, factors)
{
  ifelse(
    length(factors) == 1,
    paste(name, "is prime"),
    paste(name, "has factors", toString(factors))
  )
}

mapply(msg, names(prime_factors), prime_factors)

# Instant vectorization
baby_gender_report <- function(gender)
{
  switch(
    gender,
    male = "It's a boy",
    female = "It's a girl",
    "Um..."
  )
}

genders <- c("male", "female", "other")
baby_gender_report(genders)

# Better approach
vectorize_baby_gender_report <- Vectorize(baby_gender_report)
vectorize_baby_gender_report(genders)

# Split-apply-combine

(frogger_scores <- data.frame(
  player = rep(c("Tom", "Dick", "Harry"), times = c(2, 5, 3)),
  score = round(rlnorm(10, 8), -1)
))

(scores_by_player <- with(
  frogger_scores,
  split(score, player)
))

(list_of_means_by_player <- lapply(scores_by_player, mean))
(list_mean_by_player <- lapply(scores_by_player, mean))
(mean_by_player <- unlist(list_of_means_by_player))
with(frogger_scores, tapply(score, player, mean))

# The plyr package
install.packages("plyr")
library(plyr)
laply(prime_factors, length)
laply(list(), length)

raply(5, runif(1))
rlply(5, runif(1))
rdply(5, runif(1))
r_ply(5, runif(1))

ddply(
  frogger_scores,
  .(player),
  colwise(mean)
)

ddply(
  frogger_scores,
  .(player),
  summarize,
  mean_score = mean(score),
  max_level = max(level)
)

# Test your knowledge 

# 9.1
# answer: apply, mapply, lapply, vapply, sapply & tapply

# 9.2
# lapply return a list
# vapply return a vector or array
# sapply return either

# 9.3
# Answer: rapply is recursive ideal for trees

# 9.4
# Tapply or plyr can be use for this purpose

# 9.5
# on **ply. the first asterisk denotes the type of first input 
# the second denotes the type of return value

# Exercise 
# Exercise 9.1
wayans <- list(
  "Dwayne Kim" = list(),
  "Keenen Ivory" = list(
    "Jolie Ivory Imani",
    "Nala",
    "Keenen Ivory Jr",
    "Bella",
    "Daphne Ivory"
  ),
  Damon = list(
    "Damon Jr",
    "Michael",
    "Cara Mia",
    "Kyla"
  ),
  Kim = list(),
  Shawn = list(
    "Laila",
    "Illia",
    "Marlon"
  ),
  Marlon = list(
    "Sahwn Howell",
    "Arnai Zachary"
  ),
  Nadia = list(),
  Elvira = list(
    "Damien",
    "Chaunté"
  ),
  Diedre = list(
    "Craig",
    "Gregg",
    "Summer",
    "Justin",
    "Jamel"
  ),
  Vonnie = list()
)

# Answer:
vapply(wayans, length, integer(1))

# Exercise 9.2
state.x77

#Answer: 
head(state.x77)
str(state.x77)
class(state.x77)


# Exercise 9.3
commute_times <- replicate(1000, time_for_commute())

commute_data <- data.frame(
  time = commute_times,
  mode = names(commute_times)
)

# Answer: 

with(commute_data, tapply(time, mode, quantile, prob = 0.75))






























