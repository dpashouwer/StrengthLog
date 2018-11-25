# load packages
if (!require("pacman")) install.packages("pacman"); library(pacman)
if (!require("devtools")) install.packages("devtools"); library(devtools)
if (!require("strengthlogr")) devtools::install_github("dpashouwer/strengthlogr") ; library(strengthlogr)
p_load(tidyverse, googlesheets, janitor, lubridate, purrr)

### Pre-season Power-bias

# Wave 1
microcycle_1 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 10, 5, target_pct = .6) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 10, 5, target_pct = .6) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 10, 5, target_pct = .6) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 10, 5, target_pct = .6) %>% 
  add_exercise("Bench, Close Grip", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 1)

microcycle_2 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 5, 2, target_pct = .85) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 10, 3, target_pct = .675) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 10, 3, target_pct = .675) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 5, 2, target_pct = .85) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 10, 3, target_pct = .675) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 10, 3, target_pct = .675) %>% 
  add_exercise("Bench, Close Grip", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 2)

microcycle_3 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 4, 1, target_pct = 1) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 1, "AMRAP", target_pct = .75) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 1, "AMRAP", target_pct = .75) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 4, 1, target_pct = 1) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 1, "AMRAP", target_pct = .75) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 1, "AMRAP", target_pct = .75) %>% 
  add_exercise("Bench, Close Grip", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 3)

microcycle_4 <- build_microcycle() %>% 
  add_exercise("Cleans, Hang Cleans", 3, 3) %>% 
  add_exercise("Squat, High Bar", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Cleans, Power Cleans", 3, 3) %>% 
  add_exercise("Deadlift, w/ belt", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  add_exercise("Bench, Close Grip", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 4)

# Wave 2
microcycle_5 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 8, 5, target_pct = .65) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 8, 5, target_pct = .65) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 8, 5, target_pct = .65) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 8, 5, target_pct = .65) %>% 
  add_exercise("Bench, Incline", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 5)

microcycle_6 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 5, 2, target_pct = .85) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 8, 3, target_pct = .725) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 8, 3, target_pct = .725) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 5, 2, target_pct = .85) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 8, 3, target_pct = .725) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 8, 3, target_pct = .725) %>% 
  add_exercise("Bench, Incline", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 6)

microcycle_7 <- build_microcycle() %>% 
  add_exercise(exercise = "Jumping, Box Jump", 4, 1, target_pct = 1) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 1, "AMRAP", target_pct = .8) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 1, "AMRAP", target_pct = .8) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise(exercise = "Jumping, Box Jump, Weighted", 4, 1, target_pct = 1) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 1, "AMRAP", target_pct = .8) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 1, "AMRAP", target_pct = .8) %>% 
  add_exercise("Bench, Incline", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 7)

microcycle_8 <- build_microcycle() %>% 
  add_exercise("Cleans, Hang Cleans", 3, 3) %>% 
  add_exercise("Squat, High Bar", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise(exercise = "Jumping, Box Jump, Weighted", 4, 1, target_pct = 1) %>% 
  add_exercise("Cleans, Power Cleans", 3, 3) %>% 
  add_exercise("Deadlift, w/ belt", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  add_exercise("Bench, Incline", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 8)

# Wave 3
microcycle_9 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 5, 5, target_pct = .7) %>% 
  add_exercise("Squat, High Bar", 1, "AMRAP", target_pct = .7) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 5, 5, target_pct = .7) %>% 
  add_exercise("Bench, 1ct paused", 1, "AMRAP", target_pct = .7) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 5, 5, target_pct = .7) %>% 
  add_exercise("Deadlift, w/ belt", 1, "AMRAP", target_pct = .7) %>% 
  new_workout() %>% 
  add_exercise("Throws", 10, 1) %>% 
  add_exercise("Press, Kneeling", 5, 5, target_pct = .7) %>% 
  add_exercise("Press, Kneeling", 1, "AMRAP", target_pct = .7) %>% 
  add_exercise("Bench, Close Grip", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 9)

microcycle_10 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 4, 4, target_pct = .775) %>% 
  add_exercise("Squat, High Bar", 1, "AMRAP", target_pct = .775) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 4, 4, target_pct = .775) %>% 
  add_exercise("Bench, 1ct paused", 1, "AMRAP", target_pct = .775) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 4, 4, target_pct = .775) %>% 
  add_exercise("Deadlift, w/ belt", 1, "AMRAP", target_pct = .7) %>% 
  new_workout() %>% 
  add_exercise("Throws", 8, 1) %>% 
  add_exercise("Press, Kneeling", 4, 4, target_pct = .775) %>% 
  add_exercise("Press, Kneeling", 1, "AMRAP", target_pct = .7) %>% 
  add_exercise("Bench, Close Grip", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 10)

microcycle_11 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 1, "AMRAP", target_pct = .85) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 1, "AMRAP", target_pct = .85) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 1, "AMRAP", target_pct = .85) %>% 
  new_workout() %>% 
  add_exercise("Throws", 8, 1) %>% 
  add_exercise("Press, Kneeling", 1, "AMRAP", target_pct = .85) %>% 
  add_exercise("Bench, Close Grip", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 11)

microcycle_12 <- build_microcycle() %>% 
  add_exercise("Cleans, Hang Cleans", 3, 3) %>% 
  add_exercise("Squat, High Bar", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise(exercise = "Jumping, Box Jump, Weighted", 4, 1, target_pct = 1) %>% 
  add_exercise("Cleans, Power Cleans", 3, 3) %>% 
  add_exercise("Deadlift, w/ belt", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  add_exercise("Bench, Close Grip", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 12)

# Wave 4
microcycle_13 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 6, 3, target_pct = .75) %>% 
  add_exercise("Squat, High Bar", 1, "AMRAP", target_pct = .75) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 6, 3, target_pct = .75) %>% 
  add_exercise("Bench, 1ct paused", 1, "AMRAP", target_pct = .75) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 6, 3, target_pct = .75) %>% 
  add_exercise("Deadlift, w/ belt", 1, "AMRAP", target_pct = .75) %>% 
  new_workout() %>% 
  add_exercise("Throws", 10, 1) %>% 
  add_exercise("Press, Kneeling", 6, 3, target_pct = .75) %>% 
  add_exercise("Press, Kneeling", 1, "AMRAP", target_pct = .75) %>% 
  add_exercise("Bench, Incline", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 13)

microcycle_14 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 4, 3, target_pct = .825) %>% 
  add_exercise("Squat, High Bar", 1, "AMRAP", target_pct = .825) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 4, 3, target_pct = .825) %>% 
  add_exercise("Bench, 1ct paused", 1, "AMRAP", target_pct = .825) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 4, 3, target_pct = .825) %>% 
  add_exercise("Deadlift, w/ belt", 1, "AMRAP", target_pct = .825) %>% 
  new_workout() %>% 
  add_exercise("Throws", 10, 1) %>% 
  add_exercise("Press, Kneeling", 4, 3, target_pct = .825) %>% 
  add_exercise("Press, Kneeling", 1, "AMRAP", target_pct = .825) %>% 
  add_exercise("Bench, Incline", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 14)

microcycle_15 <- build_microcycle() %>% 
  add_exercise("Jumping, Box Jump", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Hang Cleans", 5, 3) %>% 
  add_exercise("Squat, High Bar", 1, "AMRAP", target_pct = .9) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 1, "AMRAP", target_pct = .9) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise("Jumping, Box Jump, Weighted", 6, 3, target_pct = .75) %>% 
  add_exercise("Cleans, Power Cleans", 5, 3) %>% 
  add_exercise("Deadlift, w/ belt", 1, "AMRAP", target_pct = .9) %>% 
  new_workout() %>% 
  add_exercise("Throws", 10, 1) %>% 
  add_exercise("Press, Kneeling", 4, 3, target_pct = .825) %>% 
  add_exercise("Press, Kneeling", 1, "AMRAP", target_pct = .9) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 15)

microcycle_16 <- build_microcycle() %>% 
  add_exercise("Cleans, Hang Cleans", 3, 3) %>% 
  add_exercise("Squat, High Bar", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  new_workout() %>% 
  add_exercise("Bench, 1ct paused", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  add_exercise("Rows, Pendlay", 4, 5, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Dip", 3, 8)  %>% 
  new_workout() %>% 
  add_exercise(exercise = "Jumping, Box Jump, Weighted", 4, 1, target_pct = 1) %>% 
  add_exercise("Cleans, Power Cleans", 3, 3) %>% 
  add_exercise("Deadlift, w/ belt", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  new_workout() %>% 
  add_exercise("Press, Kneeling", 3, 5, target_pct = c(.4, .5, .6)) %>% 
  add_exercise("Bench, Close Grip", 4, 8, target_rpe = c(6, 7, 8, 8)) %>% 
  add_exercise("GPP Pull-up", 3, 8) %>% 
  mutate(week = 16)

# bind microcycles

program <- list(microcycle_1, 
     microcycle_2, 
     microcycle_3, 
     microcycle_4, 
     microcycle_5, 
     microcycle_6, 
     microcycle_7, 
     microcycle_8, 
     microcycle_9, 
     microcycle_10, 
     microcycle_11, 
     microcycle_12, 
     microcycle_13, 
     microcycle_14, 
     microcycle_15, 
     microcycle_16) %>% 
  bind_rows()


program






