# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

hockey_data <- read.csv(file.path(.get_course_path(), "Hockey_Data_With_Swirl", "Lesson_One", "PHI_tutorial_data.csv"))

#lesson_dir <- file.path(path.package("swirl"), "Courses",
#                        "Including_Data", "Lesson_1")