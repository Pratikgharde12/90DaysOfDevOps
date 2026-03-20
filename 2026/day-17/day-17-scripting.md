1)for_loop.sh
code:
for i in apple banana mango guava; do
  echo $i
  done


output:
ubuntu@ip-172-xx-xx-79:~/scripts$ ./for_loop.sh
apple
banana
mango
guava

2)count.sh
code : 
for i in {1..10};
do
        echo $i
done

output:
ubuntu@ip-172-xx-xx-79:~/scripts$ ./count.sh
1
2
3
4
5
6
7
8
9
10

3)countdown.sh
code : 
ubuntu@ip-172-xx-xx-79:~/scripts$ cat countdown.sh
read -p "enter a number" num
while (($num > 0)); do
        echo $num
        ((num--))
done
echo "done"

output : 
enter a number5
5
4
3
2
1
done

4) greet.sh
code :
name=$1

if [[ -z "$name" ]];then
        echo "Usage: $0"
else
        echo "Hello, $name !"
fi

output:
ubuntu@ip-172-xx-xx-79:~/scripts$ ./greet.sh pratik
Hello, pratik !
ubuntu@ip-172-xx-xx-79:~/scripts$ ./greet.sh
Usage: ./greet.sh

5) args_demo.sh
code :
echo "All arguments $@"
echo "Total number of arguments $#"
echo "script name $0"

output:
ubuntu@ip-172-xx-xx-79:~/scripts$ ./argesdemo.sh 1 2 3 4
All arguments 1 2 3 4
Total number of arguments 4
script name ./argesdemo.sh

6) install_packages.sh
code :
#!/bin/bash

packages=("nginx" "wget")

for pkg in ${packages[@]}; do
        if dpkg -s $pkg >/dev/null 2>&1; then
               echo " $pkg is already present"
        else
                echo " $pkg not present"
                echo "Installing the package"
                apt install $pkg -y
        fi
done

output:
ubuntu@ip-172-xx-xx-79:~/scripts$ sudo ./install_packages.sh
 nginx is already present
 wget is already present
 curl not present
Installing the package
Reading package lists... Done

output : 
ubuntu@ip-172-xx-xx-79:~/scripts$ ./install_packages.sh
Run as root


7) safe_script.sh
code :
#!/bin/bash

set -e

echo "step 1 mkdir"
mkdir /tmp/devops-test/ || echo "Directory already present"
echo "step 2 cd"
cd /tmp/devops-test
echo "step 3 file creation"
touch file1 || echo "file not created"
echo "exiting"

output:
ubuntu@ip-172-xx-xx-79:~/scripts$ ./safe_script.sh
step 1 mkdir
mkdir: cannot create directory ‘/tmp/devops-test/’: File exists
Directory already present
step 2 cd
step 3 file creation
exiting

Things I learned today  
1) How to write loops
2) how to install and check already present packages
3)use of set -e and how to handle scirpt failure
