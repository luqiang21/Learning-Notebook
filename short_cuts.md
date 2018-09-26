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

## find
- `find / -name myfile.txt`
   - first part: find
   - second part: where to start search from, `/` means the whole drive
   - third part: an expression which determines what to find
   - fourth part: the name of the thing to find
- Find all files within current folder that accessed more than 100 days ago: `find . -atime 100`
- Find all empty files and folders in your system: `find / -empty`
- Find all executable files: `find / -exec`
- Find all readable files: `find / -read`
- Find all files with extension .mps: `find / -name *.mp3`
- To avoid matching files 'bat' in the middle like embattled.c, you could use:
   - `find /path/to/folder -name '*bat.c' -o -name 'bat*.c'`
   - `-o` is the or operator.
- If you want to search case-insensitively, so files containing BAT, bAt, and so forth are matched, use the `-iname` test instead of the `-name` test:
   - `find /path/to/folder -iname '*bat*'`
- If you want to find both regular files and symbolic links, you can use:
   - `find /path/to/folder -name '*bat*' \( -type f -o -type l \)`
- Display found file/folder details
   - `find /path/to/folder -name '*bat*' -ls`
- Send output of find to a file
   - `find /path/to/folder -name '*bat*' -fprint FileToPrintTo`
- Search for and edit a file at the same time:
   - `find . -name a.c -exec nano '{}' \;`

## grep (global regular expression print)
### processes text line by line and prints any lines which match a specified PATTERN, Matches a regular expression against text in a file, multiple files, or a stream of input.
- Find the lines containing `keyword`: `grep "keyword" yourfile`
- Highlight the `keyword` with color and line number: `grep --color -n "keyword" yourfile`
   - `-i` to ignore case
   - `-r` to recursively search subdirectories
   - `-c` to print a count of matching lines
   - `-o` to print only the matching parts of a matching line
   - `
- Replace `yourfile` with `*` to match any file or folder
#### More regular expression
   - `.` single-character wildcard
   - `?`	The question mark indicates zero or one occurrences of the preceding element. For example, colou?r matches both "color" and "colour".
   - `*`	The asterisk indicates zero or more occurrences of the preceding element. For example, ab*c matches "ac", "abc", "abbc", "abbbc", and so on.
   - `+`	The plus sign indicates one or more occurrences of the preceding element. For example, ab+c matches "abc", "abbc", "abbbc", and so on, but not "ac".
   - `.*` any number of any character.
   - `{n}` match exactly n times.
   - `{n,}` match n or more times.
   - `{n, m}` match at least n times, but not more than m times.
#### Variant programs
- rgrep: same as `grep -r`
- egrep: same as `grep -E`, evaluates your PATTERN string as an entended regular expression.
- fgrep: same as `grep -F`, evaluates your PATTERN string as a fixed string, every character is treated literally.


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
