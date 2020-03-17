library(devtools)
library(tidyverse)

use_data_raw()
UserTicks <- read.csv('../climbs.csv') %>%
  select(-X.1,-X)
use_data(UserTicks, overwrite = TRUE)
