# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
View(vehicles)
# Create a data.frame of vehicles from 1997
this.year <- vehicles[vehicles$year==1997,]
View(this.year)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
only.one <- unique(this.year$year==1997)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
more.than.twenty.gallons <- vehicles[vehicles$cty > 20 & vehicles$drive=="2-Wheel Drive",]
View(more.than.twenty.gallons)
# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.id <- more.than.twenty.gallons$id[more.than.twenty.gallons$hwy==min(more.than.twenty.gallons$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
most.hwy <- function(this.year, this.make){
  made.this.year <- vehicles[vehicles$year==this.year & vehicles$make==this.make,]
  most <- made.this.year$hwy[made.this.year$hwy==max(made.this.year$hwy)]
  View(made.this.year)
  return (most)
}

# What was the most efficient honda model of 1995?
most.hwy(1995, "Honda")

