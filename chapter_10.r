# Chapter 10 > Packages > R learning 

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

# Loading packages 
library(lattice)

dotplot(
  variety ~ yield | site,
  data = barley,
  groups = year
)

pkgs <- c("lattice", "utils", "rpart")
for(pkg in pkgs)
{
  library(pkg, character.only = TRUE)
}

# The search path
search()

# Libraries and installed packages

View(installed.packages())
R.home("library")
.Library
path.expand("~")
Sys.getenv("HOME")
.libPaths()

# Installing packages

View(available.packages())

install.packages(
  c("xts", "zoo"),
  repos = "http://www.stats.bris.ac.uk/R"
)

# setInternet2()

install.packages(
  "path/to/downloaded/file/xts_0.8-8.tar.gz",
  repos = NULL,
  type = "source"
)

install.packages(
  "path/to/downloaded/file/xts_0.8.8.zip",
  repos = NULL,
  type = "win.binary"
)

install.packages("devtools")
library(devtools)
install_github("knitr", "yihui")

# Maintaining packages

update.packages(ask = TRUE)

# remove.packages('zoo)

# Test your knowledge 

# 10.1
# Answer: 
# CRAN is the packages repository
# Github, google code and bitbucket

# 10.2
# Answer:
# require returns a logical value
# library used to thrown an error that requiere can fix up

# 10.3
# Answer:
# its a folder that gather R packages

# 10.4
# Answer:
# .libPaths return a list of libraries

# 10.5
#It can use internet2.dll, nevertheless I got error while tyring to use it

# Exercise 
# Exercise 10.1

# Exercise 10.2
# library(lubridate)

# Exercise 10.3
# pkgs <- installed.packages()
# table(pkgs[, "LibPath])



