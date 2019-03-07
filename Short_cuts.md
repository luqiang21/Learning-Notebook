

# Bash


- `1>&2` redirect `stdout` to `stderr`, `1` is `stdout` and `2` is `stderr`.
- `!!` Execute last command again.
- `$?` expands to the exit status of the most recently executed foreground pipeline. In simpler terms, it's the exit status of the last command.
   - If the value of `$?` is 0, then the previous process did terminate normally (or successfully). Otherwise there was some error.
- `$0`: The filename of the current script.
- `$#`: The number of arguments supplied to a script.
- `$$`: The process number of the current shell. For shell scripts, this is the process ID under which they are executing.
- `$@` expands into a list of separate parameters. Whereas, `$*` is one parameter consisting of all the parameters added together as one string. Read [this](https://www.thegeekstuff.com/2010/05/bash-shell-special-parameters/)
- `yourcommand &> filename` redirects both  `stdout`  and  `stderr`  from `yourcommand` to filename.
- `$(command)` returns the output of `command` which stands for command substitution
	- You can also use `` `command` `` which is the same, shell might not support
- If you are in root folder `/`, you need `sudo` to create a file. However, following command will not work
	- `sudo echo "hello" > file` will give you permission error since it needs to create the `file` first to complete redirection, `sudo echo "hello" | sudo > file` is the same since we are giving `sudo` to `>`.
	- You can use `tee` to solve the problem  
		> `tee [OPTION]... [FILE]...` copy standard input to each FILE and also to standard output
	- `echo "hello" | sudo tee file`
## `getopts`
- The option-string tells getopts which options to expect and which of them must have an argument. The syntax is very simple every option character is simply named as is, this example-string would tell getopts to look for -f, -A and -x:
	- `getopts fAx VARNAME`
- When you want getopts to expect an argument for an option, just place a : (colon) after the proper option flag. If you want -A to expect an argument (i.e. to become -A SOMETHING) just do:
	- `getopts fA:x VARNAME`
	
## `nohup`
- When using the command shell, prefixing a command with nohup prevents the command from being aborted automatically when you log out or exit the shell. 
- The name nohup stands for "no hangup." The hangup (HUP) signal, which is normally sent to a process to inform it that the user has logged off (or "hung up"), is intercepted by nohup, allowing the process to continue running.

## `ps` related
- `ps aux` to show running processes
- `ps aux | egrep "your_key_word | PID"` to grep your desired process and show header
- `kill your_process_PID` default kill method, if not working, try `kill -KILL your_process_PID`

## `more`: allows you to display output in the terminal one page at a time.
- specify the size the screen: `more -u5 <filename>`
- start from a certain line number: `more +u6 <filename>` 
- they can be combined: `more +u3 -u2 <filename>` show 2 lines starting from line 3
- start from a certain line of text: `more +/"the text to search for" <filename>`
- *display current line number* by pressing the euqal key (`=`)
- **search text**
   - `/hello world` find the first ocurrence of text "hello world"
   - If you want to find the 5th occurrence of "hello world" use "5/"hello world""
   - Pressing the 'n' key will find the next occurrence of the previous search term. If you used a number prior to the search term that will take precedence. So if you searched for the 5th occurrence of "hello world" then pressing "n" will look for the next 5th occurrence of "hello world".
   - Pressing the apostrophe (') key will go to the place where the search started.

## `less`: If you want to read through a large text file it is better to use the less command over an editor as it doesn't load the entire thing into memory. It loads each page into memory a page at a time making it more efficient.
- `ps -ef | less` show a list of running processes one page at a time.
- You can change the number of lines that are scrolled when you press space key of `f` key by pressing the number immediately before pressing the key.
   - To make this number default, you can enter the number followed by the `z` key.
   - `F` will keep trying even if the end of the file is reached. This is helpful for an updating file.
- `b` or `w` scroll one window back
- Press ESC immediately prior to the space bar, allow you to continue scrolling when you have reached the end of the output.
- `return`, `j` or `e` allow you scroll one line at a time.
- `k` or `y` scroll one line back at a time.
- `r` to repaint the screen or `R` to repaint the screen discarding any output that has been buffered.
- `g` to the beginning of the output, `G` to the end of the output. number followed by `%` or `p` go to a certain percentage of the file.
- `m` followed by a lowercase letter to set a marker, single quote to go to a marker
- *search for a pattern* use a forward slash key
- *load a new file into the output* `:e myfile.txt`

## `tail` shows the last 10 lines of a file, `head` shows first 10 lines of a file.
- `tail -n20 <filename>` specify the number of lines to see
- `tail -n+20 <filename>` speicify the starting line to see
- **monitor log file** 
   - check how the log changes every so many seconds: `tail -F -s20 <filename>`
   - continue monitoring until a process dies: `tail -F --pid=1234 <filename>`
   - to find the process id you can: `ps -ef | grep <programName>`

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
   - `-v` == `--invert-math` to select non-matching lines
- Replace `yourfile` with `*` to match any file or folder
#### grep show around lines
- For  **BSD**  or  **GNU**  `grep`  you can use  `-B num`  to set how many lines before the match and  `-A num`for the number of lines after the match.
	```
	grep -B 3 -A 2 foo README.txt
	```
- If you want the same number of lines before and after you can use  `-C num`.	
	```
	grep -C 3 foo README.txt
	```
- This will show 3 lines before and 3 lines after.
- To grep special symbols like `>` use `egrep`

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
- `rgrep`: same as `grep -r`
- `egrep`: same as `grep -E`, evaluates your PATTERN string as an entended regular expression.
- `fgrep`: same as `grep -F`, evaluates your PATTERN string as a fixed string, every character is treated literally.

# Docker
* `docker ps`
    * show running containers, use `-a` to show all.
* `docker images`
    * show all images
* `docker run --name new_container_name -p host_port:container_port existing_image_name`
    * run a new container with existing image
* `docker stop container_name`
    * stop the container
- `docker system prune -a` remove any stopped images and all unused images.
- `docker kill $(docker ps -q)` kill all running images
    
# Evernote:
* ctrl + command + k
    * 删除线

# gdb
## A debugger lets you pause a program, examine and change variables and step through code.
- `gcc -g myprogram.c` compiles myprogram.c with debugging information
- `gdb a.out` open gdb with file a.out, but it does not run the program.
- To run the program
   - `r`
   - `r arg1 arg2`
   - `r < file1` running by feeding a file
### Stepping through code
- List lines of code
   - `l` list 10 lines of source code around current line
   - `l 50` list 10 lines of source code around 50th line
   - `l myfunction` show myfunction
- `next` run program until next line, then pause. If the current line is a function, execute the entire function, then pause.
- `step` run the next instruction, not line. If the current instructions is setting a variable, it is the same as `next`. If it is a function, it will jump into the function, execute the first statement, then pause.
- `finish` finish executing the current function, then pause (also called step out). Useful if you accidentally stepped into a function.
- `info local` show local variables
### breakpoints and watchpoints
- Set a breakpoint, the program will pause when it reaches the breakpoint
   - `break 45` set a breakpoint at line 45
   - `break myfunction` set a breakpoint at myfunction
- `watch x == 3` watchpoint which pauses the program when a condition changes (when `x == 3` changes).
- `continue` resume execution after being paused by a breakpoint/watchpoint. The program will continue it hits the next breakpoint/watchpoint.
- `delete N` delete breakpoint N
- `disable` disable all breakpoints
- To list current breakpoints: `info break`
- To delete a breakpoint: `del [breakpointnumber]`
- To temporarily disable a breakpoint: `dis [breakpointnumber]`
- To enable a breakpoint: `en [breakpointnumber]`
### Setting variables and calling functions
- `print x` print current value of `x`
- `set x = 3` or `set x = y` set `x` to value `3` or another variable `y`
- `call myfunction()` or `call strlen(mystring)` call user-defined or system functions.
- `display x` `undisplay x` constantly display value of variable x which is shown after every step or pause.
### Backtrace and changing frames
- `bt` backtrace, print the current function stack to show where you are in the current program. 
- `bt full` backtrace including local varables
- `up` `down` move to the next frame up or down in the function stack.
- `return` return from current function.
### Crashes and core dumps
- `gdb myprogram core` debug myprogram with "core" as the core dump file
- `bt` print the backtrace at the point of the crash. Examine variables using the techniques above.
### Handling signals
- `handle [signalname] [action]`
- `handle SIGUSR1 nostop`
- `handle SIGUSR1 noprint`
- `handle SIGUSR1 ignore`



# git
* git clone depth=1 your_git_repo
    * only clone current version, no history
- `git add -v -u` verbose and only add updated files not new files
- After `git fetch`, `git log` won't show new commits on `origin/master`, you need to use `git log origin/master` to show commits from both local `master` and `origin/master`.
- To reset some file that has been added to stage, `git reset file_name`
- To abandon changes in one file that has not been added to stage, `git checkout file_name`

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

