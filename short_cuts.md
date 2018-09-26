# Docker
* docker ps
    * show running containers, use `-a` to show all.
* docker images
    * show all images
* docker run --name new_container_name -p host_port:container_port existing_image_name
    * run a new container with existing image
* docker stop container_name
    * stop the container

# Bash
## cat
- display multiple files' contents: `cat file1_path file2_path `
- create a file called test and type desired test
   - `cat >test`
   - `some test contents`
   - CTRL + d
- display line numbers in file: `cat -n test`
- display `$` at the end of line and also in space if there is any gap between paragraphs: `cat -e test`
- overwrite `test1` by the content of `test`: `cat test > test1`
- append the content of `test` to the end of `test1`: `cat test >> test1`
- redirecting multiple files contain in a single file: `cat test test1 > test2`
- sorting contents of multiple files in a single file: `cat test test1 | sort > test2`

# Evernote:
* ctrl + command + k
    * 删除线

# vim:
* to indent a block of lines
    * V enter visual mode, press j select lines you want to indent, press >
* y to copy
* 0	moves the cursor to the beginning of the line.
* $	moves the cursor to the end of the line.
* gg move to the beginning of the file.
* G	move to the end of the file

# Valgrind
## Provides a number of debugging and profiling tools that help you make your program faster and more correct. The most popular of these tools is called Memcheck, which can detect many memory-related errors that are common in C and C++ programs and that can lead to crashes and unpredicted behaviours.
- check possible memory leak for C/C++ programs: `valgrind --leak-check=yes myprog arg1 arg2`

# git
* git clone depth=1 your_git_repo
    * only clone current version, no history
