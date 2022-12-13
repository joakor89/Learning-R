# Chapter 11 > Date & times > R learning 

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
library(lubridate)


#Dates & times clasess

(now_ct <- Sys.time())
class(now_ct)

unclass(now_ct)
(now_lt <- as.POSIXlt(now_ct))

class(now_lt)

unclass(now_lt)

now_lt$sec

# now_lt[["min"]]

(now_date <- as.Date(now_ct))
class(now_date)
unclass(now_date)

# Parsing dates
moon_landing_str <- c(
  "20:17:40 20/07/1969",
  "06:54:35 19/11/1969",
  "09:18:11 05/02/1971",
  "22:16:29 30/07/1971",
  "02:23:35 21/04/1972",
  "19:54:57 11/12/1972"
)
(moon_landing_lt <- strptime(
  moon_landing_str,
  "$H:%M:%S %d/%m/%Y",
  tz = "UTC"
))

strftime(now_ct, "It's %I:%M%p on %A %d %B, %Y.")
strftime(now_ct, tz = "America/Los_Angeles")
strftime(now_ct, tz = "Africa/Brazzaville")
strftime(now_ct, tz = "Asia/Kolkata")
strftime(now_ct, tz = "Australia/Adelaide")

strftime(now_ct, tz = "EST")
strftime(now_ct, tz = "PST8DPT")

strftime(now_ct, tz = "Asia/Tokyo")
strftime(now_lt, tz = "Asia/Tokyo")
strftime(as.POSIXct(now_lt), tz = "Asia/Tokyo")

# Arithmetic with dates & times 

now_ct + 86400 

now_lt + 86400

now_date + 1

the_start_of_time <- 
  as.Date("1970-01-01")
the_end_of_time <-
  as.Date("2012-12-21")
(all_time <- the_end_of_time - the_strat_of_time)

class(all_time)
unclass(all_time)

difftime(the_end_of_time, the_start_of_time, units = "secs")
difftime(the_end_of_time, the_start_of_time, units = "weeks")
seq(the_start_of_time, the_end_of_time, by = "1 year")
seq(the_start_of_time, the_end_of_time, by = "500 days")

# Lubridate 
library(lubridate)

john_harrison_birth_date <- c(
  "1693-03 24",
  "1693/03\\24",
  "Tuesday+1693.03*24"
)

ymd(john_harrison_birth_date)

data_format_function <-
  stamp("A moon landing occurred on Monday 01 January 1900 at 18:00:00.")

(duration_one_to_ten_years <- dyears(1:10))

today() + duration_one_to_ten_years
(period_one_to_ten_years <- years(1:10))
today() + period_one_to_ten_years

a_year <- dyears(1)
as.period(a_year)

start_date <- ymd("2016-02-28")
(interval_over_leap_year <- new_interval(
  start_date,
  start_date + a_year
))

as.period(interval_over_leap_year)

# Test your knowledge

# 11.1
#  Answer: POSIXct 

#11.2
# Answer: At midnight of january 1, 1970.

#11.3
# Answer: "%B %Y
# 11.4
# Answer: 
x <- Sys.time()
x + 3600

#11.5
# Answer: 60 *60 * 24 *365seconds

# Exercise 
# Exercise 11.1
in_string <- c("1940-07-07", "1940-10-09", "1942-06-18", "1943-02-25")
(parsed <- strptime(in_string, "%Y-%m-%d"))
(out_string <- strftime(parsed, "%a %d %b %y"))

# Exercise 11.2
tzfile <- file.path(R.home("share"), "zoneinfo", "zone.tab")
tzones <- read.delim(
  tzfile,
  row.names = NULL,
  header = FALSE,
  col.names = c("country", "coords", "name", "comments"),
  as.is = TRUE,
  fill = TRUE,
  comment.char = "#"
)
View(tzones)
subset(tzones)

# Exercise 11.3
zodiac_sign <- function(x)
{
  month_x <- month(x, label = TRUE)
  day_x <- day(x)
  switch(
    month_x,
    Jan = if(day_x < 20) "Capricorn" else "Aquarius",
    Feb = if(day_x < 19) "Aquarius" else "Pisces",
    Mar = if(day_x < 21) "Pisces" else "Aries",
    Apr = if(day_x < 20) "Aries" else "Taurus",
    May = if(day_x < 21) "Taurus" else "Gemini",
    Jun = if(day_x < 21) "Gemini" else "Cancer",
    Jul = if(day_x < 23) "Cancer" else "Leo",
    Aug = if(day_x < 23) "Leo" else "Virgo",
    Sep = if(day_x < 23) "Virgo" else "Libra",
    Oct = if(day_x < 23) "Libra" else "Scorpio",
    Nov = if(day_x < 22) "Scorpio" else "Sagittarius",
    Dec = if(day_x < 22) "Sagittarius" else "Aquarius"
  )
}

niculaus_copernicus_birth_date <- as.Date("1473-02-19")
zodiac_sign(niculaus_copernicus_birth_date)




















































































