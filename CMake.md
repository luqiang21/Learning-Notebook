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

- ```
  add_executable(<name> [WIN32] [MACOSX_BUNDLE]
               [EXCLUDE_FROM_ALL]
               [source1] [source2 ...])
  ```
  
  - Adds an executable target called `<name>` to be built from the source files listed in the command invocation. (The source files can be omitted here if they are added later using target_sources().) The `<name>` corresponds to the logical target name and must be globally unique within a project. The actual file name of the executable built is constructed based on conventions of the native platform (such as `<name>`.exe or just `<name>`).
- ```
  add_library(<name> [STATIC | SHARED | MODULE]
            [EXCLUDE_FROM_ALL]
            source1 [source2 ...])
  ```
  - Adds a library target called `<name>` to be built from the source files listed in the command invocation. The <name> corresponds to the logical target name and must be globally unique within a project. The actual file name of the library built is constructed based on conventions of the native platform (such as lib`<name>`.a or `<name>`.lib).
  - STATIC, SHARED, or MODULE may be given to specify the type of library to be created. STATIC libraries are archives of object files for use when linking other targets. SHARED libraries are linked dynamically and loaded at runtime. MODULE libraries are plugins that are not linked into other targets but may be loaded dynamically at runtime using dlopen-like functionality. If no type is given explicitly the type is STATIC or SHARED based on whether the current value of the variable BUILD_SHARED_LIBS is ON. For SHARED and MODULE libraries the POSITION_INDEPENDENT_CODE target property is set to ON automatically.
  
