usa <- map_data('state')

map.base <- ggplot() +
  geom_polygon(data = usa, aes(x = long, y = lat, group = group), colour = "white", fill = "grey10") +
  coord_map('ortho', orientation=c(38, -98, 0))

#p <- map.base + geom_point(data = location, aes(x = Longitude, y = Latitude, opacity = 0.1, color = Fellowship)) +
p <- map.base + geom_point(data = location, aes(x = Longitude, y = Latitude, opacity = 0.1)) +
  xlab('Longitude') + ylab('Latitude')

#png('graphs/map.png', width=1260, height = 800)
#print(p.all)
#dev.off()
