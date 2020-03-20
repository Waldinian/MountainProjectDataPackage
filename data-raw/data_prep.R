library(devtools)
library(tidyverse)

use_data_raw()
UserTicks <- read.csv('../climbs.csv')

# remove bad dates
UserTicks$date[UserTicks$date == '0000-00-00' |
                 UserTicks$date == '209-03-18' |
                 UserTicks$date == '204-12-21' |
                 UserTicks$date == '0-08-06' |
                 UserTicks$date == '0-08-07'] <- NaN

# add a unix time column
UserTicks <- UserTicks %>%
  mutate(unix_date = as.numeric(as.POSIXct(date)))

use_data(UserTicks, overwrite = TRUE)
