# Get an example plotly map up and running

install.packages('plotly')

library(plotly)

set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000), ]
plot <- plot_ly(d, x = carat, y = price, text = paste("Clarity: ", clarity),
        mode = "markers", color = carat, size = carat)


p <- ggplot(data = d, aes(x = carat, y = price)) +
   geom_point(aes(text = paste("Clarity:", clarity)), size = 4) +
   geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

(gg <- ggplotly(p))