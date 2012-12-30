hour.of.week <- function(meeting) {
    day <- meeting$Day
    hour <- 24 * as.numeric(day)
    hour + meeting$Time
}
current.meetings <- function(meeting, hour_of_week) {
    # Meetings last about an hour
    .how <- hour.of.week(meeting)
    meeting[hour_of_week < .how + 1 & hour_of_week > .how,]
}

