p.time <- alply(seq(0, 23.5, 0.5), function(hour) {
    nrow(current.meetings(hour))
}
