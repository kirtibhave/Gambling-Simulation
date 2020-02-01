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
}

function sorting(){
for i in ${!dictionaryToCountMonths[@]}
do
	echo $i ${dictionaryToCountMonths[$i]}
done | sort -rn -k2
}

function playingForNextMonth(){
read -p "enter your choice" choice
echo "1 for Yes"
echo "0 for No"
if [[ $choice == 1 ]]
then
	echo "play for next month"
	calculateTotalAmount
	echo Luckiest day2 :: $(sorting | head -1 )
	echo Unluckiest day2 :: $(sorting | tail -1 )
else
	echo "sorry!! you cannot play"
fi
}

calculateTotalAmount
echo Luckiest day2 :: $(sorting | head -1 )
echo Unluckiest day2 :: $(sorting | tail -1 )
playingForNextMonth


