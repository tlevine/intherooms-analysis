hours.of.week <- seq(0, 7 * 24 - 0.5, 0.5)
p.hour.of.week <- alply(hours.of.week, 1, function(hour) {
    m <- current.meetings(meeting, hour)
    if (nrow(m) > 0) {
        map.base +
        geom_point(data = m, aes(x = Longitude, y = Latitude, opacity = 0.2, color = Fellowship)) +
        scale_colour_discrete(drop = FALSE)
    }
})

pdf('graphs/over.week.pdf', width = 11, height = 8.5)
print(p.hours.of.week)
dev.off()
