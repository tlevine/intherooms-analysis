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
            t.num <- as.numeric(w)
            t.num[1] + t.num[2] / 60
        } else {
            NA
        }
    })
}

meeting$Fellowship <- fellowship(meeting$Fellowship)
meeting.info$Fellowship <- fellowship(meeting.info$Fellowship)

meeting$Day <- day(meeting$Day)
meeting.info$Day <- day(meeting.info$Day)

meeting$Time <- time(meeting$Time)
meeting.info$Time <- time(meeting.info$Time)

meeting$Meeting.Description.1 <- NULL
