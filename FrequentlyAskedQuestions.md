# FAQ Section #

## General ##

### What is Mallory? ###
Mallory is a library for doing advanced college level math (i.e. beyond calculus) with in ActionScript 3.0.

### Who are you? ###
I'm a student with an interest in math and computer science.

### Why did you choose the name "Mallory"? ###
I name all of my projects after random girls. Kind of like boats or hurricanes(pre 1979).

### What can/should I use this for? ###
You can use this to create flash applications that do math. I recommend it for making educational web applications.

### Why did you make this? ###
This originally came out of a desire to graph complex valued functions for fun. At the time I started, I was heavily into flash animation. In creating the framework to make the graphs I had serendipitously also created the basis for Mallory.


### What is MalloryJS? ###
MalloryJS is (was) an attempt to port Mallroy to JavaScript so that it would be more useful in building Ajax applications without having to download a flash plug-in. Unfortunately the current implementation of JavaScript (1.5) lacks many features found in ActionScript 3.0. This made it a real pain to port. Also, compiled ActionScript performs faster than interpreted JavaScript, and the flash plug-in is pretty prevalent, so I decided that ActionScript was a safe bet. Consequently, I abandoned the project, but I'm not opposed to considering it in the future, especially once JavaScript 2 becomes a widely accepted standard.

## Quirks ##
I made a lot of decisions when programming this that may seem strange at first.

### Why did you choose ActionScript as opposed to something more efficient (performance wise) or less obscure? ###
When I first started working on this, flash was the programming environment with which I was most familiar. I've often considered porting this to other languages (such as C#) but flash provides so many advantages (built in graphics engine, ability to be deployed easily over the web, etc.) that I decided to stick with it.

### Why do so many functions take complex numbers as arguments when only the real part is used? ###
I did this for consistency. Since all real numbers are complex numbers, but not all complex numbers are real, it always makes sense to use complex numbers, but sometimes it's unacceptable to use a simple real number.


### Why use a generic "algebraic structure" as opposed to separate implementations of a group, ring, field, etc...? ###
I originally extended the set class to several common algebraic structures (group, ring, and field). However, considering how many recognized structures exist and minor ambiguities in definition, it wasn't practical to maintain these definition. Furthermore, there isn't a [[feasible](feasible.md)] method for a computer to verify the axioms for specific structures, so it's up to the programmer to make sure what he or she defines as a group is really a group, what's a ring is really a ring, etc.