hours.of.week <- seq(0, 7 * 24 - 0.5, 0.5)
PRETTY.TIME <- data.frame(ugly = hours.of.week)
PRETTY.TIME$day <- rep(levels(meeting$Day), each = 48)
PRETTY.TIME$time <- rep(paste(rep(0:23, each = 2), rep(c('00', '30'), 24), sep = ':'), 7)
row.names(PRETTY.TIME) <- PRETTY.TIME$ugly
PRETTY.TIME$ugly <- NULL

plot.hour.of.week <- function(hour) {
    pretty.time <- paste(PRETTY.TIME[as.character(hour),], collapse = ' at ')
    m <- current.meetings(na.omit(meeting), hour)
    .base <- ggplot(m) + xlim(-74.05, -73.8) + ylim(40.6, 40.8) +
        coord_map('ortho', orientation=c(41, -74, 0)) +
        theme(legend.position = "none") +
        # scale_colour_discrete(drop = FALSE) +
        aes(alpha = 0.5, size = 0) +
        labs(title = pretty.time) +
        geom_point()
    if (nrow(m) > 0) {
        .base + aes(x = Longitude, y = Latitude, opacity = 0.2, color = Fellowship)
    } else {
        paste('No meetings for', pretty.time)
        .base + aes(x = 0, y = 0) +
        xlab('Longitude') + ylab('Latitude')
    }
}

for (i in 1:length(hours.of.week)) {
# for (i in c(1:2,130:132)) {
    png(paste('graphs/over.week-', sprintf('%03d', i), '.png', sep = ''), width = 840, height = 600)
    print(plot.hour.of.week(hours.of.week[i]))
    dev.off()
}

pdf('graphs/over.week.pdf', width = 11, height = 8.5)
for (i in 1:length(hours.of.week)) {
# for (i in c(1:2,130:132)) {
    print(plot.hour.of.week(hours.of.week[i]))
}
dev.off()
