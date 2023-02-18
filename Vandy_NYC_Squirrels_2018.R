# =============================================================================
# STEP 1: LOAD IN NECESSARY LIBRARIES AND DATASETS
# =============================================================================

# Install packages
install.packages("tidyverse")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("sf")
install.packages("tidyr")
install.packages("openxlsx")

# Load packages
library(tidyverse)
library(lubridate)
library(ggplot2)
library(sf)
library(tidyr)
library(openxlsx)

# Load in the data and view it
setwd("C:/Users/msgib/OneDrive/Documents/RStudio")
squirrel_data <- read.csv(
  file = "2018_Central_Park_Squirrel_Census_-_Squirrel_Data.csv")
View(squirrel_data)

# =============================================================================
# STEP 2: CLEANING THE SQUIRREL DATA 
# =============================================================================

# Check for and delete duplicates (if applicable)
cleaned_sd <- squirrel_data[!duplicated(squirrel_data$Unique.Squirrel.ID), ]

# Replace all blanks and ? in Age with "Not Recorded"
table(cleaned_sd$Age)
cleaned_sd <- replace(cleaned_sd, cleaned_sd == "", "Not Recorded")
cleaned_sd <- cleaned_sd %>% 
  mutate(Age = recode(Age, "?" = "Not Recorded"))

# Drop unnecessary columns from the table
cleaned_sd <- subset(cleaned_sd, select = -c(
  Combination.of.Primary.and.Highlight.Color, Color.notes, 
  Above.Ground.Sighter.Measurement, Specific.Location,
  Other.Activities, Other.Interactions, Lat.Long))

# Convert the Date column to a date
cleaned_sd$Date = mdy(cleaned_sd$Date)

# Replace all instances of False with 0 and True with 1
cleaned_sd <- replace(cleaned_sd, cleaned_sd == FALSE, 0)
cleaned_sd <- replace(cleaned_sd, cleaned_sd == TRUE, 1)
                          
# =============================================================================
# STEP 3: COMPARING SQUIRREL POPULATIONS BETWEEN VANDERBILT AND CENTRAL PARK
# =============================================================================

# Mapping out the squirrels in Central Park
sq_map <- st_as_sf(cleaned_sd, coords = c('X', 'Y'))
ggplot(sq_map) + 
  geom_sf(aes(color = Age)) + 
  labs(x = "Latitude", 
       y = "Longitude", 
       title = "Map of Squirrels in Central Park (2018)",
       subtitle = "Classified by age when observed",
       caption = "Note the large empty spot in the middle corresponds to 
       Jacqueline Kennedy Onassis Reservoir")

# Using Vandy's 3:1 ratio, calculate the expected number of squirrels on campus
vandy_students = 12824 # Obtained from Source 1
expected_squirrels = vandy_students * 3

# Find the size of Central Park and Vanderbilt (in acres)
cp_acres = 843 # Obtained from Source 2
vandy_acres = 340.7 # Obtained from Source 3

# Calculate the squirrels per acre for each location
cp_squirrels_per_acre = 3018 / cp_acres
vandy_squirrels_per_acre = expected_squirrels / vandy_acres

# Create a data frame of the squirrels per acre for each location
acre_df <- data.frame(location = c("Central Park", 
                                   "Vanderbilt"),
                      value = c(cp_squirrels_per_acre, 
                                vandy_squirrels_per_acre))

# Create a bar chart representing the squirrels per acre for each location 
ggplot(acre_df, aes(x = location, y = value)) + 
  geom_bar(stat = "identity", color = "black", fill = "gold") +
  labs(x = "Location", 
       y = "Squirrels per acre (Squirrels)",
       title = "Squirrels per Acre - Central Park vs Vanderbilt",
       caption = "Note Vanderbilt's values are estimated") +
  geom_text(aes(label = signif(value)), nudge_y = 3) +
  theme_light()

# Find the number of squirrels per tree for each location
trees_cp = 18000 # Obtained from Source 4
trees_vandy = 6181 # Obtained from Source 5

# Calculate the number of squirrels per tree at each location
squirrel_per_tree_v = expected_squirrels / trees_vandy
squirrel_per_tree_c = 3018 / trees_cp

# Create a data frame of the squirrels per tree for each location
trees_df <- data.frame(location = c("Central Park", 
                                    "Vanderbilt"),
                       value = c(squirrel_per_tree_c,
                                 squirrel_per_tree_v))

# Create a bar chart of the squirrels per tree for each location
ggplot(trees_df, aes(x = location, y = value)) + 
  geom_bar(stat = "identity", color = "black", fill = "gold") +
  labs(x = "Location", 
       y = "Squirrels per tree (Squirrels)",
       title = "Squirrels per Tree - Central Park vs Vanderbilt",
       caption = "Note Vanderbilt's values are estimated") +
  geom_text(aes(label = signif(value)), nudge_y = 0.25) +
  theme_light()

# Summarize the data about squirrels per acre and squirrels per tree
cat("There are", vandy_squirrels_per_acre, "squirrels per acre and", 
    squirrel_per_tree_v, "squirrels per tree at Vanderbilt Univerity.")
cat("There are", cp_squirrels_per_acre, "squrirrels per acre and",
    squirrel_per_tree_c, "squirrels per tree in Central Park.")

# =============================================================================
# STEP 4: OBSERVING WEATHER AND SNOWFALL DIFFERENCES
# =============================================================================

# Load in the files and view them
cp_temp <- read.csv(file = "Central_Park_Temperatures.csv")
View(cp_temp)
vandy_temp <- read_csv(file = "Nashville_Temperatures.csv")
View(vandy_temp)
snowfall <- read_csv(file = "City_Snowfall.csv")
View(snowfall)

# Obtain the last ten years of data for temperatures in each location
recent_cp_temp = cp_temp[cp_temp$Year >= 2011, ]
recent_vandy_temp = vandy_temp[vandy_temp$Year >= 2011, ]

# Calculate the average temperature per month over the last 10 years
avg_temp_cp <- rep(0, 12)
avg_temp_v <- rep(0, 12)
for (i in 1:12) {
  avg_temp_cp[i] = mean(recent_cp_temp[, i + 1])
}
for (i in 1:12) {
  avg_temp_v[i] = mean(pull(recent_vandy_temp[, i + 1]))
} 

# Compare the yearly average of each location and their difference and summarize
avg_yr_temp_v = mean(avg_temp_v)
avg_yr_temp_cp = mean(avg_temp_cp)
temp_diff = avg_yr_temp_v - avg_yr_temp_cp
cat("The average yearly temperature at Vanderbilt, which is", avg_yr_temp_v, 
    "degrees, is", temp_diff, "degrees more than the average yearly",
    "temperature in Central Park, which is", avg_yr_temp_cp, "degrees.")

# Plot a line chart comparing the average temperatures per month
months = c("01", "02", "03", "04", "05", "06", 
           "07", "08", "09", "10", "11", "12")
temp_df <- data.frame(months, avg_temp_cp, avg_temp_v)
temp_df2 <- gather(temp_df, type, value, avg_temp_cp, avg_temp_v)
ggplot(temp_df2, aes(x = months, y = value)) + 
  geom_line(aes(group = type, color = type)) +
  geom_point() +
  labs(x = "Month of the Year", y = "Average Temperature (degrees Fahrenheit)",
       title = "Average Temperature per Month Comparison",
       subtitle = "Average taken from the last ten years of data (2011 - 2020)",
       caption = "Information for this plot collected from www.weather.gov",
       color = "Location") +
  scale_color_manual(labels = c("Central Park", "Vanderbilt"), 
                     values = c("blue", "red")) +
  theme_light()

# Convert the last ten years of average snowfall into a data frame
snow_df <- data.frame(snowfall)
snow_df2 <- snow_df[1:12, ]
snow_df2$months = factor(months)

# Compare the average annual snowfall of each location and the difference
total_snow_v = snow_df$Total.Snowfall.in.Nashville..inches.[13]
total_snow_cp = snow_df$Total.Snowfall.in.Central.Park..inches.[13]
snow_diff = total_snow_cp - total_snow_v
cat("The average annual snowfall in Central Park, which is", total_snow_cp, 
    "inches, is", snow_diff, "inches more than the average annual",
    "snowfall at Vanderbilt, which is", total_snow_v, "inches.")

# Plot a line chart comparing the average snowfall per month
snow_months = c("07", "08", "09", "10", "11", "12",
                "01", "02", "03", "04", "05", "06")
ggplot(snow_df2, aes(x = months)) +
  geom_line(aes(y = Total.Snowfall.in.Central.Park..inches., 
                color = "Central Park"), 
            group = 1) + 
  geom_line(aes(y = Total.Snowfall.in.Nashville..inches., 
                color = "Vanderbilt"), 
            group = 1) +
  labs(x = "Month of the Year", y = "Average Snowfall (inches)",
       title = "Average Snowfall per Month Comparison",
       subtitle = "Average taken from the last ten years of data (2011 - 2020)",
       caption = "Information for this plot collected from www.weather.gov",
       color = "Location") +
  scale_x_discrete(labels = snow_months) +
  scale_color_manual(values = c("blue", "red")) +
  theme_light()

# =============================================================================
# STEP 5: OBSERVING THE FUTURE OF SQUIRRELS AT VANDERBILT
# =============================================================================

# Find the student population at Vanderbilt for each year 2018-2022
student_pop_2018 = vandy_students 
student_pop_2019 = 13131 # Obtained from Source 6
student_pop_2020 = 13537 # Obtained from Source 7
student_pop_2021 = 13796 # Obtained from Source 8
student_pop_2022 = 13710 # Obtained from Source 9
population_df <- data.frame(year = c(2018, 2019, 2020, 2021, 2022),
                            student_pop = c(student_pop_2018,
                                            student_pop_2019,
                                            student_pop_2020,
                                            student_pop_2021,
                                            student_pop_2022),
                            percent_change = rep(0, 5))

# Calculate the percent change in student population for each year
population_df <- population_df %>%
  mutate(percent_change = (student_pop/lag(student_pop) - 1) * 100)

# Find the expected number of squirrels per year and append it to the data frame
expected_squirrel_pop = rep(0, 5)
for (i in 1:5) {
  expected_squirrel_pop[i] = 3 * pull(population_df[2])[i]
}
population_df <- cbind(population_df, expected_squirrel_pop)

# Change the NA in the percent change column to a 0
population_df <- population_df %>% 
  mutate_if(is.numeric, ~replace_na(., 0))

# Create a bar chart illustrating the percent_change across the years
ggplot(population_df, aes(x = year, y = percent_change)) + 
  geom_bar(stat = "identity", color = "black", fill = "gold") +
  labs(x = "Year", 
       y = "Percent Change in Population",
       title = "Percent in Change in Population (2018-2022)",
       caption = "Population totals obtained from Vanderbilt's registrar") +
  geom_text(aes(label = signif(percent_change)), nudge_y = 0.25) +
  theme_light()

# Determine when the squirrel population will reach 50,000
average_growth_rate = mean(pull(population_df[3]))
num_years = log(50000 / expected_squirrel_pop[1]) / (average_growth_rate / 100)
year_of_50000 = 2018 + ceiling(num_years)
cat("The year will be", year_of_50000, "when Vanderbilt will have",
    "50,000 squirrels on campus! Better stack up on nuts!")

# =============================================================================
# STEP 6: EXPORT DATA FRAMES TO .xlsx FILES FOR VISUALIZATION IN TABLEAU
# =============================================================================

write.xlsx(cleaned_sd, file = 'Squirrel_Data_Cleaned.xlsx')
write.xlsx(acre_df, file = 'Squirrel_Data_Acres.xlsx')
write.xlsx(trees_df, file = 'Squirrel_Data_Trees.xlsx')
write.xlsx(temp_df2, file = 'Squirrel_Data_Temps.xlsx')
write.xlsx(population_df, file = 'Squirrel_Data_Population.xlsx')