# Shell Scripting Cheat Sheet 
---
| Topic | Key Syntax | Example |
|------|-----------|---------|
| Shebang | `#!/bin/bash` | `#!/bin/bash` |
| Run Script | `chmod +x file && ./file` | `chmod +x app.sh && ./app.sh` |
| Comment | `# comment` | `# This is a note` |
| Variable | `VAR="value"` | `NAME="DevOps"` |
| Variable Usage | `$VAR`, `"$VAR"` | `echo "$NAME"` |
| Read Input | `read var`, `read -p` | `read -p "Enter name: " name` |
| Arguments | `$0`, `$1`, `$#`, `"$@"` | `./script.sh arg1 arg2` |
| Exit Code | `$?` | `ls file; echo $?` |
| String Compare | `[ "$a" = "$b" ]` | `[ "$env" = "prod" ]` |
| String Empty | `-z`, `-n` | `[ -z "$var" ]` |
| Integer Compare | `-eq`, `-ne`, `-lt`, `-gt`, `-le`, `-ge` | `[ "$a" -gt 10 ]` |
| File Test | `-f`, `-d`, `-e`, `-r`, `-w`, `-x`, `-s` | `[ -f file.txt ]` |
| If Condition | `if [ cond ]; then ... fi` | `if [ -d dir ]; then echo OK; fi` |
| Logical AND | `cmd1 && cmd2` | `[ -f file ] && echo "Exists"` |
| Logical OR | `cmd1 \|\| cmd2` | `[ -f file ] \|\| echo "Missing"` |
| Logical NOT | `! condition` | `if ! [ -f file ]; then echo "No file"; fi` |
| Case | `case var in ... esac` | `case $1 in start) echo "start";; esac` |
| For Loop | `for i in list; do ... done` | `for i in 1 2 3; do echo $i; done` |
| C Loop | `for ((i=0;i<n;i++))` | `for ((i=0;i<5;i++)); do echo $i; done` |
| While Loop | `while [ cond ]; do ... done` | `while [ "$i" -lt 5 ]; do ((i++)); done` |
| Until Loop | `until [ cond ]; do ... done` | `until [ "$i" -gt 5 ]; do ((i++)); done` |
| Break | `break` | `if [ "$i" -eq 5 ]; then break; fi` |
| Continue | `continue` | `if [ "$i" -eq 3 ]; then continue; fi` |
| Loop Files | `for f in *.log` | `for f in *.log; do echo "$f"; done` |
| Read Loop | `while read line` | `while read -r l; do echo "$l"; done < file.txt` |
| Function | `name() { ... }` | `greet() { echo "Hi"; }` |
| Function Call | `name arg1` | `greet "Pratik"` |
| Function Args | `$1`, `$2` | `echo "$1"` |
| Return Status | `return N` | `return 1` |
| Return Value | `echo` + capture | `result=$(func)` |
| Local Var | `local var` | `local x=10` |
| Grep | `grep [opts] pattern file` | `grep -i "error" log.txt` |
| Awk | `awk '{...}'` | `awk -F: '{print $1}' /etc/passwd` |
| Sed | `sed 's/a/b/g'` | `sed -i 's/foo/bar/g' file.txt` |
| Cut | `cut -d delim -f` | `cut -d: -f1 /etc/passwd` |
| Sort | `sort [-nru]` | `sort -nr file.txt` |
| Uniq | `uniq [-c]` | `uniq -c file.txt` |
| Tr | `tr set1 set2` | `tr 'a-z' 'A-Z' < file.txt` |
| Wc | `wc -lwc` | `wc -l file.txt` |
| Head | `head -n N` | `head -n 10 file.txt` |
| Tail | `tail -n N`, `-f` | `tail -f app.log` |
| Find Old Files | `find path -mtime +N` | `find . -type f -mtime +7 -delete` |
| Replace Multiple | `sed -i` | `sed -i 's/old/new/g' *.txt` |
| Service Check | `systemctl is-active` | `systemctl is-active nginx` |
| Disk Alert | `df -h &#124; awk` | `df -h &#124; awk '$5+0 > 80 {print $0}'` |
| Tail Errors | `tail -f \| grep` | `tail -f app.log \| grep --line-buffered ERROR` |
| Exit | `exit N` | `exit 1` |
| set -e | exit on error | `set -e` |
| set -u | unset variable error | `set -u` |
| pipefail | fail on pipe error | `set -o pipefail` |
| Debug | `set -x` | `set -x` |
| Trap | `trap 'cmd' SIGNAL` | `trap 'cleanup' EXIT` |

---

## Task 1: Basics

### 1. Shebang (#! /bin/bash)

**What it does:**

* Tells the system which interpreter to use for the script.
* Ensures consistent execution regardless of default shell.

```bash
#!/bin/bash
```

---

### 2. Running a script

```bash
chmod +x script.sh   # make executable
./script.sh          # run directly
bash script.sh       # run with bash
```

---

### 3. Comments

**Single-line:**

```bash
# This is a comment
```

**Inline:**

```bash
echo "Hello"  # prints Hello
```

---

### 4. Variables

```bash
NAME="Pratik"
echo $NAME
echo "$NAME"   # safe (preserves spaces)
echo '$NAME'   # literal (no expansion)
```

---

### 5. Reading user input

```bash
read -p "Enter your name: " name
echo "Hello $name"
```

---

### 6. Command-line arguments

```bash
echo "Script name: $0"
echo "First arg: $1"
echo "Total args: $#"
echo "All args: $@"

ls invalidfile
echo $?   # exit status of last command
```

---

## Task 2: Operators and Conditionals

### 1. String comparisons

```bash
[ "$a" = "$b" ]
[ "$a" != "$b" ]
[ -z "$a" ]   # empty string
[ -n "$a" ]   # non-empty
```

---

### 2. Integer comparisons

```bash
[ $a -eq $b ]
[ $a -ne $b ]
[ $a -lt $b ]
[ $a -gt $b ]
[ $a -le $b ]
[ $a -ge $b ]
```

---

### 3. File test operators

```bash
[ -f file.txt ]   # file exists
[ -d dir ]        # directory exists
[ -e path ]       # exists
[ -r file ]       # readable
[ -w file ]       # writable
[ -x file ]       # executable
[ -s file ]       # not empty
```

---

### 4. if / elif / else

```bash
if [ $a -eq 10 ]; then
  echo "Equal to 10"
elif [ $a -gt 10 ]; then
  echo "Greater than 10"
else
  echo "Less than 10"
fi
```

---

### 5. Logical operators

```bash
[ $a -gt 5 ] && echo "Greater than 5"
[ $a -lt 5 ] || echo "Not less than 5"

if ! [ $a -eq 10 ]; then
  echo "Not equal to 10"
fi
```

---

### 6. Case statement

```bash
case $1 in
  start)
    echo "Starting service"
    ;;
  stop)
    echo "Stopping service"
    ;;
  restart)
    echo "Restarting service"
    ;;
  *)
    echo "Invalid option"
    ;;
esac
```

---


```bash
if [[ -z "$1" ]]; then
  echo "Argument required"
  exit 1
fi
```

---

---

## Task 3: Loops

### 1. for loop

**List-based:**

```bash
for item in apple banana mango; do
  echo "$item"
done
```

**C-style:**

```bash
for ((i=0; i<5; i++)); do
  echo "Count: $i"
done
```

---

### 2. while loop

```bash
i=1
while [ $i -le 5 ]; do
  echo "Number: $i"
  ((i++))
done
```

---

### 3. until loop

```bash
i=1
until [ $i -gt 5 ]; do
  echo "Number: $i"
  ((i++))
done
```

---

### 4. Loop control

**break:**

```bash
for i in {1..10}; do
  if [ $i -eq 5 ]; then
    break
  fi
  echo $i
done
```

**continue:**

```bash
for i in {1..5}; do
  if [ $i -eq 3 ]; then
    continue
  fi
  echo $i
done
```

---

### 5. Looping over files

```bash
for file in *.log; do
  echo "Processing $file"
done
```

---

### 6. Looping over command output

```bash
cat file.txt | while read line; do
  echo "$line"
done
```

Better (no subshell issues):

```bash
while read line; do
  echo "$line"
done < file.txt
```

---

## Task 4: Functions

### 1. Defining a function

```bash
my_function() {
  echo "Hello World"
}
```

---

### 2. Calling a function

```bash
my_function
```

---

### 3. Passing arguments

```bash
greet() {
  echo "Hello $1"
}

greet "Pratik"
```

---

### 4. Return values

**Using return (exit status only):**

```bash
add() {
  return $(( $1 + $2 ))
}

add 2 3
echo $?  # Output: 5
```

**Using echo (recommended for values):**

```bash
add() {
  echo $(( $1 + $2 ))
}

result=$(add 2 3)
echo "$result"
```

---

### 5. Local variables

```bash
my_func() {
  local var="I am local"
  echo "$var"
}
```

---

## Task 5: Text Processing Commands

### 1. grep

```bash
grep "error" file.txt        # search
grep -i "error" file.txt     # ignore case
grep -r "error" /logs        # recursive
grep -c "error" file.txt     # count matches
grep -n "error" file.txt     # line number
grep -v "error" file.txt     # invert match
grep -E "err|fail" file.txt  # extended regex
```

---

### 2. awk

```bash
awk '{print $1}' file.txt            # print first column
awk -F',' '{print $2}' file.csv      # custom delimiter
awk '/error/ {print $0}' file.txt    # pattern match
awk 'BEGIN {print "Start"} {print} END {print "End"}' file.txt
```

---

### 3. sed

```bash
sed 's/old/new/' file.txt            # replace first occurrence
sed 's/old/new/g' file.txt           # replace all
sed -i 's/old/new/g' file.txt        # in-place edit
sed '2d' file.txt                    # delete line 2
```

---

### 4. cut

```bash
cut -d',' -f1 file.csv               # first column
cut -c1-5 file.txt                  # character range
```

---

### 5. sort

```bash
sort file.txt
sort -n numbers.txt
sort -r file.txt
sort -u file.txt
```

---

### 6. uniq

```bash
uniq file.txt
uniq -c file.txt
uniq -d file.txt
```

---

### 7. tr

```bash
tr 'a-z' 'A-Z' < file.txt
tr -d '\r' < file.txt
```

---

### 8. wc

```bash
wc -l file.txt
wc -w file.txt
wc -c file.txt
```

---

### 9. head / tail

```bash
head -n 10 file.txt
tail -n 10 file.txt
tail -f app.log
```

---

## Task 6: Useful Patterns and One-Liners

### 1. Delete files older than 7 days

```bash
find /path -type f -mtime +7 -delete
```

### 2. Count lines in all .log files

```bash
wc -l *.log
```

### 3. Replace string across multiple files

```bash
sed -i 's/old/new/g' *.txt
```

### 4. Check if service is running

```bash
ps -ef | grep nginx | grep -v grep
```

Better:

```bash
systemctl is-active nginx
```

### 5. Monitor disk usage alert (>80%)

```bash
df -h | awk '$5+0 > 80 {print $0}'
```

### 6. Parse CSV

```bash
awk -F',' '{print $1, $2}' file.csv
```

### 7. Tail logs for errors

```bash
tail -f app.log | grep --line-buffered "ERROR"
```

---

## Task 7: Error Handling and Debugging

### 1. Exit codes

```bash
command
echo $?   # last command status

exit 0    # success
exit 1    # failure
```

---

### 2. set -e

```bash
set -e
# script exits if any command fails
```

---

### 3. set -u

```bash
set -u
# error on undefined variables
```

---

### 4. set -o pipefail

```bash
set -o pipefail
# catches failure in pipelines
```

---

### 5. set -x

```bash
set -x
# prints each command before execution
```

---

### 6. trap

```bash
cleanup() {
  echo "Cleaning up..."
}

trap cleanup EXIT
```

---

## Combined Best Practice Header

```bash
#!/bin/bash
set -euo pipefail
```

## Best Practice Tips

* Always quote variables: "$VAR"
* Prefer [[ ]] over [ ] for complex conditions
* Validate input before using it
---
