library(dplyr)

# Load the data into RStudio
orig_titanic <- read.csv("titanic_original.csv")

#Port of embarkation - find the missing values and replace them with S
orig_titanic$embarked[is.na(orig_titanic$embarked)] <- "S"

#Age - use the mean of the Age column to populate the missing values
orig_titanic$age[is.na(orig_titanic$age)] <- mean(orig_titanic$age, na.rm = TRUE)

#Lifeboat - Fill in empty values with "None"
orig_titanic$boat[orig_titanic$boat == ""] <- "None"

#Cabin Number - Create Column has_cabin_number
final_titanic <- orig_titanic %>%
  mutate(has_cabin_number = if_else(cabin == "", 0, 1))

write.csv(final_titanic, file = "titanic_clean.csv")
