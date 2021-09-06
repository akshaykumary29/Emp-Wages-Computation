#!/bin/bash

MAX_HRS_IN_MONTH=100
EMP_RATE_PER_HR=20
NUM_WORKING_DAYS=20

totalEmpHours=0
totalWorkingDays=0
totalSalary=0

declare -A dailyWage

function getWorkHrs() {
   empCheck=$(( RANDOM % 3 + 1 ))
   case $empCheck in
       1)
         empHrs=8
               ;;
       2)
         empHrs=4
               ;;
      *)
         empHrs=0
               ;;
   esac
echo $empHrs
}

function getEmpWage() {
	local workHr=$1
	wages=$(( $workHr * $EMP_RATE_PER_HR ))
	echo $wages
}

while [[ $totalEmpHours -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
   (( totalWorkingDays++ ))
   workingHrs="$( getWorkHrs )"
   totalEmpHours=$(( $totalEmpHours + $workingHrs ))
   dailyWage["$totalWorkingDays"]="$( getEmpWage $workingHrs )"
done

totalSalary=$(( $totalEmpHours * $EMP_RATE_PER_HR ));
echo "TOTAL EMPLOYEE HOURS=$totalEmpHours"
echo "TOTAL SALARY=$totalSalary"
echo "${dailyWage[@]}"
echo "${!dailyWage[@]}"
