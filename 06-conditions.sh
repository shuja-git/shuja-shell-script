#1)#simple if (if expression is true then command will be executed)
# if condition
#syntax:
# if [ expression ]; then
#    command
#  fi
#2)# if expression is true then command-1 will be executed and if
# expression is false then command-2 will be executed
#syntax:
# if [ expression ]; then
#    command-1
#  else
#     command-2
#  fi

#3) if expression-1 is true then command-1 will be executed, if not epression-2 is true then
# command-2 will be executed. if both the expressions are false then command-else will be executed.
#synatax:
# if [ expression-1 ]; then
#     command-1
#  elif [ expression-2 ]; then
#     command-2
#  else
#     command-else
# fi
# ------------------------------------
#   what is expressions understand that.
# expressions built on 3 things:
# 1. strings
#        operators on strings are:  =,!=,==, -z
#    ex: [ abc == ABC ]
#  2. numbers
#       operators on numbers are: -eq, -ne, gt, ge, lt, le
#  3. files
#        operators on files are:
#      -e to check if file exists or not
#     (so many are there refer documentation)
#--------------------------------------------------------------------------
# Example on if elif condition
#read -p "Enter ur Age- " age
#if [ "${age}" -lt 18 ]; then
#  echo "You are Minor"
#elif [ "${age}" -gt 60 ]; then
#  echo "you are senior citizen"
#else
#  echo "You are major"
#fi
#---------------------------------------------
# to check if user is providing input or not use -z in string expression
#example:
#read -p "enter ur age-" age
#if [ -z "${age}" ]; then
#  echo "Input missing"
#  exit
#fi
# that means if user has not giving any input then it should come out of script so use exit command

# expressions can be combined
#  [ expression-1 expression-2 ]
# logical AND -a
# logical OR  -o
#  -a   [ expression-1 -a expression-2 ] here if both the expressions are true then logical and is true
# -o   [ expression-1 -a expression-2 ] here if expression is true then logical or is true
# before any expression when u give ! then it will inverse the logic, for example -z checks for empty and
# ! -z checks for not empty

#read -p "enter ur age-" age
##if [ -z "${age}" ]; then
## echo "Input Missing.."
## exit
##fi
#if [  ! -z "${age}" -a "${age}" -lt 18 ]; then
#  echo  "u r minor"
#elif [ -z "${age}" ]; then
#    echo "input missing"
#    exit
#elif [ "${age}" -gt 18 -a "${age}" -gt 60 ]; then
#     echo "u r senior citizen"
#else
#      echo "u r citizen"
#fi
# ---------------------------------
# logical and and logical or when used in commands that means
# in case of and &&  i.e., com1 && com2 which means if com1 is true then only execute com2
# com1 || com2 which means if com1 is failed then only execute com2
