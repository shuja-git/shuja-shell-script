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

read -p "Enter ur Age- " age
if [ "${age}" -lt 18 ]; then
  echo "You are Minor"
elif [ "${age}" -gt 60 ]; then
  echo "you are senior citizen"
else
  echo "You are major"
fi




