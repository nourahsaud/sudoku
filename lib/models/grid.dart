import 'dart:math';

List board() {
// fill the grid with 0
  var grid = List.generate(9, (i) => List.generate(9, (j) => 0));

  List<int> randIndex = [];

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
