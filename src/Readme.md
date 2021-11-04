# Winning Conditions
There are 8 possible ways to win Tic-Tac-Toe. We assigned them numbers.
The cells are numbered in the follwing way:
![game board](../documentation/board.png)
| Condition | Cells with same symbol | Explaination |
|-----------|------------------------| ------------ |
| 1         | 1, 2, 3                | horizontal row 1 |
| 2         | 3, 5, 7                | diagonal bottom left to top right |
| 3         | 4, 5, 6                | horizontal row 2 |
| 4         | 1, 5, 9                | diagonal top left to bottom right |
| 5         | 3, 6, 9                | vertical column 3 |
| 6         | 1, 4, 7                | vertical column 1 |
| 7         | 2, 5, 8                | vertical column 2 |
| 8         | 7, 8, 9                | horizontal row 3 |

The numbers were chosen to make getting the winner from the array easy. Getting an array value like: `board[winningCondition]` will always return the winner of the game.

# AI
Tic Tac Toe is [is a solved game, with a forced draw assuming best play from both players](https://en.wikipedia.org/wiki/Tic-tac-toe), meaning the human player could never win the 1 player mode, even if they always make the correct move.

## Description
Because of that the game has a worse, two-staged AI. After every move of the human player, the first AI in file `ai.c` i.e. `ai.asm` checks if a player has a player has two symbols in the same row, column or diagonally. IF that is the case, the AI will return the value of the third cell in that row/column/diagonal.

This has the effect of either blocking a winning move of the human player, or connecting three cells and the AI winning the game.

If no such moves could be determined, the first AI returns 999, signaling no smart move availabe. A random number generator using the Rars syscall generates numbers from 0 to 8 until the cell with the generated number is empty.

## Limitations of the AI
Below are two (intentional) limitations of our AI which make it easier for the human player to win in 1 player mode.

- A side effect of the smart AI not checking if the two connected cells are from the human or AI player is, that if there is a state of the game where the AI could win in one move or block the human player in the next move, it may not always choose the winning move.<br><br>
Every empty cell is checked, starting from the top left. This means that if the cell which would be blocking for the human player has a lower cell number than the cell resulting in the AI's win, the AI always blocks the human player's next move.
<br><br>
Diagonal connections are checked at the very end.

- The AI only consideres the next move. It does not look multiple moves ahead.