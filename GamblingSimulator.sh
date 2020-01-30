#!/bin/bash 
echo "**********Welcome to Gambling Simulator Problem**********"

#CONSTANTS
STAKE_PER_DAY=100
BET_PER_GAME=1

#VARIABLES
cash=$STAKE_PER_DAY

declare -A dictionaryToCountMonths

function calculatePercentage(){
   MAXIMUM_RESULT=$(($STAKE_PER_DAY + (50*$STAKE_PER_DAY/100) ))  
   MINIMUM_RESULT=$(($STAKE_PER_DAY - (50*$STAKE_PER_DAY/100) ))
}
calculatePercentage

function calculateGambler(){
   while [[ $cash -gt $MINIMUM_RESULT && $cash -lt $MAXIMUM_RESULT ]]
   do
      RandomCheck=$((RANDOM%2))
         if [ 1 -eq $RandomCheck ]
         then
            cash=$(($cash+$BET_PER_GAME))
         else
            cash=$(($cash-$BET_PER_GAME))
         fi
   done
         totalCash=$cash-$STAKE_PER_DAY
         echo $totalCash
}

function calculateTotalAmount(){
for ((day=1;day<=20;day++))
do
   totalAmount=$((totalAmount + $(calculateGambler) ))
	dictionaryToCountMonths[day$day]=$totalAmount
	echo day$day ${dictionaryToCountMonths[day$day]} 
done
	echo $totalAmount
if [ $totalAmount -ge 0 ]
then
   echo "YOU WON,WOULD RESIGN FOR THE DAY"
else
   echo "YOU LOOSE,WOULD RESIGN FOR THE DAY"
fi
}

calculateTotalAmount 


