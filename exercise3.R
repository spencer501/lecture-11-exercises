### Exercise 3 ###
library(jsonlite)

# Read in this police shooting JSON data 
# https://raw.githubusercontent.com/mkfreeman/police-shooting/master/data/response.json
data <- fromJSON('https://raw.githubusercontent.com/mkfreeman/police-shooting/master/data/response.json')


# Dealing with the `Shots Fired` column
# Creating a new Numeric variable with no space in the name
# Replacing NA values with the mean (that makes sense, right?)
data$shots_fired <- as.numeric(data[,'Shots Fired'])
data <- data %>%
        mutate(shots_fired = ifelse(is.na(shots_fired), mean(shots_fired, na.rm = T), shots_fired))

# Create a bubble map of the data

### Bonus: create informative hover text ###

### Bonus: Use multiple colors ###
