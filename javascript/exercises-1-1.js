// Explanatory solutions are in the scheme directory

// Exercise 1.3

var sumOfSquaresOfTwoLargest = function (a, b, c) {
  var square = function (x) { return x * x; };
  var sumOfSquares = function (x, y) { return square(x) + square(y); };

  return sumOfSquares.apply(null, [a, b, c].sort().slice(1));
};


// utility functions for Exercise 1.7 & 1.8

var abs = function (x) {
  if (x < 0) return -x;
  return x;
};

var average = function (x, y) {
  return (x + y) / 2;
};


// Exercise 1.7

var sqrt = function (x) {
  var isGoodEnough = function (guess, lastGuess) {
    return abs(guess - lastGuess) / guess < 0.0000000001;
  };

  var improve = function (guess) {
    return average(guess, (x / guess));
  };

  var sqrtIter = function (guess, lastGuess) {
    if (isGoodEnough(guess, lastGuess))
      return guess;
    else
      return sqrtIter(improve(guess), guess);
  };
  
  return sqrtIter(1.0, 0.0);
};

// Exercise 1.8

var cubeRoot = function (x) {
  var square = function (x) { return x * x; };
  var cube = function (x) { return x * x * x; };

  var isGoodEnough = function (guess) {
    return abs(cube(guess) - x) < 0.0000000001;
  };
  
  var improve = function (guess) {
    return ((x / square(guess)) + (guess * 2)) / 3;
  };

  var cubeRootIter = function (guess) {
    if (isGoodEnough(guess))
      return guess;
    else
      return cubeRootIter(improve(guess));
  };

  return cubeRootIter(1.0);
};
