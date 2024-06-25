
install.packages("data.table")
library(data.table)
install.packages("geosphere")
library(geosphere)


June2023 <- fread("202306-divvy-tripdata.csv", na.strings = "")
July2023 <- fread("202307-divvy-tripdata.csv", na.strings = "")
August2023 <- fread("202308-divvy-tripdata.csv", na.strings = "")
September2023 <- fread("202309-divvy-tripdata.csv", na.strings = "")
October2023 <- fread("202310-divvy-tripdata.csv", na.strings = "")
November2023 <- fread("202311-divvy-tripdata.csv", na.strings = "")
December2023 <- fread("202312-divvy-tripdata.csv", na.strings = "")
January2024<- fread("202401-divvy-tripdata.csv", na.strings = "")
February2024 <- fread("202402-divvy-tripdata.csv", na.strings = "")
March2024 <- fread("202403-divvy-tripdata.csv", na.strings = "")
April2024 <- fread("202404-divvy-tripdata.csv", na.strings = "")
May2024 <- fread("202405-divvy-tripdata.csv", na.strings = "")


combined_data <- rbindlist(list(
  June2023, July2023, August2023, September2023,
  October2023, November2023, December2023, January2024,
  February2024, March2024, April2024, May2024
))

combined_data[, ride_duration_minutes:= as.numeric(difftime(ended_at, started_at, units = "mins"))]
combined_data[, distance_in_meters := distHaversine(cbind(start_lng, start_lat), cbind(end_lng, end_lat))]
combined_data[, day_of_week := weekdays(started_at)]

print(colSums(is.na(combined_data)))

duplicate_count <- sum(duplicated(combined_data))
print(duplicate_count)

missing_count <- sum(is.na(combined_data$distance_in_meters))
print(missing_count)


Combined_removed_nulldistance <- combined_data[!is.na(combined_data$distance_in_meters)]
Combined_removed_nulldistance <- Combined_removed_nulldistance[!is.na(Combined_removed_nulldistance$start_station_name)]
Combined_removed_nulldistance <- Combined_removed_nulldistance[!is.na(Combined_removed_nulldistance$start_station_id)]
Combined_removed_nulldistance <- Combined_removed_nulldistance[!is.na(Combined_removed_nulldistance$end_station_name)]
Combined_removed_nulldistance <- Combined_removed_nulldistance[!is.na(Combined_removed_nulldistance$end_station_id)]

print(colSums(is.na(Combined_removed_nulldistance)))

print(unique(Combined_removed_nulldistance$member_casual))

print(sum(Combined_removed_nulldistance$ride_duration_minutes < 0))

Combined_removed_nulldistance$month <- format(Combined_removed_nulldistance$started_at, "%B")
Combined_removed_nulldistance$start_hour <- as.integer(format(Combined_removed_nulldistance$started_at, "%H"))


Combined_removed_nulldistance_and_negative_ride_lnegth <- Combined_removed_nulldistance[(Combined_removed_nulldistance$ride_duration_minutes > 0)]

aggregate(Combined_removed_nulldistance_and_negative_ride_lnegth$ride_duration_minutes ~ Combined_removed_nulldistance_and_negative_ride_lnegth$member_casual + Combined_removed_nulldistance_and_negative_ride_lnegth$day_of_week ,FUN = mean)

print(aggregate(Combined_removed_nulldistance_and_negative_ride_lnegth$ride_duration_minutes ~ Combined_removed_nulldistance_and_negative_ride_lnegth$member_casual  ,FUN = mean))
print(aggregate(Combined_removed_nulldistance_and_negative_ride_lnegth$distance_in_meters ~ Combined_removed_nulldistance_and_negative_ride_lnegth$member_casual  ,FUN = mean))


write.csv(Combined_removed_nulldistance_and_negative_ride_lnegth, "Tableau_data.csv", row.names = FALSE, na = "", fileEncoding = "UTF-8")


