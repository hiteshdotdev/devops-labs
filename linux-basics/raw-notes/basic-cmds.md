## Linux CMD’S

Zcat
For viewing the content of the compress file with the .z or .Z extension (.z or .Z compressed zip contains only a single file) 

Head - reads from the starting of a file 

Tail - reads from the end of a file

Less, more - for reading like man pages, eg - reading a big text file by one page at a time

Wc - count number of words, lines, bytes etc from a file. Args -> -l count number of lines, -w count number of words, -c count total bytes of the raw file, -m count number of chars

Ln (softlink, hardlink) - methods to reference files (any change in the copy or original file will reflect at both places)

Softlink (symbolic link)
Create a referenced file/folder for a given file/folder (if the original/source file is deleted the soft Link will not work anymore)
Cmd - ln -s <source> <soft-link-file/dir>

Hardlink 
Create a reference file/folder for a given file (hard link cannot be created for directories) and if the original/source file is deleted. The hard copy will remain accessible. 
Cmd - ln <source-file> <hard-link-file-name>

Cut. - cuts a small portion from a file (by bytes, characters etc.)

Tee - read from the stdin and writes to both the stdout, the terminal screen and the specified files (commonly used to print on the screen and saving content to the files)

Sort - used to sort lines from text files by, default sort in arc order, —reverse flag will sort in desc order

Diff - Compare files (lists changes to turn old_file into new_file)

---

## Login Related Shell Commands

Ssh (secure shell) - 
Used to get the shell access of a remote server. 
￼

## Disk Usage

Df - will show all the disk usage, -h flag will show in a human readable manner

Du . -  List the sizes of a directory and any subdirectories, in the given unit (KiB/MiB/GiB)

## Processes

Top - cli based system resource usage monitor (commonly used for viewing cpu, ram usage and viewing all the running processes)

Ps - Information about current running processes.

Fuser <source/dest> - show which processes are currently using the file or dir

Kill - used for killing/stoping running process (example - killing a running node process) 

Free - shows available and used memory/ram usage in linux (-h flag shows in a human readable formate)

Nohup <cmd> - stores the output of the cmds in a file named nohup.out even if you logout from the terminal | Allows for a process to live when the terminal gets killed.

Vmstat -  Display virtual memory statistics:

---