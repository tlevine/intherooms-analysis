#p <- map.base + geom_point(data = location, aes(x = Longitude, y = Latitude, opacity = 0.1, color = Fellowship)) +
p <- map.base + geom_point(data = location, aes(x = Longitude, y = Latitude, opacity = 0.1)) +
  xlab('Longitude') + ylab('Latitude')

#png('graphs/map.png', width=1260, height = 800)
#print(p.all)
#dev.off()
