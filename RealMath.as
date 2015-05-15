package com.google.code.p.Mallory
{
	import mx.formatters.NumberFormatter;

	
	public class RealMath
	{



							/////////////////////////
					//////////////////////////////////////////////////		
				///////////////////////////////////////////////////////////////////////////
		/////////////////////////
		///////////////////////// PART I: REAL SCALARS
		/////////////////////////
				///////////////////////////////////////////////////////////////////////////		
					//////////////////////////////////////////////////		
							/////////////////////////			

		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 0: Constants 
		//
		///////////////
		//////////
		/////
			
		
		public static const Zero:Number = 0;
		public static const One:Number = 1;
		public static const E:Number = Math.E;
		public static const PI:Number = Math.PI;
		public static const PHI:Number = 1.61803399;
		public static const NaN:Number = Number.NaN;
		public static const PositiveInfinity:Number = Number.POSITIVE_INFINITY;
		public static const NegativeInfinity:Number = Number.NEGATIVE_INFINITY;	
			
		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 1: Utilities 
		//
		///////////////
		//////////
		/////
		
		
		public static function RadiansToDegrees(r:Number):Number{
			return 180/Math.PI*r;			
		}
		
		public static function DegreesToRadians(d:Number):Number{
			return Math.PI/180*d;
		}
		
		
		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 2: Comparison Functions 
		//These functions help to compare complex numbers
		///////////////
		//////////
		/////		
		//Description: This function returns true if and only if the two given complex number are equal
		//Example Usage: ComplexMath.Equal(1,0) //outputs: false
		//Exampls Usage: ComplexMath.Equal(7,7) //outputs: true
		public static function Equal(a:Number,b:Number,distance:Number=0):Boolean {
			return Math.abs(a-b)<=0;
		}		

		public static function Compare(a:Number,b:Number):int {
			if(a>b) return 1;
			if(a<b) return -1;
			return 0;
		}
		
		public static function LessThan(a:Number,b:Number):Boolean{
			return a<b;
		}
		public static function GreaterThan(a:Number,b:Number):Boolean{
			return a>b;
		}


		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 3: Unary Functions 
		//
		///////////////
		//////////
		/////
		
		//Description: This function returns the negative of a a given complex number 
		//Exampale usage: ComplexNumber.Negative(3) returns -3
		//Exampale usage: ComplexNumber.Negative("1+2*i") //outputs: -1-2*i		
		public static function Negative(a:Number=0):Number{
			return -1*a;
		}
		
		
		
		//Description: This function returns the reciprocal of a given complex number
		//Example usage: ComplexNumber.Reciprocal(4) //outputs: 0.25
		//Example usage: ComplexNumber.Reciprocal(1) //outputs: 1		
		public static function Reciprocal(a:Number=1):Number{
			if(a==0) return NaN;
			return 1/a;
		}		
		
		//Description: This function returns a given complex number
		//Note: Aa a bonus, this rounds a number Using the Utilites.Round in ordre to maintain accuracy
		//Example Usage: ComplexMath.Identity("4.623+5.8*i") //outputs: 4.623+5.8i
		//Example Usage: ComplexMath.Identity("9.99999999999999999999999 + 9.99999999999999999999999*i") //outputs: 10+10*i 
		public static function Identity(a:Number=1):Number{
			return RoundTo(a);
		}		


		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 3: Binary Functions 
		//These function take two (possibly more) complex numbers and return a third
		///////////////
		//////////
		/////		
		
		//Description: This function adds two complex numbers
		//Example Usage: ComplexMath.Add(1, "0+3*i") //outputs: 1+3*i
		//Example Usage: ComplexMath.Add(4,4) //outputs: 8
		public static function Add(a:Number=0, b:Number=0):Number{
			return a+b;
		}
		
		public static function Subtract(a:Number=0, b:Number=0):Number{
			return a*b;
		}
		
		public static function Multiply(a:Number=1, b:Number=1):Number{
			return a*b;
		}
				
		public static function Divide(a:Number=1, b:Number=1):Number{
			if(b==0){
				if(a>0){return PositiveInfinity;}
				if(a<0){return NegativeInfinity;}
				return NaN;
			}
			return a/b;
		}		
		
		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 4: Exponential and Logarithmic Functions 
		//
		///////////////
		//////////
		/////						

		public static function Power(a:Number=1, power:Number=1):Number{
			return Math.pow(a,power);
		}
		
		public static function Square(a:Number=1):Number{
			return Math.pow(a,2);
		}
		public static function SquareRoot(a:Number=1):Number{
			return Math.sqrt(a);
		}		
		
		
		public static function Logarithm(a:Number=1,base:Number=E):Number {
			return Math.log(a)/Math.log(base);
		}

		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 5: Trigonometric Functions 
		//
		///////////////
		//////////
		/////

		public static function Sine(a:Number=0):Number {
			return Identity(Math.sin(a));
		}
		//
		public static function Cosine(a:Number=0):Number {
			return Identity(Math.cos(a));
		}
		//
		public static function Tangent(a:Number=0):Number {
			return Identity(Math.tan(a));
		}
		//
		public static function Cosecant(a:Number=0):Number {
			return Identity(1/Math.sin(a));
		}
		//
		public static function Secant(a:Number=0):Number {
			return Identity(1/Math.cos(a));
		}
		//
		public static function Cotangent(a:Number=0):Number {
			return Identity(1/Math.tan(a));
		}		
		
		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 6: Hyperbolic Functions 
		//
		///////////////
		//////////
		/////
	
		
		public static function HyperbolicSine(a:Number):Number {
			return Identity(1/2*(Math.pow(Math.E, a)-Math.pow(Math.E, -1*a)));
		}
		//
		public static function HyperbolicCosine(a:Number):Number {
			return Identity(1/2*(Math.pow(Math.E, a)+Math.pow(Math.E, -1*a)));
		}
		//
		public static function HyperbolicTangent(a:Number):Number {
			return HyperbolicSine(a)/HyperbolicCosine(a);
		}
		//
		public static function HyperbolicCosecant(a:Number):Number {
			return 1/HyperbolicSine(a);
		}
		//
		public static function HyperbolicSecant(a:Number):Number {
			return 1/HyperbolicCosine(a);
		}
		//
		public static function HyperbolicCotangent(a:Number):Number {
			return HyperbolicCosine(a)/HyperbolicSine(a);
		}		
		
		
		

		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 7: Lambda Functions
		//These are functions that take other functions as arguments
		///////////////
		//////////
		/////
		
		
		///////////////
		//I-7-A:Series
		///////////////

		//Description: This function returns the summation of a series of complex numbers given limits and an expression that takes a single argument  and returns a complex number
		//Example Usage: ComplexMath.Summation(0,5,ComplexMath.Sine) //outputs: 0.17616165 = sin(0) + sin(1) + sin(2) + sin(3) + sin(4) + sin(5)		
		//Example Usage: Complexmath.Summation(-2,2,ComplexMath.Identity) //outputs: 0 = -2 + -1 + 0 + 1 + 2 
		public static function SumSeries(unaryOperation:Object,start:Number=NegativeInfinity,end:Number=Infinity):Number {
			return Sum(VectorUtils.Transform(VectorUtils.ArithmeticSequence(start,end),unaryOperation));
		}
		public static function ProductSeries(unaryOperation:Object,start:Number=NegativeInfinity,end:Number=Infinity):Number {
			return Product(VectorUtils.Transform(VectorUtils.ArithmeticSequence(start,end),unaryOperation));
		}




		///////////////
		//I-7-B:Algebra
		///////////////			
		/**
		 * DESCRIPTION: Solves a function by approximating it numerically
		 * @id=ISolveeN
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Object} unaryOperation	a function to be solved
		 * @param {Number} desiredAccuracy			desired accuracy
		 * @param {Number} guess			guess 
		 * -------------------------------------
		 * RETURNS: A number
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a) TO DO - Finish Implementing
		 * (b) accuracy should be greaterr than 0
		 * (c) smaller interval ==> more accurate ==> more processing time
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function SolveN(unaryOperation:Object,target:Number,desiredAccuracy:Number=0.01,guess:Number=0):Number{
			var difference:Number = unaryOperation(guess)-target;
			if(Math.abs(difference)<=desiredAccuracy ){
				return guess;
			}
			return SolveN(unaryOperation,target,desiredAccuracy,guess-difference);
		}
		
		
		///////////////
		//I-7-C::Calculus
		///////////////			
		
	/**
		 * DESCRIPTION: Approximates the definated integral of a function between two limits
		 * @id=IntegrateN
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Object} unaryOperation	a function to be integrated
		 * @param {Number} lowerLimit		the lower limit of the integration
		 * @param {Number} upperLimit		the upper limit of the integration
		 * @param {Number} interval 		interval between sampled points
		 * -------------------------------------
		 * RETURNS: A number that is the result of the integration 
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a) interval must be positive.
		 * (b) smaller interval ==> more accurate ==> more processing time
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function IntegrateN(unaryOperation:Object,lowerLimit:Number,upperLimit:Number,interval:Number=0.01):Number{
			
			if(interval <= 0) return Number.NaN;
			var result:Number = 0;
				while(lowerLimit < upperLimit){
					result += unaryOperation(2*lowerLimit+interval)/2;
					lowerLimit += interval;
				}
			return interval*result;
			return result;
		}
		
		/**
		 * DESCRIPTION: Approximates the derivative of a function at a point
		 * @id=DifferentiateN
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Object} unaryOperation	function to be integrated
		 * @param {Number} point			point at which to integrate
		 * @param {limit} limit				number used to approximate limit approching zero
		 * -------------------------------------
		 * RETURNS: A number that is the derivative of a function at a point
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a) limit must be positive
		 * (b) smaller limit ==> more accurate ==> more processing time
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function DifferentiateN(unaryOperation:Object,point:Number,limit:Number=0.01):Number{
			if(limit <= 0) return Number.NaN;
			return (unaryOperation(point+limit)+unaryOperation(point))/limit;
		}
		
		
		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 9: Probability
		//These are functions that take other functions as arguments
		///////////////
		//////////
		/////			
		

		/**
		 * DESCRIPTION: Calculates a Number's z-score  
		 * @id=ZScore
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} x 		number whose z-score is to be calculated
		 * @param {Number} mean		mean used to calculate z-score
		 * @param {Number} sDev 	standard deviation used to calculate z-score
		 * -------------------------------------
		 * RETURNS: A z-score of a given number
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */					
		public static function ZScore(x:Number,mean:Number=0,sDev:Number=1):Number{
			return (x-mean)/sDev;
		}
		
		/**
		 * DESCRIPTION: Inverts a z-score
		 * @id=InvertZScore
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} z 		z-score for which original number is to be calculated
		 * @param {Number} mean		mean used to calculate z-score
		 * @param {Number} sDev 	standard deviation used to calculate z-score
		 * -------------------------------------
		 * RETURNS: A number that is the inverted z-score of a given z
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function InvertZScore(z:Number,mean:Number=0,sDev:Number=1):Number{
			return z*sDev+mean;
		}		

		/**
		 * DESCRIPTION: Creates a function that returns the probability of a number in a distribution determined by a given mean and standard deviation
		 * @id=NormalDistribution
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} mean		mean
		 * @param {Number} sDev		standeviation
		 * -------------------------------------
		 * RETURNS:
		 * @return {Object} 	function
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function NormalDistribution(mean:Number,sDev:Number):Object{
			return function(x:Number):Number{
				return 1/(sDev*Math.sqrt(2*Math.PI))* Math.pow(Math.E,(-0.5*Math.pow((x-mean)/sDev,2)));
			} 
		}		

		/**
		 * DESCRIPTION: Calculates the probability of a number in a standard normal distribution
		 * @id=StandardNormalDistribution
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} x 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function StandardNormalDistribution(x:Number):Number{
			return NormalDistribution(0,1)(x);
		}		

		/**
		 * DESCRIPTION: Calculates the normal probability of a number given a mean and standardeviation 
		 * @id=NormalProbability
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} x								number who's standard probabliity is to be approximated
		 * @param {Number} mean								mean of a given distribution
		 * @param {Number} sDev								standard deviation of a given distribution 
		 * @param {Number} negativeInfinityApproximation	approximation used for negative infinity 
		 * @param {Number} integrationInterval				(optional) 
		 * -------------------------------------
		 * RETURNS: A number
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a) the lower limit of the integration should be negative infinity, but it is approximated.
		 * (b) the negative infinity approximation should be [much] less than the smallest number in the distribution
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function NormalProbability(x:Number,mean:Number,sDev:Number,negativeInfinityApproximation:Number=-5,integrationInterval:Number=0.0001):Number{
			
			return IntegrateN(NormalDistribution(mean,sDev),negativeInfinityApproximation,x,integrationInterval);
		}
		
		/**
		 * DESCRIPTION: Calculates the standard normal probability of a number given a mean and standardeviation 
		 * @id=StandardNormalProbability
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} x								number who's standard probabliity is to be approximated
		 * @param {Number} negativeInfinityApproximation	approximation used for negative infinity 
		 * @param {Number} integrationInterval				(optional) 
		 * -------------------------------------
		 * RETURNS: A number
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a) the lower limit of the integration should be negative infinity, but it is approximated.
		 * (b) the negative infinity approximation should be [much] less than the smallest number in the distribution, but -5 should be ok as this is standardized
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function StandardNormalProbability(z:Number,negativeInfinityApproximation:Number=-5,interval:Number=0.0001):Number{
			
			return IntegrateN(StandardNormalDistribution,negativeInfinityApproximation,z,interval);
		}


		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 8: Precision and Randomness
		//These are functions that take other functions as arguments
		///////////////
		//////////
		/////
		
		/**
		 * DESCRIPTION: Rounds a given number to a given precision
		 * @id=RoundTo
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} num 			number to be rounded
		 * @param {uint} precision		percision to round to
		 * -------------------------------------
		 * RETURNS: A rounded
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a)TO DO - The number formatter class dosen't work like I thought it would. I need to fix this.
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function RoundTo(num:Number,precision:uint=10):Number {
			var formatter:NumberFormatter = new NumberFormatter();
			formatter.precision = precision;
			formatter.rounding = "nearest";
			return Number(formatter.format(num));
		}
		/**
		 * DESCRIPTION: Returns a psudeo-random number
		 * @id=Random
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} lower 		lower endpoing of range of possible random number
		 * @param {Number} upper	 	upper endpoint of range of possible random numbers
		 * @param {Number} inclusive	decides if endpoins are included in range of possible random numbers
		 * -------------------------------------
		 * RETURNS: A psuedo-random number
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a)TO DO: Fix Functionality of inclusive
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */	
		public static function Random(r1:Number=1,r2:Number=0,inclusive:Boolean=true):Number {
    	  	var low:Number = Math.min(r1,r2);
    	  	var high:Number = Math.max(r1,r2);
    	    return low + Math.random() * (high - low);
	    }
	    
		/**
		 * DESCRIPTION: Returns a true random number by accessing random.org
		 * @id=RandomOrg
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} lower 		lower endpoing of range of possible random number
		 * @param {Number} upper	 	upper endpoint of range of possible random numbers
		 * @param {Number} inclusive	decides if endpoins are included in range of possible random numbers
		 * @param {Number} fallback	 	dedice to fall back on Random rather than throw an error Random retrival from internet fails
		 * -------------------------------------
		 * RETURNS: A random number
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a)TO DO - Still need to implement
		 * (b)Requires internet connection to use properly
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */	
		public static function RandomOrg(lower:Number=0,upper:Number=1,inclusive:Boolean=true,fallback:Boolean=true):Number{
			if(fallback){
				return Random(lower,upper,inclusive);
			}
			return 0;
		}	    
		
		
		/**
		 * DESCRIPTION: Jitters a number
		 * @id=Jitter
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Number} input 		number to be jittered
		 * @param {Number} magnitude 	second vector to be added
		 * -------------------------------------
		 * RETURNS: Changes a number by a small amount
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */		
		public static function Jitter(a:Number, magnitude:Number=0.1):Number{
			return a + (2*Math.random()-1)*magnitude;
		}
		
							/////////////////////////
					//////////////////////////////////////////////////		
				///////////////////////////////////////////////////////////////////////////
		/////////////////////////
		///////////////////////// PART II: REAL VECTORS
		/////////////////////////
				///////////////////////////////////////////////////////////////////////////		
					//////////////////////////////////////////////////		
							/////////////////////////		
		
		/////
		//////////
		///////////////
		//PART II
		//CHAPTER 1: Flat Vectors 
		//These are functions for manipulating vectors whose elements are know to be Real Numbers
		///////////////
		//////////
		/////

		/**
		 * DESCRIPTION: Adds two vectors component-wise
		 * @id=AddVector
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first vector to be added
		 * @param {Vector} beta 	second vector to be added
		 * -------------------------------------
		 * RETURNS: A vector that is the component-wise sum of two vectors
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(AddVector(new Vector(1,2,3), new Vector(3,2,1))); //Output: [3,3,3] 
		 * (b)trace(AddVector(new Vector(1,1,1,1,1), new Vector(4,5,6))); //Output: [5,6,7,1,1]
		 */
 		public static function AddVector(alpha:Vector, beta:Vector):Vector{
			return VectorUtils.Combine(alpha,beta,Add);
		}
		
		/**
		 * DESCRIPTION: Scales a vector by a given number
		 * @id=ScaleVector
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	vector to be scaled
		 * @param {*} scalar 		scalar with which to scale vector
		 * -------------------------------------
		 * RETURNS: A vector that is the original vector scaled by a scalar
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ScaleVector(new Vector(1,2,3),3)); //Output: [3,6,9] 
		 * (b)trace(ScaleVector(new Vector(1,1,1,1,1), 0)); //Output: [0,0,0,0,0]
		 */
		public static function ScaleVector(alpha:Vector,scalar:Number):Vector{
			return VectorUtils.Transform(alpha,function(x:Number):Number{return Multiply(scalar,x)});
		}
		
		/**
		 * DESCRIPTION: Negates a vector
		 * @id=Negative
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	vector to be scaled
		 * -------------------------------------
		 * RETURNS: A negated version of the original vector
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(Negative(new Vector(1,2,3)); //Output: [-1,-2,-3] 
		 * (b)trace(Negative(new Vector(-5))); //Output: [5]
		 */
		public static function NegativeVector(alpha:Vector):Vector{
			return ScaleVector(alpha,-1);
		}
		
		/**
		 * DESCRIPTION: Subtracts a vector from another
		 * @id=SubtractVector
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	Vector 
		 * @param {Vector} beta 	Vector to be subtracted from alpha
		 * -------------------------------------
		 * RETURNS: A Vector that is the difference of two vectors
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(SubtractVector(new Vector(1,2,3), new Vector(3,2,1))); //Output: [-2,0,2]
		 * (b)trace(SubtractVector(new Vector(4,5,6), new Vector(1,1,1,1,1))); //Output: [3,4,5,-1,-1]
		 */
		public static function SubtractVector(alpha:Vector, beta:Vector):Vector{
				return AddVector(alpha,NegativeVector(beta));
		}
		
		/**
		 * DESCRIPTION: Multiplies two vectors using the "Dot Procuct" (A.K.A. "Scalar Product") 
		 * @id=DotProduct
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first Vector to be multiplied 
		 * @param {Vector} beta 	second Vector to be multiplied
		 * -------------------------------------
		 * RETURNS: A Number that is the dot product of two given vectors
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(SubtractVector(new Vector(1,2,3), new Vector(3,2,1))); //Output: 3+4+3 = 10
		 * (b)trace(SubtractVector(new Vector(4,5,6), new Vector(1,1,1,1,1))); //Output: 4+5+6+0+0 = 15 
		 */
		public static function DotProduct(alpha:Vector,beta:Vector):Number{
			var collapsable:Vector = VectorUtils.Combine(alpha,beta,Multiply,0);
			return VectorUtils.Collapse(collapsable,Add);
		}
		
		/**
		 * DESCRIPTION: Multiplies two vectors using the "Cross Procuct" (A.K.A. "Vector Product", "Gibbs Product") 
		 * @id=CrossProduct
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first Vector to be multiplied 
		 * @param {Vector} beta 	second Vector to be multiplied
		 * -------------------------------------
		 * RETURNS: A Vector that is the cross product of two given vectors
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a) If Vectors have length greater than 3, then components beyond the third are ignored.  
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public static function CrossProduct(alpha:Vector,beta:Vector):Vector{
			var a0:Number=0; var a1:Number=0; var a2:Number=0;
			var b0:Number=0; var b1:Number=0; var b2:Number=0;
			
			if(alpha[0]){a0=alpha[0];}
			if(alpha[1]){a1=alpha[1];}
			if(alpha[2]){a2=alpha[3];}
			if(beta[0]){a0=beta[0];}
			if(beta[1]){a1=beta[1];}
			if(beta[2]){a2=beta[3];}			

			var i:Number = a1*b2 - a2*b1;
			var j:Number = a2*b0 - a0*b2;
			var k:Number = a0*b1 - a1*b0;
			return new Vector(i,j,k);
		}
		
		/**
		 * DESCRIPTION: Multiplies two vectors using the "Kronecker Procuct" 
		 * @id=KroneckerProduct
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first Vector to be multiplied 
		 * @param {Vector} beta 	second Vector to be multiplied
		 * -------------------------------------
		 * RETURNS: A Vector that is the kronecker product of two given vectors
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a) A kronecker product is actually a product of two matricies.
		 * This is somewhat analogous to that, but probably wouldn't be considered a true kronocker product. 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function KroneckerProduct(A:Vector, B:Vector):Vector{
			
			var kronecker:Vector = VectorUtils.ConstantVector(A.length);
			kronecker = VectorUtils.FillByIndex(kronecker,function(i:int):*{return ScaleVector(B,A[i]);})
			//return kronecker;
			return VectorUtils.FlattenSDLevels(kronecker,2);
		}			
		
		/**
		 * DESCRIPTION: Calculates the distance between two vectors 
		 * @id=DistanceVector
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first Vector
		 * @param {Vector} beta 	second Vector
		 * @param {Number} norm		(optional) number that determines the type of distance calculated 
		 * -------------------------------------
		 * RETURNS: A number that is the distance between two vectors
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * (a) The default norm is 2, which causes the function to return the standard "Euclidean Distance"
		 * (b) Use norm = 1 for the "Taxi-Cab Norm Distance" or "Manhattan Norm Distance"
		 * (c) Use norm = 0 for the "Infinity Norm Distance"
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function DistanceVector(alpha:Vector,beta:Vector,norm:Number=2):Number{
			return PNorm(SubtractVector(alpha,beta), norm);
		}
		
		/**
		 * DESCRIPTION: Calculates the p-norm of a given Vector
		 * @id=PNorm
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha	Vector
		 * @param {Number} norm		(optional) Number that determines the type of norm calculated 
		 * -------------------------------------
		 * RETURNS: A number that p-norm of a given Vector
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * (a) The default norm is 2, which causes the function to return the standard "Euclidean" Norm
		 * (b) Use norm = 1 for the "Taxi-Cab Norm" or "Manhattan Norm"
		 * (c) Use norm = 0 for the "Infinity Norm"
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function PNorm(alpha:Vector, norm:Number=2):Number{
			if(norm == 0){
				return Maximum(VectorUtils.Transform(alpha,Math.abs));
			}
			var summable:Vector =  VectorUtils.Transform(alpha,function(x:Number):Number{
				return Math.pow(Math.abs(x),norm);
			});
			
			return Math.pow(Sum(summable),1/norm);
		}

		/**
		 * DESCRIPTION: Calculates the magnitude of a given Vector
		 * @id=MagnitudeVector
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha	Vector
		 * -------------------------------------
		 * RETURNS: A Number that is the magnitude of a given Vector.
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * (a) The default norm is 2, which causes the function to return the standard "Euclidean" Norm
		 * (b) Use norm = 1 for the "Taxi-Cab Norm" or "Manhattan Norm"
		 * (c) Use norm = 0 for the "Infinity Norm"
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function MagnitudeVector(alpha:Vector):Number{
			return PNorm(alpha, 2);
		}
		
		/**
		 * DESCRIPTION: Calculates the angle between two Vectors
		 * @id=AngleBetween
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha	Vector
		 * -------------------------------------
		 * RETURNS: A Number that is the magnitude of a given Vector.
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * (a) The default norm is 2, which causes the function to return the standard "Euclidean" Norm
		 * (b) Use norm = 1 for the "Taxi-Cab Norm" or "Manhattan Norm"
		 * (c) Use norm = 0 for the "Infinity Norm"
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function AngleBetween(alpha:Vector,beta:Vector):Number{
			return Math.acos(DotProduct(alpha,beta)/(MagnitudeVector(alpha)*MagnitudeVector(beta)));
		}
		
		/////
		//////////
		///////////////
		//PART II: Vectors
		//Section 2 : Matricies 
		//These are functions for manipulating Matricies whose elements are know to be Numbers
		///////////////
		//////////
		/////
			
		/**
		 * DESCRIPTION: Generates an identiy matrix
		 * @id=GenerateIdentity
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} height 	height of generated matrix
		 * @param {Vector} width	width of identity matrix
		 * -------------------------------------
		 * RETURNS: A matrix with 1s along it's main diagnoal and 0s everywhere else
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function GenerateIdentity(height:uint=1,width:uint=1):Vector{
			return VectorUtils.GenerateIdentity(height,width);
		}
		
		/**
		 * DESCRIPTION: Adds two matricies component-wise
		 * @id=AddMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first matrix to be added
		 * @param {Vector} beta 	second matrix to be added
		 * -------------------------------------
		 * RETURNS: A matrix that is the component-wise sum of two matricies
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function AddMatrix(alpha:Vector,beta:Vector):Vector{
			return VectorUtils.Combine(alpha,beta,AddVector);
		}
		
		/**
		 * DESCRIPTION: Scales a matrix by a given number
		 * @id=ScaleMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix to be scaled
		 * @param {*} scalar 		scalar with which to scale matrix
		 * -------------------------------------
		 * RETURNS: A matrix that is the original vector scaled by a scalar
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function ScaleMatrix(alpha:Vector,scalar:Number):Vector{
			return VectorUtils.TransformEndNodes(alpha,function(x:Number):Number{return scalar*x});
		}		
		
		/**
		 * DESCRIPTION: Negates a matrix
		 * @id=NegativeMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix to be scaled
		 * -------------------------------------
		 * RETURNS: A negated version of the original matrix
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function NegativeMatrix(alpha:Vector):Vector{
			return ScaleMatrix(alpha,-1);
		}
		
		/**
		 * DESCRIPTION: Subtracts a matrix from another
		 * @id=SubtractMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix 
		 * @param {Vector} beta 	matrix to be subtracted from alpha
		 * -------------------------------------
		 * RETURNS: A matrix that is the difference of two matricies
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function SubtractMatrix(alpha:Vector,beta:Vector):Vector{
			return AddMatrix(alpha,NegativeMatrix(beta));
		}

		/**
		 * DESCRIPTION: Scales a specific row of a matrix
		 * @id=ScaleRow
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix containing row to be scaled
		 * @param {uint} index 		index of row to be scaled
		 * @param {Number} scalar 	scalar with which to scale the given row
		 * -------------------------------------
		 * RETURNS: A matrix with a row that has been scaled
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function ScaleRow(alpha:Vector,index:uint=0,scalar:Number=1):Vector{
			var newM:Vector = alpha.clone();
			newM = VectorUtils.RowSet(newM, ScaleVector(newM[index],scalar),index);
			return newM;
		}
		
		/**
		 * DESCRIPTION: Scales a specific column of a matrix
		 * @id=ScaleColumn
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix containing column to be scaled
		 * @param {uint} index 		index of column to be scaled
		 * @param {Number} scalar 	scalar with which to scale the given column
		 * -------------------------------------
		 * RETURNS: A matrix with a row that has been scaled
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function ScaleColumn(alpha:Vector,index:uint=0,scalar:Number=1):Vector{
			return VectorUtils.Transpose(ScaleRow(alpha,index,scalar));
		}
		
		/**
		 * DESCRIPTION: Calculates the trace of a given matrix
		 * @id=Trace
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix whos trace is to be calculated
		 * -------------------------------------
		 * RETURNS: A number that is the trace of a given matrix
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a) By definition, only a square matrix has a trace, but this also calulates the "trace" of non-square matrices
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function Trace(alpha:Vector):Number{
			return VectorUtils.Collapse(VectorUtils.Diagnoal(alpha),function(a:Number,b:Number):Number{return a+b;})
		}		
		
		/**
		 * DESCRIPTION: Multiplies two matricies using the "Kronecker Procuct" 
		 * @id=KroneckerMatrixProduct
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first Vector to be multiplied 
		 * @param {Vector} beta 	second Vector to be multiplied
		 * -------------------------------------
		 * RETURNS: A matrix that is the kronecker product of two given matricies
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function KroneckerMatrixProduct(alpha:Vector, beta:Vector):Vector{
			var kronecker:Vector = VectorUtils.ConstantMatrix(VectorUtils.Height(alpha),VectorUtils.Width(alpha)); 
			kronecker = VectorUtils.FillMatrixByIndex(kronecker,function(i:int,j:int):*{return ScaleMatrix(beta,alpha[i][j]);})
			return VectorUtils.BreakBlock(kronecker);
		}		

		/**
		 * DESCRIPTION: Multiplies two matricies using the standard matrix product
		 * @id=MultiplyMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first matrix to be multiplied 
		 * @param {Vector} beta 	second matrix to be multiplied
		 * -------------------------------------
		 * RETURNS: A matrix that is the kronecker product of two given matricies
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a) The Height of the alpha should mathch the width of beta
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */		
		public static function MultiplyMatrix(alpha:Vector,beta:Vector):Vector{
			var kroneckerList:Vector = new Vector();
			for(var i:int = 0; i<VectorUtils.Width(alpha); i++){
				kroneckerList.push(KroneckerMatrixProduct(VectorUtils.GetColumn(alpha,i),VectorUtils.GetRow(beta,i)));
			}
			return VectorUtils.Collapse(kroneckerList,AddMatrix);
		}
		
		/**
		 * DESCRIPTION: Raises a matrix to a an integer power
		 * @id=PowerMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix to be raised to a power
		 * @param {int} power 		power to raise matrix to 
		 * -------------------------------------
		 * RETURNS: A matrix that is the given matrix raised to a given power
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:\
		 * (a) Matricies should be square 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */		
		public static function PowerMatrix(alpha:Vector,power:int=1):Vector{
			var powerList:Vector = new Vector();
			var newMatrix:Vector;
			
			if(power==0){
				return GenerateIdentity(VectorUtils.Height(alpha),VectorUtils.Width(alpha));
			}else if(power>0){
				newMatrix = alpha.clone();
			}else{
				newMatrix = InvertMatrix(alpha);
			}
			for(var i:uint = 0; i<power; i++){
				powerList.newMatrix(alpha.clone());
			}

			return VectorUtils.Collapse(powerList,MultiplyMatrix);
		}

		/**
		 * DESCRIPTION: Calculates the Determinant of a given matrix
		 * @id=Determinant
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix whose determinant is to be calculated
		 * -------------------------------------
		 * RETURNS: The the determinant of a given matrix
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * (a) If a non-square matrix is passed, 0 is automatically returned as it's Determinant
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */		
		public static function Determinant(alpha:Vector):Number{
			if(VectorUtils.Width(alpha) != VectorUtils.Height(alpha)) return 0;
			
			
			if(VectorUtils.Width(alpha) < 2) return alpha[0][0];

			//These functions should be changed for optimization
			function UseRow():Boolean{return true;}
			function WhichRowCol():int{return 0;}			
			
			var useRow:Boolean = UseRow();
			var whichRowCol:int = WhichRowCol();
			var i:int = 0;
			var tempMatrix:Vector;
			var detList:Vector = new Vector();			
			var signedMatrix:Vector = VectorUtils.FillByIndex(alpha,function(i:int,j:int):*{return ((i+j) % 2 == 0)? alpha[i][j]:(-alpha[i][j]);})
			if(useRow){
				for(i = 0; i < VectorUtils.Width(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,whichRowCol),i);
					detList.push(signedMatrix[whichRowCol][i]*Determinant(tempMatrix));
				}
			}else{
			for(i= 0; i < VectorUtils.Height(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,i),whichRowCol)
					detList.push(signedMatrix[whichRowCol][i]*Determinant(tempMatrix));

				}
			}
			return VectorUtils.Collapse(detList,function(a:Number,b:Number):Number{return a+b;});
		}

		/**
		 * DESCRIPTION: Calculates the Permanent of a given matrix
		 * @id=Permanent
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix whose permanent is to be calculated
		 * -------------------------------------
		 * RETURNS: The the permanent of a given matrix
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */	
		public static function Permanent(alpha:Vector):Number{
			

			
			
			if(VectorUtils.Width(alpha) < 2) return alpha[0][0];

			//These functions should be changed for optimization
			function UseRow():Boolean{return true;}
			function WhichRowCol():int{return 0;}			
			
			var useRow:Boolean = UseRow();
			var whichRowCol:int = WhichRowCol();
			var i:int = 0;
			var tempMatrix:Vector;
			var detList:Vector = new Vector();			
			
			if(useRow){
				for(i = 0; i < VectorUtils.Width(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,whichRowCol),i);
					detList.push(alpha[whichRowCol][i]*Permanent(tempMatrix));
				}
			}else{
			for(i= 0; i < VectorUtils.Height(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,i),whichRowCol)
					detList.push(alpha[whichRowCol][i]*Permanent(tempMatrix));

				}
			}
			return VectorUtils.Collapse(detList,function(a:Number,b:Number):Number{return a+b;});
		}
				
		/**
		 * DESCRIPTION: Inverts a matrix
		 * @id=InvertMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix to be inverted
		 * -------------------------------------
		 * RETURNS: An inverted version of a given matrix
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a) If checkDeterminant is set to true and alpha is not invertable, then the function returns a matrix the same size as alpha, filled with 0s.
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */			
		public static function InvertMatrix(alpha:Vector,checkDeterminant:Boolean=true):Vector{
			if(checkDeterminant){
				if(Determinant(alpha)==0){
					return VectorUtils.ConstantMatrix(VectorUtils.Height(alpha),VectorUtils.Width(alpha),0)
				}
			}
						
			var i:int =0;
			var j:int = 0;
			var mat:Vector = alpha.clone();
			
			var identity:Vector = GenerateIdentity(VectorUtils.Height(alpha),VectorUtils.Width(alpha));

			
			

			var scalar:Number;

			for(i = 0; i < VectorUtils.Height(mat); i++){
				scalar = mat[i][i];

				mat = VectorUtils.RowSet(mat,ScaleMatrix(VectorUtils.GetRow(mat,i),1/scalar),i);
				identity = VectorUtils.RowSet(identity,ScaleMatrix(VectorUtils.GetRow(identity,i),1/scalar),i);
				for(j = VectorUtils.Height(mat)-1; j > i; j--){
					scalar = mat[j][i];	
					mat = VectorUtils.RowSet(mat,SubtractMatrix(VectorUtils.GetRow(mat,j),ScaleMatrix(VectorUtils.GetRow(mat,i),scalar)),j);
					identity = VectorUtils.RowSet(identity,SubtractMatrix(VectorUtils.GetRow(identity,j),ScaleMatrix(VectorUtils.GetRow(identity,i),scalar)),j);
				} 
			
			}
		
			for(i = VectorUtils.Height(mat) -1; i >0; i--){
				scalar = mat[i][i];
				mat = VectorUtils.RowSet(mat,ScaleMatrix(VectorUtils.GetRow(mat,i),1/scalar),i);
				identity = VectorUtils.RowSet(identity,ScaleMatrix(VectorUtils.GetRow(identity,i),1/scalar),i);
				
					for(j = 0; j < i; j++){
						scalar = mat[j][i];	
						mat = VectorUtils.RowSet(mat,SubtractMatrix(VectorUtils.GetRow(mat,j),ScaleMatrix(VectorUtils.GetRow(mat,i),scalar)),j);
						identity = VectorUtils.RowSet(identity,SubtractMatrix(VectorUtils.GetRow(identity,j),ScaleMatrix(VectorUtils.GetRow(identity,i),scalar)),j);
					} 
			}
	
			return identity;
		}					
		
		/////
		//////////
		///////////////
		//Part II : Vectors 
		//Chapter 3: Statistical Analysis
		///////////////
		//////////
		/////


		
		///////////////
		//II-3-1: Order Functions
		///////////////



		/**
		 * DESCRIPTION: Sorts a matrix
		 * @id=Sort
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		matrix to be sorted
		 * @param {Boolean} ascending	choice to sort ascending or decending
		 * -------------------------------------
		 * RETURNS: A sorted version of the passed vector
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */	
		public static function Sort(list:Vector,ascending:Boolean=true):Vector{
			if(ascending){
				return list.clone().sort();
			}
			return list.clone().sort(Array.DESCENDING | Array.NUMERIC);	
		}


		/**
		 * DESCRIPTION: Finds the minimum of a given list
		 * @id=Minimum
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: The smallest number in list
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */			
		public static function Minimum(list:Vector):Number{
			return Sort(list,true)[0];
		}
		
		
		/**
		 * DESCRIPTION: Finds the maximum of a given list
		 * @id=Maximum
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: The largest number in list
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */				
		public static function Maximum(list:Vector):Number{
			return Sort(list,false)[0];
		}		

		
		/**
		 * DESCRIPTION: Finds the nth percentile of a given list
		 * @id=Percentile
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * @param {Number} n            percentile index
		 * -------------------------------------
		 * RETURNS: A number under which n of the entire data set lies
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a) If the nth percentile would fall between two items, then it returns their average.
		 * (b) FIX: The above average should probably be weighted towards the closest, but it isn't. 
		 * (c) n should lie between 0 and 1
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */		
		public static function Percentile(list:Vector, n:Number):Number{

			var orderedList:Vector = Sort(list);
			var theIndex:Number = n*(orderedList.length+1);
			if(theIndex == Math.floor(theIndex)){
				return orderedList[theIndex - 1];
			}
			else {
				return (orderedList[Math.floor(theIndex-1)] + orderedList[Math.ceil(theIndex-1)])/2;
			}
		}

		/**
		 * DESCRIPTION: Finds the median of a given list (median is also know as the "second quartile)
		 * @id=Median
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: A number under which 50% of the data in a list falls when ordered
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a) If the median would fall between two items, then it returns their average.
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function Median(list:Vector):Number{
			return Percentile(list,.5);
		}
		
		/**
		 * DESCRIPTION: Finds the first quartile of a given list
		 * @id=Q1
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: A number under which 25% of the data in a list falls when ordered
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function Q1(list:Vector):Number{
			return Percentile(list,0.25);
		}

		/**
		 * DESCRIPTION: Finds the third quartile of a given list
		 * @id=Q3
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: A number under which 75% of the data in a list falls when ordered
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */		
		public static function Q3(list:Vector):Number{
			return Percentile(list,0.75);
		}		

		/**
		 * DESCRIPTION: Gives the Five Number Summary of given list.
		 * @id=FiveNumberSummary
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: A vector of length 5 containg the Five Number Summary of a given data set
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * (a) This would be useful for box and whisker plots. 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */				
		public static function FiveNumberSummary(list:Vector):Vector{
			var result:Vector = new Vector();
			result.push(Minimum(list));
			result.push(Q1(list));
			result.push(Median(list));
			result.push(Q3(list));
			result.push(Maximum(list));
			return result;
		}

		///////////////
		//II-3-2:Combinations
		//Various Mehtods of combining elements of a vector into a single number
		///////////////
		
		/**
		 * DESCRIPTION: Calculates the sum of elements in a list
		 * @id=Sum
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: A number that is equal to the sum of all of the elements in a list
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */	
		public static function Sum(list:Vector):Number{
			return VectorUtils.Collapse(list,function(a:Number,b:Number):Number{return a+b;});
		}	

		/**
		 * DESCRIPTION: Calculates the product of elements in a list
		 * @id=Product
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: A number that is equal to the product of all of the elements in a list
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */	
		public static function Product(list:Vector):Number{
			return VectorUtils.Collapse(list,function(a:Number,b:Number):Number{return a*b;});
		}
			

		/**
		 * DESCRIPTION: Calculates the Mean of elements in a list
		 * @id=Mean
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: A number that is equal to the mean of all of the elements in a list
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */	
		public static function Mean(list:Vector):Number{
			return Sum(list)/list.length;
		}
		
		/**
		 * DESCRIPTION: Calculates the variance of elements in a list
		 * @id=Variance
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: A number that is equal to the variance of all of the elements in a list
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */			
		public static function Variance(list:Vector):Number{
			if (list.length <2) return Number.NaN;
			var theMean:Number = Mean(list);
			var theSum:Number = 0;
			for(var i:uint = 0; i<list.length; i++)
			{
				theSum +=Math.pow(list[i]- theMean,2); 
			}
			return 1/(list.length)*theSum;
		}		
		
		/**
		 * DESCRIPTION: Calculates the standard deviation of elements in a list
		 * @id=StandardDeviation
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 		list
		 * -------------------------------------
		 * RETURNS: A number that is equal to the standard deviation of all of the elements in a list
		 * @return {Number}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(StandardDeviation(new Vector(1,2,3,4,5));//Output: 1.5811388300841898
		 * (b)trace(StandardDeviation(new Vector(-1,0,1)));//Output: 1
		 * (c)trace(StandardDeviation(new Vector(0,0)));//Output: 0
		 */		
		public static function StandardDeviation(list:Vector):Number{
			return Math.sqrt(Variance(list))
		}		
		
		
		///////////////
		//II-3-3:Transformations
		//
		///////////////
		
		/**
		 * DESCRIPTION: Replaces items in a list with their normal probabilities
		 * @id=NormalProbabilityList
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 							list
		 * @param {Number} negativeInfinityApproximation	(optional) number used to approximate negative infinity in integration
		 * @param {Number} integrationInterval				(optional) number used for the interval in integration.
		 * -------------------------------------
		 * RETURNS: A list populated by normal probabilities
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a)negativeInfinityApproximation must be less than all numbers in the list.
		 * The smaller the number, the more accurate it the approximation will be.
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */	
		public static function NormalProbabilityList(list:Vector,negativeInfinityApproximation:Number=-5,integrationInterval:Number=0.0001):Vector{
			var m:Number = Mean(list);
			var sd:Number = StandardDeviation(list);
			return VectorUtils.Transform(list,function(x:Number):Number{
				return NormalProbability(x,m,sd,negativeInfinityApproximation,integrationInterval);
				});
		}	
		
		/**
		 * DESCRIPTION: Replaces items in a list with their z scores
		 * @id=ZScoreList
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list 							list
		 * -------------------------------------
		 * RETURNS: A list populated by z scores
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)trace(ZScoreList(new Vector(1.2, 0, 2.5)));//Output: [-0.026659558398736474,-0.9864036607532466,1.0130632191519828]
		 * (b)trace(ZScoreList(new Vector(13.997, 23.5, 2.54674)));//Output: [0.061866684054656756,0.9676303189643287,-1.0294970030189854]
		 */	
		public static function ZScoreList(list:Vector):Vector{
			var m:Number = Mean(list);
			var sd:Number = StandardDeviation(list);
			return VectorUtils.Transform(list,function(x:Number):Number{
				return ZScore(x,m,sd);
				});
		}
		
		
		
		/**
		 * DESCRIPTION: Rounds items in a list
		 * @id=Rounded List
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list		list
		 * @param {int} precision	desired precision to round to	
		 * -------------------------------------
		 * RETURNS: A list populated by rounded values
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 *  EXAMPLES: 
		 * (a)trace(RoundedList(new Vector(1.2, 0, 2.5),0));//Output: [1,0,3]
		 * (b)trace(RoundedList(new Vector(13.997, 23.5, 2.54674),2));//Output: [14,23.5,2.55]
		 */			
		public static function RoundedList(list:Vector, precision:uint):Vector{
			return VectorUtils.Transform(list,function(x:Number):Number{
				return RoundTo(x,precision);
				});
		}
		
		/**
		 * DESCRIPTION: Jitters items in a list
		 * @id=JitteredList
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list		list
		 * @param {Number} magnitude	maximum magnitued to jitter values	
		 * -------------------------------------
		 * RETURNS: A list of values offset by random number
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)trace(JitteredList(new Vector(1.2, 0, 2.5),.001));//Possible Output: "1.1999044858757406,0.0003700800258666277,2.499508411079645" (or Similar)
		 * (b)trace(JitteredList(new Vector(13.997, 23.5, 2.54674),2));//Possible Output: "13.224550970390439,24.5888279825449,1.503880253856778" (or Similar)
		 */
		public static function JitteredList(list:Vector, magnitude:Number=0.1):Vector{
			return VectorUtils.Transform(list,function(x:Number):Number{
				return Jitter(x,magnitude);
				});
		}		
		
		///////////////
		//II-3-4:Outliers
		//
		///////////////
		
		
		/**
		 * DESCRIPTION: Determines if an value is an outlier of a list
		 * @id=IsOutlier
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list			list
		 * @param {Number} value
		 * @param {Number} distance		distance from inner quartile range that is used to determine an outlier
		 * -------------------------------------
		 * RETURNS: A boolean value telling whether or not a value is an outlier
		 * @return {Boolean}
		 * -------------------------------------
		 * NOTES:
		 * (a) distance should be greater than 1.
		 * (b) generally 1.5 is considered standard for distance, but 3 is often use to itentify extreme outliers
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)
		 */			
		public static function IsOutlier(list:Vector,value:Number,distance:Number=1.5):Boolean{
			
			var range:Number = distance*InterQuartileRange(list);
			if(value  < Q1(list)-range || value > Q3(list)+range) return true;
			return false;
		}		
		

		/**
		 * DESCRIPTION: Calculates the inter quartile range of a given list
		 * @id=InterQuartileRange
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list			list
		 * -------------------------------------
		 * RETURNS: Number equal to the inter quartile range of a given list
		 * @return {Boolean}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)
		 */	
		public static function InterQuartileRange(list:Vector):Number{
				return Q3(list) - Q1(list);
		}	
		
		/**
		 * DESCRIPTION: Collects outliers of a list 
		 * @id=Outliers
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list			list
		 * -------------------------------------
		 * RETURNS: A vector containing all of the outliers of a given list
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)
		 */	
		public static function Outliers(list:Vector,distance:Number=1.5):Vector{
			return VectorUtils.Filter(list, function(x:Number):Boolean{
				return IsOutlier(list,x,distance);
			});
		}

		/**
		 * DESCRIPTION: Filters Outliers from a list
		 * @id=OutliersRemoved
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} list			list
		 * -------------------------------------
		 * RETURNS: A vector containing all of the non-outliers of a given list
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)
		 */		
		public static function OutliersRemoved(list:Vector,distance:Number=1.5):Array{
			return VectorUtils.Filter(list, function(x:Number):Boolean{
				return !IsOutlier(list,x,distance);
			});
		}


		///////////////
		//II-3-5:Dual Variable Analysis
		//
		///////////////
		/**
		 * DESCRIPTION: Calculates the Correlation between two vectors 
		 * @id=Correlation
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} x			list
		 * @param {Vector} y			list
		 * -------------------------------------
		 * RETURNS: A number that is the correlation between x and y
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)
		 */	
		public static function Correlation(x:Vector,y:Vector):Number{
			if (x.length <2) return Number.NaN;
			var xMean:Number = Mean(x);
			var yMean:Number = Mean(y);
			var xSD:Number = StandardDeviation(x);
			var ySD:Number = StandardDeviation(y);
			var theSum:Number = 0;
			for(var i:uint = 0; i<x.length; i++)
			{
				theSum +=((x[i]-xMean)/xSD)*((y[i]-yMean)/ySD);
			}
			return 1/(x.length-1)*theSum;
		}	

		/**
		 * DESCRIPTION: Calculates the slope of the linear regression formed by lists x and y. 
		 * @id=Outliers
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} x			list
		 * @param {Vector} y			list
		 * -------------------------------------
		 * RETURNS: A number that is slope of the linear regression formed by lists x and y.
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)
		 */
		public static function LinRegSlope(x:Vector,y:Vector):Number{
		
			return Correlation(x,y)*StandardDeviation(y)/StandardDeviation(x);
		}

		/**
		 * DESCRIPTION: Calculates the y-intercept of the linear regression formed by lists x and y. 
		 * @id=Outliers
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} x			list
		 * @param {Vector} y			list
		 * -------------------------------------
		 * RETURNS: A number that is y-intercept of the linear regression formed by lists x and y.
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)
		 */
		public static function LinRegIntercept(x:Vector,y:Vector):Number{
		
			return Mean(y) - LinRegSlope(x,y) * Mean(x);
		}

		/**
		 * DESCRIPTION: Calculates the linear regression formed by lists x and y. 
		 * @id=Outliers
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} x			list
		 * @param {Vector} y			list
		 * -------------------------------------
		 * RETURNS: A vector that contains the slope and y-intercept of the linear regression formed by lists x and y.
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * (a) y = mx+b => y = LinearRegression(x,y)[0]*x + LinearRegression(x,y)[1]
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)
		 */
		public static function LinearRegression(x:Vector,y:Vector):Vector{
			return new Vector(LinRegSlope(x,y), LinRegIntercept(x,y));
		}
		
		/**
		 * DESCRIPTION: Creates a linear regression function from lists x and y. 
		 * @id=Outliers
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} x			list
		 * @param {Vector} y			list
		 * -------------------------------------
		 * RETURNS: A function that is the lnear regression of lists x and y
		 * @return {Object}
		 * -------------------------------------
		 * NOTES:
		 * (a) f(a) = ma+b <=> LinearRegressionFunction(x,y)(a) = LinRegSlope(x,y)*a + LinRegIntercept(x,y)
		 * -------------------------------------
		 * EXAMPLES: 
		 * (a)
		 */		
		public static function LinearRegressionFunction(x:Vector,y:Vector):Object{
			return function(a:Number):Number{
				return LinRegSlope(x,y)*a + LinRegIntercept(x,y);
				};
		}
							/////////////////////////
					//////////////////////////////////////////////////		
				///////////////////////////////////////////////////////////////////////////
		/////////////////////////
		///////////////////////// PART IV: Generic Combinations
		/////////////////////////
				///////////////////////////////////////////////////////////////////////////		
					//////////////////////////////////////////////////		
							/////////////////////////
							
		public static function AddGeneric(x:*=0,y:*=0):*{
			
			if(Type.GetType(x) == Type.NUMBER && Type.GetType(y) == Type.NUMBER){
				return Add(x,y);
			}
			
			if(Type.GetType(x) == Type.MATRIX && Type.GetType(y) == Type.MATRIX){
				return AddMatrix(x,y);
			}
			
			if(Type.GetType(x) == Type.VECTOR && Type.GetType(y) == Type.VECTOR){
				return AddVector(x,y);
			}
			return null;
		}
		
		public static function SubtractGeneric(x:*=0,y:*=0):*{
			
			if(Type.GetType(x) == Type.NUMBER && Type.GetType(y) == Type.NUMBER){
				return Subtract(x,y);
			}
			
			if(Type.GetType(x) == Type.MATRIX && Type.GetType(y) == Type.MATRIX){
				return SubtractMatrix(x,y);
			}
			
			if(Type.GetType(x) == Type.VECTOR && Type.GetType(y) == Type.VECTOR){
				return SubtractVector(x,y);
			}
			return null;
		}		
		
	
		public static function MultiplyGeneric(x:*=0,y:*=0):*{

			
			if(Type.GetType(x) == Type.NUMBER && Type.GetType(y) == Type.NUMBER){
				return Multiply(x,y);
			}
			
			if(Type.GetType(x) == Type.NUMBER && Type.GetType(y) == Type.MATRIX){
				return ScaleMatrix(y,x);
			}
			
			if(Type.GetType(x) == Type.MATRIX && Type.GetType(y) == Type.NUMBER){
				return ScaleMatrix(x,y);
			}			
			
			if(Type.GetType(x) == Type.NUMBER && Type.GetType(y) == Type.VECTOR){
				return ScaleVector(y,x);
			}
			
			if(Type.GetType(x) == Type.VECTOR && Type.GetType(y) == Type.NUMBER){
				return ScaleVector(x,y);
			}
			
			if(Type.GetType(x) == Type.MATRIX && Type.GetType(y) == Type.MATRIX){
				return MultiplyMatrix(x,y);
			}
			
			return null;
		}	
	
	
								
							
								    
	    
	}
}