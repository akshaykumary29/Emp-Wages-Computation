#!/bin/bash

isFullTime=1;
isPartTime=2;
employeeRate=20;
randomCheck=$(( RANDOM % 3 ))
case $randomCheck in
   $isFullTime)
      echo Fulltime
      employeeHrs=8;;
   $isPartTime)
      echo Parttime
      employeeHrs=4;;
   *)
      echo absent
      employeeHrs=0;;
esac

salary=$(( $employeeHrs * $employeeRate ))
echo "Salary= $salary"
