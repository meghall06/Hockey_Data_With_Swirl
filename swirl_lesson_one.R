# This script file contains the questions and answers from Lesson One of Hockey Data With Swirl. The swirl lesson 
# automatically loads the data and the necessary package, but we'll have to do that here.

install.packages("tidyverse")
library(tidyverse)
hockey_data <- 
  read_csv("https://github.com/hockey-graphs/HG_intro_tutorial/blob/master/PHI_tutorial_data.csv?raw=true")

# Here's how to actually run the course in swirl:

# Welcome to Lesson One of Hockey Data With Swirl! My name is Meghan Hall, and I taught myself R by working with 
# example data that interested me -- hockey data! This lesson will give you an intro to some of the most common functions 
# of the tidyverse. Press enter to continue.
# 
# If you ever get stuck, you can enter skip() and the console will show you the correct answer before 
# moving on to the next question. You can also always enter info() to see the swirl options (like how to pause or 
# end the lesson). Hit enter again.

# You should have a data file already loaded into your environment pane in the upper-right corner of your screen. In R, 
# these are often called data frames. If you see it, type in the name of the data frame and hit enter.

hockey_data

# That output that just showed up in your console probably isn't very helpful if we want to explore what this
# data looks like. To get an Excel-esque view, try typing View(hockey_data).

View(hockey_data)

# That's a bit easier to consume. (You can do the same thing by just clicking on the name of the data frame in the
# environment pane,  as well.) Next, let's learn about functions to examine this data set a little more. Hit enter again.

# The bulk of the work in R is done with functions. You call a function with its name,
# like we just did with View, and it's followed by its arguments in parentheses. The nrow() function is a simple one that
# will tell you how many rows are in this data set. Type it below, with the name of the data frame as the only argument.   

nrow(hockey_data)

# That nrow() function tells us that we have 2501 observations (or rows). What about the number of variables 
# (or columns)? Try the ncol() function, again with the name of the data frame as the only argument.

ncol(hockey_data)

# Here's a quick tip about RStudio. It will autocomplete the names of your data frames or other items stored in 
# your environment to make your code writing process a little faster. Type the exact same function as before, but after 
# you type the name of the function and start typing the name of the data frame, hit the tab key to explore the 
# autocomplete feature.

ncol(hockey_data)

# We now know that we have 2501 rows and 46 columns (which should match the 2501 observations and 46 variables
# that you see in the environment pane). To take a quick look at the variable names in this data set, use the names() 
# function, again with the name of the data frame as the only argument.

names(hockey_data)

# This data set is a small sample of games from the 2019-20 NHL season. There is one row per tracked 
# event that provides details of that event: what time it occurred, which players were on the ice, etc. Those variables 
# are all shown above in your console, from the names() function you used in the last question. Which variable would 
# you guess is the unique identifier for each game played?

# game_id

# The first question we have of these data is this: how many games are included? Since we know that game_id is
# our unique identifier for each game, we can use the count() function to see how many values that particular variable
# has. The two arguments of the count() function are the name of the data frame (hockey_data) and the name of the 
# variable (game_id), separated by a comma. Try it below.

count(hockey_data, game_id)

# From looking at the output above, how many different games are represented in this data set? (Please use a 
# numeral.)

# 4

# We now know that this data set consists of four different games. What if we also wanted to know what date
# these games happened and who played in them? We can simply add those variables (game_date, home_team, away_team) to 
# our count() function from before. Try it!

count(hockey_data, game_id, game_date, home_team, away_team)

# The functions we used at the beginning (View, ncol, nrow, names) are part of what's called base R. However, 
# most people use packages to do their work, and the count() function we just looked at is part of a package called 
# tidyverse. The tidyverse (which is actually a  collection of packages) is one of the most popular packages and will 
# cover the vast majority of what beginner and intermediate users need in terms of data manipulation, exploration, and 
# visualization. The tidyverse was installed already when you loaded this course, but for future reference, you can install packages with the 
# install.packages() function, with the name of the package in quotes. You only need to do this once per package per 
# computer. But at the beginning of each R session you open, you need to load the desired packages. This is done with the 
# library() function, with the name of the function as the only argument. How would you load the tidyverse package?

library(tidyverse)

# So we know from our previous output that this data set has four Philadelphia Flyers games from late November, against Carolina,
# Calgary, Vancouver, and Columbus. Good to know! Next, I want to know how many goals were scored in these four games
# and who scored them. But we saw earlier that this data set has 46 variables in it. If I'm only interested 
# in who scored the goals, I probably don't need all those variables right now, they'll just clutter up my view. The select() function allows us to control
# which variables (i.e., columns) we want to keep or drop in our data set. This function (we're sticking with tidyverse 
# functions for now) follows a similar notation for its arguments: first comes the name of the data frame, 
# followed by the selected variables separated by commas. Let's try a select function that only keeps the following variables: 
# game_id, event_team, event_type, event_player_1, game_strength_state.

select(hockey_data, game_id, event_team, event_type, event_player_1, game_strength_state)

# So we've successfully filtered down our columns using the select() function, but if I'm only interested 
# in goals, it's obvious from looking at the output that we need to filter down our rows to just the goal events. The 
# filter() function will do this. The first argument is the name of the data frame, followed by a comma and then the 
# filtering conditions. In this case, our filtering condition is event_type == "GOAL" That double equal sign is very 
# important, as it indicates that we're testing for equality. Try it out below.

filter(hockey_data, event_type == "GOAL")

# The good news is that we've successfully filtered down this data set to just the 21 rows that are goal 
# events, but the bad news is that all those variables we dropped with the select() function are back! We can fix 
# this by threading multiple statements together with the pipe, which is an essential operator in the tidyverse world. 
# The pipe, which is represented by %>%, tells R that we're running multiple lines of code as one. Type in the pipe 
# symbol below.

# %>%
  
# Now that we know the pipe, we can tell R to select() certain variables and then filter() down to certain 
# observations. When you do it this way (which is the recommended way to write code, as it's much more efficient), you 
# reference the name of the data frame at the beginning instead of using it as an argument in each individual function. 
# This is how it would look with these two functions: hockey_data %>% select(VARIABLES) %>% filter(VARIABLES). Try it 
# below with the exact same variables as we used in previous questions. You'll notice that when we do it this way, the 
# names of the variables are available via auto-complete, as well.

hockey_data %>% select(game_id, event_team, event_type, event_player_1, game_strength_state) %>% filter(event_type == "GOAL")
 
# Making your code tidy and readable is an important skill to learn. When using the tidyverse, convention is 
# that the pipe indicates the end of a line. Type the exact same thing you did before, but press enter after each pipe 
# to create a new line.

hockey_data %>% 
  select(game_id, event_team, event_type, event_player_1, game_strength_state) %>% 
  filter(event_type == "GOAL")

# Now in your console you can see a nicely filtered list that just shows selected details about the goal events 
# in this dataset. But right now, this just exists in the console. If we want to save these results, we need to assign 
# our code to something with the assignment operator, another important operator to know in R. The assignment operator 
# looks like this <- and tells R that we want to create something (like a data frame or a variable) and then save it 
# somewhere so we can access it again later (the keyboard shortcut for the assignment operator is Alt/Option + -). 
# We'll test that later with new variables, but for now, let's run the exact 
# same code as in the question before but also assign that result to a new data frame called goals. To do so, just copy 
# and paste the code from before and add "goals <- " in front of it, so the first line looks like goals <- hockey_data %>%

goals <- hockey_data %>% 
  select(game_id, event_team, event_type, event_player_1, game_strength_state) %>% 
  filter(event_type == "GOAL")
  
# Awesome! That should've created a new data frame called goals, which you can see in your environment pane 
# in the upper-right. You can also use this assignment operator to save changes to an existing data set instead of creating an 
# entirely new one. The syntax for that would be, as the first line, goals <- goals %>%. (Though it's good practice to 
# create new data frames during testing so that when you make mistakes, you won't have overwritten your old data.) 
# Let's test it by using the rename() function to rename the event_player_1 variable. That's not as descriptive as it 
# could be, so we can rename it to goal_scorer by using the function rename(goal_scorer = event_player_1). The new name 
# of the variable always comes first, followed by the old name. Try that code below, preceded by goals <- goals %>%

goals <- goals %>% 
  rename(goal_scorer = event_player_1)

# When you're doing one of these lessons in swirl, typing play() will allow you to "pause" the lesson to 
# do things on your own. When you're ready to come back, just type nxt() to restart where you left off. Right now, 
# type play() below and then click on your new goals data frame to take a look and see how the rename function 
# worked.

# play()

# Let's stick with this smaller goals data set and explore a couple more operators within the filter() 
# function. We used it before to filter down by event_type, but what if we wanted to filter this new data set by both 
# event_team and game_strength_state? We can do that with the & operator. Try filtering the goals data set with the 
# following function filter(event_team == "PHI" & game_strength_state == "5v5"). You don't have to assign the results to 
# anything, just begin with goals %>%
  
goals %>% 
  filter(event_team == "PHI" & game_strength_state == "5v5")

# We can now see that Philadelphia scored seven goals at 5v5 (and that the event_player_1 column was 
# successfully renamed to goal_scorer). What if we wanted to see how many total goals were scored for ALL teams at 
# 5v4 or 4v5? Use the exact same syntax as we used previously, but remove the event_team condition and use the "or" 
# operator | instead of the "and" operator &. Again, you don't have to assign the results to anything, just begin with 
# goals %>%

goals %>%
  filter(game_strength_state == "5v4" | game_strength_state == "4v5")

# For our last filtering operator, let's say we want to see all goals that were NOT at 5v5. To do this, you 
# can use the not equal operator != instead of the equal operator == Again, you don't have to assign the results to 
# anything, just begin with goals %>%

goals %>% 
  filter(game_strength_state != "5v5")

# Let's move onto another popular function in the tidyverse, mutate(). This allows us to create new variables 
# based on our existing observations. We'll go back to our full data set, hockey_data, and create a new data set called 
# shots that has a new variable called SOG. You know how to do the first part (shots <- hockey_data) and then, after a 
# pipe, add the following function mutate(SOG = ifelse(event_type %in% c("SHOT", "GOAL"), 1, 0)). Here we're using the 
# ifelse() notation, which has three arguments -- the condition, the result if the condition is met, and the result if the condition 
# is not met. This is telling R to create a new variable called SOG that has the value of 1 if the event_type is SHOT or 
# GOAL and the value of 0 if it does not. We're using the %in% operator to indicate that the condition has two possible 
# values, but you could also use the "or" operator of |.

shots <- hockey_data %>% 
  mutate(SOG = ifelse(event_type %in% c("SHOT", "GOAL"), 1, 0))

# We now have a copy of our data set, called shots, that has a variable for shots on goal (SOG). How can we 
# figure out how many shots were generated by each team? The tidyverse has a powerful pair of functions, group_by() and 
# summarize() that allow us to apply functions separately to different groups. group_by(event_team) %>% 
# summarize(shots = sum(SOG)) will take the sum of our new variable and apply that for each event_team. Try that below. 
# You don't have to assign the data frame to anything, just start with shots %>%

shots %>% 
  group_by(event_team) %>% 
  summarize(shots = sum(SOG))

# You can see that there's an NA value in that list because there are certain events in the data set that 
# aren't associated with an event_team. We can take care of that by combining the filter() function with a useful 
# function called is.na(). Use the same code as before, but before the group_by() function, add the following function 
# filter(!(is.na(event_team))). We saw before with the != operator that the exclamation point indicates "not" 
# and by wrapping the entire is.na() function with an exclamation point, we're telling R to keep only the observations 
# that AREN'T NA (in other words, drop all the NA values).

shots %>% 
  filter(!(is.na(event_team))) %>% 
  group_by(event_team) %>% 
  summarize(shots = sum(SOG))

# I hope this was a useful introduction to the tidyverse in R! The only downside to working in swirl is that 
# it is console-based, whereas it's recommended to write all your code in script files so that it's easier to keep track,
# save your work, and make changes. I have a script file on my GitHub that has all the questions and resulting code, and 
# I encourage you to download it so that you  have everything in one place. The link is available on my website. 
# More hockey lessons coming soon!
