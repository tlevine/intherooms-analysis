hours.of.week <- seq(0, 7 * 24 - 0.5, 0.5)
PRETTY.TIME <- data.frame(ugly = hours.of.week)
PRETTY.TIME$day <- rep(levels(meeting$Day), each = 24)
PRETTY.TIME$time <- rep(paste(rep(0:23, each = 2), rep(c('00', '30'), 24), sep = ':'), 7)
row.names(PRETTY.TIME) <- PRETTY.TIME$ugly
PRETTY.TIME$ugly <- NULL

.base <- map.base + xlim(-74.2, -73.8) + ylim(40.4, 40.8)
plot.hour.of.week <- function(hour) {
    pretty.time <- paste(PRETTY.TIME[as.character(hour),], collapse = ' at ')
    m <- current.meetings(na.omit(meeting), hour)
    if (nrow(m) > 0) {
        .base +
        geom_point(data = m, aes(x = Longitude, y = Latitude, opacity = 0.2, color = Fellowship)) +
        scale_colour_discrete(drop = FALSE) +
        labs(title = pretty.time)
    } else {
        paste('No meetings for', pretty.time)
        .base
    }
}

pdf('graphs/over.week.pdf', width = 11, height = 8.5)
# for (i in 1:length(hours.of.week)) {
for (i in 154:157) {
    print(plot.hour.of.week(hours.of.week[i]))
}
dev.off()
