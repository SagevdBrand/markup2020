library(tidyverse)

# Loading the data
df <- read_csv("data/movies_metadata.csv")

# We only need the following columns
data <- df %>% select(id, original_title, genres)

# The genre column is a bit messy, we only really need the names of the genres:
data$genres <-str_extract_all(data$genres, "(?<=\\:[[:blank:]]\\')[[:alpha:]]+(?=\\'\\})")

# How many unique genres are there actually?
test <- c(unlist(data$genres))

# Let's save those to make radio buttons out of
genres <- unique(test)

# Lists are not going to be nice to work with later on, so I'd rather just have a string of the characters:
data$genres <- sapply(data$genres, paste0, collapse=" ")

# Save the data
write_csv(data, "data/appdata.csv")

## Testing  
# if 1 input category:
test <- which(str_detect(data$genres, "Comedy"))


#if 2 inputs:
test <- intersect(which(str_detect(data$genres, "Comedy")), which(str_detect(data$genres, "Romance")))




 