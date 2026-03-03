check_file.sh

    echo "Starting the file checking"
    if [ -f check_number.sh ]
    then echo "File is present"
    else
      echo "File not found"
    fi

ubuntu@ip-172-31-6-79:~/scripts$ ./check_file.sh
Starting the file checking
File is present
---

check_number.sh

    echo "Enter a number"
    read num
    
    if [ $num == 0 ]
    then
           echo "number is zero"
    elif [ $num > 0 ]
    then
        echo "The number is positive"
    elif [ $num < 0 ]
    then
        echo "THe number is negative"
    fi

ubuntu@ip-172-31-6-79:~/scripts$ ./check_number.sh
Enter a number
5
The number is positive
---
greet.sh 

    echo "Enter your name "
    read user
    echo "Enter your favourite tool"
    read tool
    
    echo "Hello $user , your favourite tool is $tool"

Enter your name
Pratik
Enter your favourite tool
Hammer
Hello Pratik , your favourite tool is Hammer
---
hello.sh

    echo "Hello, Devops !"

Hello, Devops !

---
server_check.sh

    #!/bin/bash
    
    service=nginx
    
    read -p "Do you want to check the status ? y/n " status
    
    if [  $status == "y" ]
    then
      systemctl status $service | grep -ie "active" -e "inactive" -e "stopped"
      #systemctl status $service
    elif [ $status == "n" ]
    then echo "Skipped"
    fi
    
---
variablels.sh

    NAME='Pratik'
    ROLE='Devops Engineer'
    
    echo "My Name is $NAME and role is $ROLE"

My Name is Pratik and role is Devops Engineer

#Three things I learned today. 
- How to take input with bash script
- how to use the if else in bash
- how to create and user variable in bash script.
