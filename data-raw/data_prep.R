library(devtools)
library(tidyverse)

use_data_raw()
UserTicks <- read.csv('../climbs.csv')

# remove bad dates
UserTicks$date[ticks$date == '0000-00-00' |
             ticks$date == '209-03-18' |
             ticks$date == '204-12-21' |
             ticks$date == '0-08-06' |
             ticks$date == '0-08-07'] <- NaN

# add a unix time column
UserTicks <- UserTicks %>%
  mutate(unix_date = as.numeric(as.POSIXct(date)))

use_data(UserTicks, overwrite = TRUE)
