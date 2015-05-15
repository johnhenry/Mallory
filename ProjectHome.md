# Mallory - Mathematics ActionScript Library - Advanced Math for ActionScript 3.0 #

This is a library for doing advanced college level math (i.e. beyond calculus) with in ActionScript 3.0.

## Parts ##

This library includes classes for working with
  * Complex numbers
  * Permutations
  * Cycles
  * Sets
  * Algebraic structures(i.e. groups, rings, fields, etc.)
  * Matrices (over algebraic structures)
  * Numeric sequences
  * Expression evaluation
  * Vectors
  * Polygons
  * Statistical Analysis
  * Graphing

## Current Status ##
There are some sample programs made with Mallory [here](http://webfiles.berkeley.edu/~jhenry/mallory).

On January 8th, I released an major update. Unfortunately, I haven't tested it very much so I know that it's full of bugs.

I've improved the organization of the code somewhat, but it still needs a lot of work. I know specifically that the ComplexMath class has many comments that are completely wrong. I copied and modified the code from the RealMath, and forgot to change all of the comments.

This latest update includes "Quickulator", a sample application that uses the Mallory code base.

If anyone wants to help I, I could really use people to help me to test, debug, and comment the code. Any other ideas are also welcome.

## History ##


### Main Actionscript Project ###
I've been working on this project on and off since 2004. Since then, it's gone through numerous rewrites including transitions from actionscript to actionscript 2 and actionscript 2 to actionscript 3. Most of the ground work is done. There are some noticeable problems with the matrix (with decomposition) class and the expression evaluation class, but hopefully I'll solve those soon.

### Secondary Javascript Project ###
There is a very incomplete javascript implementation (MalloryJS) that I threw together one weekend, but I'm not sure how much effort I want to put into it as ActionScript has a lot of features not found in JavaScript. Perhaps I'll put this on hold until JavaScript 2 becomes a widely accepted standard.


## Future Plans ##

In the near future, I plan to implement the following features
  * Example usage
  * Improved commenting
  * Unit tests
  * Equation solving
  * Polynomial manipulation
  * Numeric/symbolic integration and differentiation
  * Conic Sections

