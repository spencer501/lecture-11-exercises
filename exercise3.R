### Exercise 3 ###
library(jsonlite)
library(plotly)

# Read in this police shooting JSON data 
# https://raw.githubusercontent.com/mkfreeman/police-shooting/master/data/response.json
data <- fromJSON('https://raw.githubusercontent.com/mkfreeman/police-shooting/master/data/response.json')


# Dealing with the `Shots Fired` column
# Creating a new Numeric variable with no space in the name
# Replacing NA values with the mean (that makes sense, right?)
data$shots_fired <- as.numeric(data[,'Shots Fired'])
data <- data %>%
        mutate(shots_fired = ifelse(is.na(shots_fired), mean(shots_fired, na.rm = T), shots_fired)) %>% 
        mutate(hover = paste(`Victim Name`, `Victim's Age`))



# Create a bubble map of the data
geography <- list(
   scope = 'usa', # what does this do?
   projection = list(type = 'albers usa'), # what does this do?
   showland = FALSE, # what does this do?
   landcolor = toRGB("gray85"), # what does this do?
   subunitwidth = 1, # what does this do?
   countrywidth = 1, # what does this do?
   subunitcolor = toRGB("black"), # what does this do?
   countrycolor = toRGB("white") # what does this do?
)

plot <- plot_ly(data, 
        lon = lng, 
        lat = lat, 
        text = hover, # how does this work?
        marker = list(size = shots_fired/3 + 1, color = toRGB('red', opacity = .4)), # what else can you adjust?
        type = 'scattergeo', 
        locationmode = 'USA-states'
)

layout(plot, title = 'Community reported police shootings', geo = geography)

### Bonus: create informative hover text ###

### Bonus: Use multiple colors ###
