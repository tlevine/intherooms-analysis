p.all <- map.base + geom_point(data = meeting, aes(x = Longitude, y = Latitude, opacity = 0.1, color = Fellowship)) +
  xlab('Longitude') + ylab('Latitude')

p.cropped <- ggplot(meeting) +
  aes(x = Longitude, y = Latitude, opacity = 0.1, color = Fellowship) +
  xlim(-74.05, -73.8) + ylim(40.6, 40.8) +
  geom_point()

png('graphs/map.png', width=1260, height = 800)
#png('graphs/map.png', width=840, height = 500)
print(p.all)
dev.off()

png('graphs/map-cropped.png', width=1260, height = 800)
print(p.cropped + theme_gray(18))
dev.off()


