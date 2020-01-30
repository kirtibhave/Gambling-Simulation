echo "**********Welcome to Gambling Simulator Problem**********"

#CONSTANTS
STAKE_PER_DAY=100
BET_PER_GAME=1

function checkCondition(){
RandomCheck=$(($RANDOM%2))
	if [ 1 -eq $RandomCheck ]
	then
		echo "Congratulations..!!You won"
	else
		echo "You loose..!!Better luck next time."
	fi
}

checkCondition
