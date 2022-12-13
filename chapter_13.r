# Chapter 13 > Cleaning & transforming > R learning 

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

install.packages("learningr")
library(learningr)
install.packages("reshape2")
library(reshape2)

install.packages("gsubfn")
library(gsubfn)
install.packages("proto")
library(proto)
install.packages("sqldf")
library(sqldf)

install.packages("DBI")
library(DBI)
install.packages("tcltk")
library(tcltk)
install.packages("chron")
library(chron)
install.packages("RSQLite")
library(RSQLite)

install.packages("plyr")
library(plyr)

# to check
install.packages("RSQLite.extfuns")
library(RSQLite.extfuns)



# Cleaning strings 

yn_to_logical <- function(x)
{
  y <- rep.int(NA, length(x))
  y[x == "y"] <- TRUE
  y[x == "N"] <- FALSE
  y
}

alpe_d_huez$DrugUse <- yn_to_logical(alpe_d_huez$DrugUse)
?grep
?stringr

data("english_monarchs", package = "learningr")
head(english_monarchs)

library(stringr)
multiple_kingdoms <- str_detect(english_monarchs$domain, fixed(","))
english_monarchs[multiple_kingdoms, c("name", "domain")]

multiple_rulers <- str_detect(english_monarchs$name, ", |and")
english_monarchs$name[multiple_rulers & !is.na(multiple_rulers)]

individual_rulers <- str_split(english_monarchs$name, ", | and ")
head(individual_rulers[sapply(individual_rulers, length) > 1])

th <- c("th", "ð")
sapply(
  th,
  function(th)
  {
    sum(str_count(english_monarchs$name, th))
  }
)

gender <- c(
  "MALE", "MALE", "male", "M", "FEMALE",
  "Female", "female", "f", NA
)

clean_gender <- str_replace(
  gender,
  ignore.case("^m(ale)?$"),
  "Male"
)

(clean_gender <- str_replace(
  clean_gender,
  ignore.case("^f(emale)?$"),
  "Female"
))

# Manipulating data frames
# Adding & replacing columns

english_monarchs$length.of.reign.years <-
  english_monarchs$end.of.reign - english_monarchs$start.of.reign

english_monarchs$length.of.reign.years <- with(
  english_monarchs,
  end.of.reign - start.of.reign
)

english_monarchs <- within(
  english_monarchs,
  {
    length.of.reign.years <- end.of.reign - start.of.reign
    reign.was.more.than.30.years <- length.of.reign.years > 30
  }
)

english_monarchs <- mutate(
  english_monarchs,
  length.of.reign.years = end,of,reign - start.of.reign,
  reign.was.more.than.30.years = length.of.reign.years > 30
)

# Dealing with missing values 

data("deer_endocranial_volume", package = "learningr")

has_all_measurements <- complete.cases(deer_endocranial_volume)
deer_endocranial_volume[has_all_measurements, ]

na.omit(deer_endocranial_volume)

na.fail(deer_endocranial_volume)

# Converting between wide and long form

deer_wide <- deer_endocranial_volume[, 1:5]

deer_long <- melt(deer_wide, id.vars = "SkullID")
head(deer_long)

melt(deer_wide, measure.vars = c("VolCT", "VolBead", "VolLWH", "VolFinarelli"))
deer_wide_again <- dcast(deer_long, SkullID ~ variable)

subset(
  deer_endocranial_volume,
  VolCT > 400 | VolCT2 > 400,
  c(VolCT, VolCT2)
)

query <-
  "SELECT
  VolCT,
  VolCT2
  FROM
  deer_endocranial_volume
  WHERE
  VolCT > 400 OR
  VolCT2 > 400"
sqldf(query)

# Sorting

x <- c(2, 32, 4, 16, 8)
sort(x)

sort(x, decreasing = TRUE)
sort(c("I", "shot", "the", "city", "sheriff"))
order(x)
x[order(x)]
identical(sort(x), x[order(x)])

year_order <- order(english_monarchs$start.of.reign)
english_monarchs[year_order, ]

arrange(english_monarchs, start.of.reign)
(x <- sample(3, 7, replace = TRUE))

# Functional programming

ct2 <- deer_endocranial_volume$VolCT2
isnt.na <- Negate(is.na)
identical(isnt.na(ct2), !is.na(ct2))

Filter(isnt.na, ct2)

Position(isnt.na, ct2)

Find(isnt.na, ct2)

get_volume <- function(ct, bead, lwh, finarelli, ct2, bead2, lhw2)
{
  if(!is.na(ct2))
  {
    ct <- (ct + ct2) / 2
    bead <- (bead + bead2) / 2
    lwh <- (lwh + lwh2) / 2
  }
  c(ct, bead = bead, lwh.4 = lhw / 4, finarelli = finarelli)
}

measurements_by_deer <- with(
  deer_endocranial_volume,
  Map(
    get_volume,
    VolCT,
    VolBead,
    VolLWH,
    VolFinarelli,
    VolCT2,
    VolBead2,
    VolLWH2
  )
)
head(measurements_by_deer)

# Test your knowledge 
# 13-1 
# Answer: readLines for character vectors & str_count to count numbers

# 13-2
# Answer: with, within, mutate and transform to manipulate or add columns


# 13-3
# Answer: Casting.


# 13-4
# Answer: it can e handle with order or arrange


#13-5
# Answer: defines function that reads TRUE whe is a postive number
# is.positive <- function(x) also Find(is.positive, x)

# Exercise
# Exercise 13.1
# To detect
library(stringr)
data(hafu, package = "learningr")
hafu$FatherNationalityIsUncertain <- str_detect(hafu$Father, fixed("?"))
hafu$FatherNationalityIsUncertain <- str_detect(hafu$Mother, fixed("?"))

# To replace
hafu$Father <- str_replace(hafu$Father, fixed("?"), "")
hafu$Mother <- str_replace(hafu$Mother, fixed("?"), "")

# Exercise 13.2

hafu_long <- melt(hafu, measure.vars = c("Father", "Mother"))

# Exercise 13.3

top10 <- function(x)
{
  counts <- table(x, useNA = "always")
  head(sort(counts, decreasing = TRUE), 10)
}
top10(hafu$Mother)

top10_v2 <- function(x)
{
  counts <- count(x)
  head(arrange(counts, desc(freq)), 10)
}
top10_v2(hafu$Mother)




























