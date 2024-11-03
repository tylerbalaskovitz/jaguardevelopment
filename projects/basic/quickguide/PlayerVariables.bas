DIM intName as INTEGER
DIM testPlayerName as STRING
DIM players$[6]
DIM tx AS INTEGER
DIM ty AS INTEGER
DIM winner AS STRING
DIM screenNumber as INTEGER
DIM pad1 AS INTEGER
'Sets text for how the names will be writte
jsfSetFontIndx(0)
jsfSetFontSize(1)
'Set coordinates for where text will appear on screen
tx = 38
ty = 182
winner = ""

players$[0]="Tyler"
players$[1] = "Loving"
players$[2] = "John"
players$[3] = "Navraj"
players$[4] = "Matt"
players$[5] = "Jarod" 
intName = 2
screenNumber = 0 

'Changes to the screen for writing a player's name
FUNCTION writeName()
	screenNumber = 1
END FUNCTION

'Assigns a player as the winner of the game
FUNCTION AssignWinner(inputString AS STRING)
    winner = inputString  ' Assign the value to the global string
	scrolling = 1	
END FUNCTION
