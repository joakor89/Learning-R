# Chapter 12 > Getting data > R learning 

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
install.packages("survival")
library(survival)
install.packages("learningr")
library(learningr)
install.packages("XML")
library(XML)
install.packages("RJSONIO")
library(RJSONIO)
install.packages("rjson")
library(rjson)
install.packages("foreign")
library(foreign)
install.packages("R.matlab")
library(R.matlab)
install.packages("WDI")
library(WDI)



# Built-in datasets
data()
data(package = .packages(TRUE))

head(kidney)

# Reading text files 

# CSV or tab delimited
# eXtensible Markup Language (XML)
# JavaScript object notation (JSON)
# YALM A'int markup language

# CSV & tab-delimited files

deer_file <- system.file(
  "extdata",
  "RedDeerEndocrinalVolume.dml",
  package = "learningr"
)

deer_data <- read.table(deer_file, header = TRUE, fill = TRUE)
str(deer_data, vec.len = 1)
header(deer_data)

crab_file <- system.file(
  "extdata",
  "crabtag.csv",
  package = "learningr"
)

(crab_id_block <- read.csv(
  crab_file,
  header = FALSE,
  skip = 3,
  nrow = 2
))

(crab_tag_noteook <- read.csv(
  crab_file,
  header = FALSE,
  skip = 8,
  nrows = 5
))

(crab_lifetime_notebook <- read.csv(
  crab_file,
  header = FALSE,
  skip = 15,
  nrow = 3
))

# write.csv(
#  crab_lifetime_notebook,
#  "Data/Cleaned/crab lifetime data.csv",
#  row.names = FALSE,
#  fileEncoding = "utf8"
# )

# Unstructure text files

text_file <- system.file(
  "extdata",
  "Shakespeare's The Tempest, from Project Gutenberg pg2235.txt",
  package = "learningr"
)
the_tempest <- readLines(text_file)
the_tempest[1926:1927]

writeLines(
  rev(text_file),
  "Shakespeare's The Tempest, backwards.txt"
)

xml_file <- system.file("extdata", "options.xml", package = "learningr")
r_options <- xmlParse(xml_file)
xmlParse(xml_file, useInternalNodes = FALSE)
xmlTreeParse(xml_file)
xpathSApply(r_options, "//variable[contains(@name, 'warn')]")

jamaican_city_file <- system.file(
  "extdata",
  "Jamaican Cities.json",
  package = "learningr"
)

(jamaican_cities_RJSONIO <- RJSONIO::fromJSON(jamaican_city_file))
(jamaican_cities_rjson <- rjson::fromJSON(file = jamaican_city_file))

special_number <- c(NaN, NA, Inf, -Inf)
RJSONIO::toJSON(special_number)

install.packages("readxl")
library(readxl)
bike_file <- system.file(
  "extdata",
  "Alpe d'Huez.xls",
  package = "learningr"
)

bike_data <- read.xlsx2(
  bike_file,
  sheetIndex = 1,
  starRow = 2,
  endRow = 38,
  colIndex = 2:8,
  colClasses = c(
    "character", "numeric", "character", "integer",
    "character", "character", "character"
  )
)

head(bike_data)

# Web data
# list all available data

wdi_datasets <- WDIsearch()
head(wdi_datasets)

wdi_trade_in_services <- WDI(
  indicator = "BG.GSR.NFSV.GD.ZS"
)

str(wdi_trade_in_services)

# Scraping web pages

salary_url <- "http://www.justinmrao.com/salary_data.csv"
salary_data <- read.csv(salary_url)
str(salary_data)

# Test your knowledge

# 12.1

# 12.2

# 12.3

# 12.4

# 12.5

# Exercise
# Exercise 12.1
# Answer: used the system.
hafu_file <- system.file("extdata", "hafu.csv", package = "learningr")
hafu_data <- read.csv(hafu_file)

# Exercise 12.2
# Answer: 
install.packages("readxl")
library(readxl)
gonorrhoea_file <- system.file(
  "extdata",
  "multi-drug-resistant gonorrhoea infections.xls",
  package = "learningr"
)
gonorrhoea_data <- read.xlsx2(
  gonorrhoea_file,
  sheetIndex = 1,
  colclasses = c("integer", "character", "character", "numeric")
)
# Exercise12.3
# Answer: 
library(DBI)
install.packages("RSQLite")
library(RSQLite)

driver <- dbDriver("SQLite")
db_file <- system.file("extdata", "crabtag.sqlite", package = "learningr")
conn <- dbConnect(driver, db_file)

query <- "SELECT * Daylog"
head (Daylog <- dbGetQuery(conn, query))









































