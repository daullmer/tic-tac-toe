/*
 *  Checks, if complete board is occupied with symbols
 *  returns 1 if all occupied, 0 if there is available space
 */
int allesBelegt(int board[]) {
    if (board[0] > 0  && 
        board[1] > 0  && 
        board[2] > 0  && 
        board[3] > 0  && 
        board[4] > 0  && 
        board[5] > 0  && 
        board[6] > 0  && 
        board[7] > 0  && 
        board[8] > 0) {
        return 1;
    }
    return 0;
}

/*
 *  Checks if one winning condition is true
 *  see Winning-Conditions.md for more info
 *  returns winning condition or 0 if no winner can be determined
 */
int checkFinished(int board[]) {
    // horizontal symbols match
    if (board[0] == board[1] == board[2]){
        return 1;
    }
    if (board[3] == board[4] == board[5]){
        return 3;
    }
    if (board[6] == board[7] == board[8]){
        return 8;
    }

    // vertical symbols match
    if (board[0] == board[3] == board[6]){
        return 6;
    }
    if (board[1] == board[4] == board[7]){
        return 7;
    }
    if (board[2] == board[5] == board[8]){
        return 5;
    }

    // main diagonal symbols match
    if (board[0] == board[4] == board[8]){
        return 4;
    }
    // "erste Winkelhalbierende" (links unten nach rechts oben)
    if (board[2] == board[4] == board[6]){
        return 2;
    }
    return 0;
}

/*
 *  Determines the winner of the current game
 *  based on the curretn board and the winning case
 *  returns 1 if X wins, 2 if O wins
 */ 
int getWinner(int board[], int winningCase) {
    return board[winningCase];
}

/*
 *  Checks the game outcome
 *  returns 0 if game should continue, 1 if X wins, 2 if O wins, 3 if tied
 */
int checkGameOutcome(int board[]) {
    int finishCase = checkFinished(board);
    if (finishCase <= 0) {
        if (allesBelegt(board)) {
            return 3;
        }
        return 0;
    }
    return getWinner(board, finishCase);
}