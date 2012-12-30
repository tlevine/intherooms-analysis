library(ggplot2)
nyc <- map_data('state', region = c('new york', 'new jersey', 'connecticut', 'pennsylvania'))

map.base <- ggplot() +
  geom_polygon(data = nyc, aes(x = long, y = lat, group = group), colour = "white", fill = "grey10") +
  coord_map('ortho', orientation=c(41, -74, 0))
