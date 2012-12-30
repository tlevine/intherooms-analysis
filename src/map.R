nyc <- map_data('state', region = c('new york', 'new jersey', 'connecticut', 'pennsylvania'))

p.base <- ggplot() +
  geom_polygon(data = nyc, aes(x = long, y = lat, group = group), colour = "white", fill = "grey10") +
  coord_map('ortho', orientation=c(41, -74, 0))
  
p.all <- p.base + geom_point(data = meeting, aes(x = Longitude, y = Latitude, opacity = 0.1, color = Fellowship))
