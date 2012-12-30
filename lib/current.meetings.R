current.meetings(meeting, time) {
    # Meetings last about an hour
    subset(meeting, time < (Time + 1) & time > Time)
}

