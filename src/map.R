nyc <- map_data('state', region = c('new york', 'new jersey', 'connecticut', 'pennsylvania'))

p.base <- ggplot() +
  geom_polygon(data = nyc, aes(x = long, y = lat, group = group), colour = "white", fill = "grey10") +
  coord_map('ortho', orientation=c(41, -74, 0))
  
p.all <- p.base + geom_point(data = meeting, aes(x = Longitude, y = Latitude, opacity = 0.1, color = Fellowship))

p.cropped <- ggplot(meeting) +
  aes(x = Longitude, y = Latitude, opacity = 0.1, color = Fellowship) +
  xlim(-74.5, -73.5) + ylim(40.5, 41) + geom_point()
