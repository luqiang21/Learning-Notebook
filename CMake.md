### Notes
- For a variable `var` in bash or cmake, to use it, it is better to include `{}` like this: `{var}` than without `{}`

## CMake syntax
- `project(project_name C CXX)`
  - Set project name and the languages it is using.
- `configure_file(<input> <output>)`
  - Copy a file to another location and modify its contents.
- `message([<mode>] "message to display" ...)`
  - The optional <mode> keyword determines the type of message
  ```
  # CMake Error, continue processing, but skip generation
  message(SEND_ERROR "My message")

  # CMake Error, stop processing and generation
  message(FATAL_ERROR "My message")
  ```
