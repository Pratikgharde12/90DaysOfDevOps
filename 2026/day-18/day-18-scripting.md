1) Functions.sh 

Code : 
    #!/bin/bash
    
    name="$1"
    greet()
    {
            echo "Hello, $name"
    }
    
    greet
    
    add()
    {
            read -p "Enter first number " num1
            read -p "Enter second number " num2
            sum=$((num1 + num2))
            echo "Total is $sum "
    }
    
    add

2)disk_check.sh

    #!/bin/bash
    #
    
    check_disk()
    {
            echo "Checking disk space---"
            df -h /
    }
    
    check_memory(){
            echo "Checking free memory---"
            free -h
    }
    
    check_disk
    check_memory


3)strict_demo.sh

    #!/bin/bash
    #
    #set -e
    set -euo pipefail
    name=$1
    tool=$2
    show_details(){
            echo "The name is $name"
            echo "Tool is $tool"
    
            echo "making a directory which already exists"
            mkdir pratik
            echo "step after mkdir command"
    }
    
    show_details


Notes : 

Using set -e exits the script if any command in the script fails.
Using set -u stops the script if any variable value is not set.
    showing error like this "./strict_demo.sh: line 6: $2: unbound variable"
Using set -o pipefail

4) Local_demo.sh

        #!/bin/bash
        #
        #
        
        pie=200
        add(){
        
        local pie=100
        local num1=10
        local num2=10
        sum=$((num1+num2+pie))
        echo "Output: $sum"
        echo "print the value of pie variable inside of fucntion $pie"
        }
        echo "print the value of pie variable outside of fucntion $pie"
        add

5) system_info.sh

        #!/bin/bash
        
        hostnameAndOs(){
            hostname
            cat /etc/os-release
        }
        
        showuptime(){
            uptime
        }
        
        showDiskUsage(){
            df -h | sort -hr -k5 | head -5
        }
        
        showMemoryUsage(){
            free -h
        }
        
        showtop(){
            ps aux | head -5
        }
        
        runall(){
            hostnameAndOs
            echo "--------------------------------"
            showuptime
            echo "--------------------------------"
            showDiskUsage
            echo "--------------------------------"
            showMemoryUsage
            echo "--------------------------------"
            showtop
        }
        
        runall

Learning

1) How to use the variables set -e, set -u, set -o pipefail
2)how to write functions and use local variables
3)Difference between local variables and normal variables in bash scripting.
