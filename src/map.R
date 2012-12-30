p.all <- map.base + geom_point(data = meeting, aes(x = Longitude, y = Latitude, opacity = 0.1, color = Fellowship))

p.cropped <- ggplot(meeting) +
  aes(x = Longitude, y = Latitude, opacity = 0.1, color = Fellowship) +
  xlim(-74.5, -73.5) + ylim(40.5, 41) + geom_point()
