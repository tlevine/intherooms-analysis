location.counts <- sqldf("SELECT Location, Location_Link, count(*) AS 'Count' FROM [meeting.search] GROUP BY [Location_Link]")

#p <- ggplot(location.counts.subset) + aes(x = Location, y = Count, labels = Location) + geom_text()
p.locations <- ggplot(location.counts) + aes(x = Count) + geom_histogram() +
  scale_x_continuous('Number of meetings for a location') +
  scale_y_continuous('Number of locations') +
  labs(title = 'How many meetings are in the same locations?')

location.counts.subset <- subset(location.counts, Count >= 10)
