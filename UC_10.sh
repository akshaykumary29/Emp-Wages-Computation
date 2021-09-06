#!/bin/bash 

echo "Welcome to Employee Wage Computation"

#constant values
EMP_RATE_PER_HOUR=20
NUMBER_OF_WORKING_DAYS=20
MAX_HRS_IN_MONTH=100

#variables
totalSalary=0
totalEmpHr=0
totalWorkingDays=0

function getWorkingHours() {
   empCheck=$(( RANDOM%3 + 1 ))
     case $empCheck in
      1)
       empHrs=8
       ;;
      2)
       empHrs=4
       ;;
      3)
       empHrs=0
       ;;
     esac
    echo $empHrs
}

function calculateDailyWage() {
     local workHours=$1
     wages=$(( $workHours * $EMP_RATE_PER_HOUR ))
     echo $wages
}

while [[ $totalEmpHr -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUMBER_OF_WORKING_DAYS ]]
do
   (( totalWorkingDays++ ))
   workingHours="$( getWorkingHours )"
   totalWorkHrs=$(( $totalEmpHr + $workingHours ))
   empDailyWage["$totalWorkingDays"]="$( calculateDailyWage $workingHours )"
done
   echo $totalWorkHrs

   #calculate wages per month
   totalSalary="$( calculateDailyWage $totalWorkHrs )"
   echo "Daily wage ${empDailyWage[@]}"
   echo "All keys  ${!empDailyWage[@]}"
