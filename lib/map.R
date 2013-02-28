nyc <- map_data('state', region = c('new york', 'new jersey', 'connecticut', 'pennsylvania'))
usa <- map_data('state')

map.base <- ggplot() +
  geom_polygon(data = usa, aes(x = long, y = lat, group = group), colour = "white", fill = "grey10") +
  coord_map('ortho', orientation=c(38, -98, 0))
