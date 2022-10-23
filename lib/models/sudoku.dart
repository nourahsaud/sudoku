import 'package:flutter/material.dart';
import 'dart:math';

class Board extends ChangeNotifier {
  var grid = [];
  bool win = true;

// new board
  List board(var grid) {
    grid = List.generate(
        9, (i) => List.generate(9, (j) => 0)); // fill the board with 0's

    List<int> randIndex = []; // to store randomly chosen indexes
    int index = 0; // rand_index len

    int temp = 0;
    int number = 0; // generate a ranodm number
    int val = 0;

    // generate sudoku board
    for (int i = 0; i < 9; i++) {
      index = Random().nextInt(6) + 3;
      // fill the rand_index list
      while (randIndex.length < index) {
        temp = Random().nextInt(9);
        if (!randIndex.contains(temp)) {
          randIndex.add(temp);
        }
      }

      for (int x = 0; x < randIndex.length; x++) {
        // correctly fill the rows
        for (int r = 0; r < 9; r++) {
          if (randIndex[x] == r) {
            number = Random().nextInt(9) + 1;
            if (!grid[i].contains(number)) {
              grid[i][r] = number;
            } else {
              grid[i][r] = 0;
            }
          }
        }
      }
      randIndex.clear();
    }

    // validate the column values
    for (int c = 0; c < 9; c++) {
      for (int r = 0; r < 9; r++) {
        if (grid[r][c] != 0) {
          val = grid[r][c];
          for (int v = r + 1; v < 9; v++) {
            if (grid[v][c] != 0) {
              if (val == grid[v][c]) {
                grid[v][c] = 0;
              }
            }
          }
        }
        val = 0;
      }
    }

    List<int> unique = [];
    // validate matrix 3*3
    for (int i = 0; i < 7; i += 3) {
      for (int j = 0; j < 7; j += 3) {
        unique.clear();
        for (int k = 0; k < 3; k++) {
          for (int l = 0; l < 3; l++) {
            // Stores row number
            // of current block
            int X = i + k;
            // Stores column number
            // of current block
            int Y = j + l;
            // Stores the value
            // of board[X][Y]
            int Z = grid[X][Y];

            if (Z != 0) {
              if (!unique.contains(Z)) {
                unique.add(Z);
              } else {
                print('hi $X $Y $Z');
                grid[X][Y] = 0;
              }
            }
          }
        }
      }
    }

    for (int i = 0; i < 9; i++) {
      print(grid[i]);
    }
    return grid;
  }

// check validation
  bool checkBoard(var grid) {
    List<int> unique = [];

    // check if the range from 1 - 9
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (grid[i][j] <= 0 || grid[i][j] > 9) {
          return (false);
        }
      }
    }
    // check the rows validation
    for (int i = 0; i < 9; i++) {
      unique.clear();
      for (int j = 0; j < 9; j++) {
        int z = grid[i][j];
        if (!unique.contains(z)) {
          unique.add(z);
        } else {
          return false;
        }
      }
    }

    // check the cols validation
    for (int i = 0; i < 9; i++) {
      unique.clear();
      for (int j = 0; j < 9; j++) {
        int z = grid[j][i];
        if (!unique.contains(z)) {
          unique.add(z);
        } else {
          return false;
        }
      }
    }

    // check the matrix validation 3*3
    for (int i = 0; i < 7; i += 3) {
      for (int j = 0; j < 7; j += 3) {
        unique.clear();
        for (int k = 0; k < 3; k++) {
          for (int l = 0; l < 3; l++) {
            // Stores row number
            // of current block
            int X = i + k;
            // Stores column number
            // of current block
            int Y = j + l;
            // Stores the value
            // of board[X][Y]
            int Z = grid[X][Y];

            if (!unique.contains(Z)) {
              unique.add(Z);
            } else {
              return false;
            }
          }
        }
      }
    }

    // If all conditions satisfied
    return true;
  }
}

// void main() {
//   // fill the grid with 0
//   var grid = List.generate(9, (i) => List.generate(9, (j) => 0));
//   var sudokuBoard = board(grid);
//   bool win = checkBoard(sudokuBoard);
//   int row = grid.length;
//   int col = grid[0].length;
//   print(row * col);
//   print(win);

//   var winner = [
//     [7, 9, 2, 1, 5, 4, 3, 8, 6],
//     [6, 4, 3, 8, 2, 7, 1, 5, 9],
//     [8, 5, 1, 3, 9, 6, 7, 2, 4],
//     [2, 6, 5, 9, 7, 3, 8, 4, 1],
//     [4, 8, 9, 5, 6, 1, 2, 7, 3],
//     [3, 1, 7, 4, 8, 2, 9, 6, 5],
//     [1, 3, 6, 7, 4, 8, 5, 9, 2],
//     [9, 7, 4, 2, 1, 5, 6, 3, 8],
//     [5, 2, 8, 6, 3, 9, 4, 1, 7],
//   ];

//   print(checkBoard(winner));
// }
