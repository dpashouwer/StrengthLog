# load packages
if (!require("pacman")) install.packages("pacman"); library(pacman)
p_load(tidyverse, tntpr, googlesheets, janitor, lubridate)

strengthlog <- fetch_training_log()






training_analysis <- function(dat, exercise, num_weeks = 8){

  dat <- dat %>%
    filter(!is.na(reps)) %>%
    select(date, exercise, type, reps, weight, e1rm) %>%
    mutate(week = floor_date(date, unit = "weeks")) %>%
    filter(week > floor_date(Sys.Date(), unit = "week") - num_weeks * 7, exercise == !! exercise) %>%
    group_by(week, exercise) %>%
    summarise(total_reps = sum(reps %>% as.numeric()),
              max_e1rm = max(e1rm),
              avg_intensity = mean(weight / max_e1rm) %>% round(digits = 2)) %>%
    ungroup()

  max_date <- max(dat$week) + 5
  min_date <- min(dat$week) - 5

  graph_total_reps <- dat %>%
    ggplot(aes(x = week, y = total_reps)) +
    geom_line() +
    geom_text(aes(label = total_reps)) +
    scale_y_continuous(limits = c(0, 100)) +
    scale_x_date(date_breaks = "1 week", date_labels = "%b %d", limits = c(min_date, max_date)) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

  graph_e1rm <- dat %>%
    ggplot(aes(x = week, y = max_e1rm)) +
    geom_line() +
    geom_text(aes(label = max_e1rm)) +
    scale_y_continuous(limits = c(0, 450)) +
    scale_x_date(date_breaks = "1 week", date_labels = "%b %d", limits = c(min_date, max_date)) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

  graph_avg_intensity <- dat %>%
    ggplot(aes(x = week, y = avg_intensity)) +
    geom_line() +
    geom_text(aes(label = paste0(avg_intensity *100, "%"))) +
    scale_y_continuous(limits = c(0, 1)) +
    scale_x_date(date_breaks = "1 week", date_labels = "%b %d", limits = c(min_date, max_date)) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

  gridExtra::grid.arrange(graph_total_reps, graph_e1rm, graph_avg_intensity, ncol = 3, top = exercise)
}

strengthlog %>%
  training_analysis(exercise = "Bench, 1ct paused")

# "Bench, 1ct paused"
# "Deadlift, w/ belt"
# "Squat, w/ belt"
# "Press, Kneeling"

