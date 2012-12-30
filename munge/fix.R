fellowship <- function(fellowship.var) {
    f <- factor(fellowship.var, levels = c("Alanon Anonymous", "Alcoholics Anonymous", "Gamblers Anonymous", "Narcotics Anonymous", "Overeaters Anonymous", "Sex and Love Addicts Anonymous"))
    levels(f)[1] <- levels(f)[2]
    f
}

day <- function(day.var) {
    f <- factor(day.var, levels = c('SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', ''))
    levels(f)[8] <- NA
    f
}

time <- function(time.var) {
    # Time as hours since midnight
    laply(str_split(time.var, ':'), function(t) {
        if (length(t) == 2) {
            t.num <- as.numeric(t)
            t.num[1] + t.num[2] / 60
        } else {
            NA
        }
    })
}

meeting$Fellowship <- fellowship(meeting$Fellowship)
meeting$Day <- day(meeting$Day)
meeting$Time <- time(meeting$Time)
meeting$Meeting.Description.1 <- NULL
meeting$Url.1 <- NULL

meeting.search$Fellowship <- fellowship(meeting.search$Fellowship)
meeting.search$Day <- day(meeting.search$Day)
meeting.search$Time <- time(meeting.search$Time)
meeting.search$meeting.search.Description.1 <- NULL
meeting.search$Url.1 <- NULL
