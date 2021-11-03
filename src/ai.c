#include <stdio.h>

int board[] = { 1, 2, 0,
                2, 1, 0,
                0, 0, 0 };

int getValueAbove(int i) {
    int t = i-3;
    if (t < 0) {
        return board[t + 9];
    }
    return board[t];
}

int getValueBelow(int i) {
    int t = i+3;
    if (t > 8) {
        return board[t - 9];
    }
    return board[t];
}

int getLeftValue(int i) {
    int divI = i / 3;
    int divL = (i-1)/3;
    if (divI == divL) {
        return board[i-1];
    }
    return board[i+2];
}

int getRightValue(int i) {
    int divI = i / 3;
    int divR = (i+1)/3;
    if (divI == divR) {
        return board[i+1];
    }
    return board[i-2];
}

int getBlockingMove() {
    for (int i = 0; i < 9; i++) {
        if (board[i] == 0) {
            // horizontal
            if ((getLeftValue(i) == getRightValue(i)) && (getRightValue(i) != 0)) {
                return i;
            }
            // vertikal
            if ((getValueAbove(i) == getValueBelow(i)) && (getValueBelow(i) != 0)) {
                return i;
            }
        }
    }
    
    // diagonal 1
    if (board[0] == board[4] && board[4] != 0 && board[8] == 0) {
        return 8;
    }
    if (board[0] == board[8] && board[8] != 0 && board[4] == 0) {
        return 4;
    }
    if (board[8] == board[4] && board[4] != 0 && board[0] == 0) {
        return 0;
    }
    
    // diagonal 2
    if (board[2] == board[4] && board[4] != 0 && board[6] == 0) {
        return 6;
    }
    if (board[2] == board[6] && board[6] != 0 && board[4] == 0) {
        return 4;
    }
    if (board[6] == board[4] && board[4] != 0 && board[2] == 0) {
        return 2;
    }
    
    return 999;
}

int main(int argc, const char * argv[]) {
    int block = getBlockingMove();
    printf("Bester move: %d\n", block);
    return 0;
}
