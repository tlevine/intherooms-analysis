p.time <- alply(seq(0, 23.5, 0.5), 1, function(hour) {
    m <- current.meetings(meeting, hour)
    if (nrow(m) > 0) {
        ggplot(m) +
        aes(x = Longitude, y = Latitude, opacity = 0.2, color = Fellowship) +
        scale_colour_discrete(drop = FALSE) +
        geom_point()
    }
})

pdf('graphs/over.time.pdf', width = 11, height = 8.5)
print(p.time)
dev.off()
