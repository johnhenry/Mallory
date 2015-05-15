package com.google.code.p.Mallory
{
	
	import mx.formatters.NumberFormatter;	
	public class ComplexMath
	{
		
		
							/////////////////////////
					//////////////////////////////////////////////////		
				///////////////////////////////////////////////////////////////////////////
		/////////////////////////
		///////////////////////// PART I: COMPLEX SCALARS
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
			
		
		public static const Zero:ComplexNumber = new ComplexNumber(0,0);
		public static const One:ComplexNumber = new ComplexNumber(1,0);
		public static const I:ComplexNumber = new ComplexNumber(0,1);
		public static const E:ComplexNumber = new ComplexNumber(2.71828183,0);
		public static const PI:ComplexNumber = new ComplexNumber(3.14159,0);
		public static const PHI:ComplexNumber = new ComplexNumber(1.61803399,0);
		public static const NaCN:ComplexNumber = new ComplexNumber(Number.NaN,Number.NaN);
		
		//8 Infinities!!!
		public static const PositiveInfinity:ComplexNumber = new ComplexNumber(Number.POSITIVE_INFINITY,0);		
		public static const InfinityQ1:ComplexNumber = new ComplexNumber(Number.POSITIVE_INFINITY,Number.POSITIVE_INFINITY);
		public static const PositiveInfinityI:ComplexNumber = new ComplexNumber(0,Number.POSITIVE_INFINITY);		
		public static const InfinityQ2:ComplexNumber = new ComplexNumber(Number.NEGATIVE_INFINITY,Number.POSITIVE_INFINITY);		
		public static const NegativeInfinity:ComplexNumber = new ComplexNumber(Number.NEGATIVE_INFINITY,0);		
		public static const InfinityQ3:ComplexNumber = new ComplexNumber(Number.NEGATIVE_INFINITY,Number.NEGATIVE_INFINITY);		
		public static const NegativeInfinityI:ComplexNumber = new ComplexNumber(0,Number.NEGATIVE_INFINITY);		
		public static const InfinityQ4:ComplexNumber = new ComplexNumber(Number.POSITIVE_INFINITY,Number.NEGATIVE_INFINITY);		
		
				
		
		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 1: Unary Functions 
		//
		///////////////
		//////////
		/////
		
		
		
		/**
		 * DESCRIPTION: Negates a complex number
		 * @id=Negative
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a) trace(ComplexMath.Negative(3)); //Outputs: -3
		 * (b) trace(ComplexMath.Negative("1+2*i")); //Outputs: -1-2*i
		 */
		public static function Negative(alpha:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			return new ComplexNumber(-1*alpha.value, -1*alpha.iValue);
		}
		/**
		 * DESCRIPTION: Negates a complex number
		 * @id=Reciprocal
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)ComplexMath.Reciprocal(4); //Outputs: 0.25
		 * (b)ComplexMath.Reciprocal(1); //Outputs: 1	
		 */
		public static function Reciprocal(alpha:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			if(alpha.value ==0 && alpha.iValue ==0){
				return ComplexNumber.NaCN;
			}
				
			return new ComplexNumber(alpha.value/(alpha.value*alpha.value+alpha.iValue*alpha.iValue), (-1*alpha.iValue)/(alpha.value*alpha.value+alpha.iValue*alpha.iValue));
		}		
		
		/**
		 * DESCRIPTION:
		 * @id=Conjugate
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)ComplexMath.Conjugate("1 + 1*i") //Outputs: 1 - i
		 * (b)ComplexMath.Conjugate(6); //Outputs: 6
		 * (c)ComplexMath.Conjugate("-3*i"); //Outputs: 3*i
		 */		
		public static function Conjugate(alpha:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			return new ComplexNumber(alpha.value, -1*alpha.iValue);
		}
		
		/**
		 * DESCRIPTION: Flips a complex numbers real and imaginary values
		 * @id=Flip
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a) The Complex number a+b*i becomes b+a*i
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)ComplexMath.Flip("3+9*i"); //Outputs: 9+3*i;
		 * (b)ComplexMath.Flip(7); //Outputs: 7i;
		 * 
		 */		
		public static function Flip(alpha:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			return new ComplexNumber(alpha.iValue, alpha.value);
		}				
		
		/**
		 * DESCRIPTION: Returns the magnitued of a complex number
		 * @id=Magnitude
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)ComplexMath.Magnitude("1 + 1*i"); //Outputs: 1.4142135623730951
		 * (b)ComplexMath.Magnitude("3 + 4*i"); //Outputs: 5 
		 * 
		 */		
		public static function Magnitude(alpha:*):Number{
			alpha = new ComplexNumber(alpha);
			return Math.sqrt(alpha.value*alpha.value+alpha.iValue*alpha.iValue);
		}

		/**
		 * DESCRIPTION:Returns the angle A.K.A. argument of a given complex number
		 * @id=Angle
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Angle("1+i")); //Outputs: 0.785398163
		 * (b)trace(ComplexMath.Angle(-1)); //Outputs: 1.57079633
		 */		
		public static function Angle(alpha:*):Number{
			alpha = new ComplexNumber(alpha);
			return Math.atan2(alpha.iValue, alpha.value);
		}
		public static var Argument:Object = Angle;

		/**
		 * DESCRIPTION:Rreturns the real part of a given complex number
		 * @id=Real
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Real(4));// Outputs 4
		 * (b)trace(ComplexMath.Real("5+8*i")); //Outputs: 5
		 * (c)trace(ComplexMath.Real("6*i")); //Outputs: 0	
		 */
		public static function Real(alpha:*):Number{
			alpha = new ComplexNumber(alpha);
			return alpha.value;
		}
		
		/**
		 * DESCRIPTION:Returns the imaginary part of a given complex number
		 * @id=Imaginary
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Real(4); //Outputs: 4
		 * (b)trace(ComplexMath.Real("5+8*i")); //Outputs: 8
		 * (c) trace(ComplexMath.Real("6*i")); //Outputs: 6
		 */		

		public static function Imaginary(alpha:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			return new ComplexNumber(alpha.iValue);
		}	
		

		/**
		 * DESCRIPTION: Returns a complex number 
		 * @id=Identity
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a) Rounds the number based on RealMath.Identity
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Identity("4.623+5.8*i")); //Outputs: 4.623+5.8i
		 * (b)trace(ComplexMath.Identity("9.99999999999999999999999 + 9.99999999999999999999999*i")); //Outputs: 10+10*i  
		 * 
		 */
		public static function Identity(alpha:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			return new ComplexNumber(RealMath.Identity(alpha.value), RealMath.Identity(alpha.iValue))
			//return alpha;
		}
		
		
		/////
		//////////
		///////////////
		//PART I
		//CHAPTER 2: Comparisons Functions
		//These functions help to compare complex numbers
		///////////////
		//////////
		/////
		

		/**
		 * DESCRIPTION: Determines if two complex number are equal
		 * @id=Equal
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Equal(1,0)); //Outputs: false
		 * (b)trace(ComplexMath.Equal(7,7)); //Outputs: true 
		 */		
		public static function Equal(alpha:*,beta:*):Boolean {
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			return (alpha.value == beta.value && alpha.iValue == beta.iValue);
		}

		/**
		 * DESCRIPTION: Leographically Compares two complex numbers
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a)Can be used as a sorting function
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.LexCompare(1,0)); //Outputs: 1
		 * (b)trace(ComplexMath.LexCompare(3,3)); //Outputs: 0
		 * (c)trace(ComplexMath.LexCompare(1,3)); //Outputs: -1
		 * (d)trace(ComplexMath.LexCompare("1+2*i","1+3*i")); //Outputs: -1
		 */		
		public static function LexCompare(alpha:*,beta:*):int {
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);			
			
			if (alpha.value>beta.value) {
				return 1;
			} else if (alpha.value<beta.value) {
				return -1;
			} else {
				if (alpha.iValue>beta.iValue) {
					return 1;
				} else if (alpha.iValue<beta.iValue) {
					return -1;
				} 
				}
					
			return 0;
		}

		/**
		 * DESCRIPTION:Tells if a complex number is Lexigraphically less than another
		 * @id=LexLessThan
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a)Use !LexLessThan in place of "Greater Than or Equal To"
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.LexLessThan(1,2)); //Outputs: true
		 * (b)trace(ComplexMath.LexLessThan(5+6*i,5+6*i)); //Outputs: false
		 * (c)trace(ComplexMath.LexLessThat(3,2)); //Outputs: false
		 */
		public static function LexLessThan(alpha:*, beta:*):Boolean{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			return LexCompare(alpha,beta) == -1;
		}

		/**
		 * DESCRIPTION:Tells if a complex number is Lexigraphically greater than another
		 * @id=LexGreaterThan
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a)Use !LexGreaterThan in place of "Less Than or Equal To"
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.LexGreaterThan(2,1)); //Outputs: true
		 * (b)trace(ComplexMath.LexGreaterThan(5,5)); //Outputs: false
		 * (c)trace(ComplexMath.LexGreaterThat(3+2i,3+6i)); //Outputs: false
		 */				
		public static function LexGreaterThan(alpha:*, beta:*):Boolean{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			return LexCompare(alpha,beta) == 1;
		}

		/**
		 * DESCRIPTION: Finds the Lexigraphically Larger of two numbers
		 * @id=LexMaximum
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a) Returns the first if they are equal
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.LexMaximum("3+4*i", "3+4*i")); //Outputs: 3+4*i
		 * (b)trace(ComplexMath.LexMaximum(3,5)); //Outputs: 5 
		 * (c)trace(ComplexMath.LexMaximum(5, "5+1*i")); //Outputs: 5+i 
		 */		
		public static function LexMaximum(alpha:*, beta:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			if(LexCompare(alpha,beta) >= 0) return alpha;
			return beta;
		}

		/**
		 * DESCRIPTION:Finds the Lexigraphically Smaller of two numbers
		 * @id=LexMinimum
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a) Returns the second if they are equal
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.LexMinimum("3+4*i", "3+4*i")); //Outputs: 3+4i
		 * (b)trace(ComplexMath.LexMinimum(3,5)); //Outputs: 3
		 * (c)trace(ComplexMath.LexMinimum(5, "5+1*i")); //Outputs: 5 
		 */		
		public static function LexMinimum(alpha:*, beta:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			if(LexCompare(alpha,beta) <= 0) return beta;
			return alpha;
		}		
				
		/**
		 * DESCRIPTION:Compares two complex numbers by magnitude
		 * @id=MagCompare
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a)Can be used as a sorting function
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.MagCompare("3+4*i","4+3*i")); //Outputs: 0
		 * (b)trace(ComplexMath.MagCompare(3,3)); //Outputs: 0
		 * (c)trace(ComplexMath.MagCompare(1,3)); //Outputs: -1 
		 * (d)trace(ComplexMath.MagCompare("1+2*i","1+3*i")); //Outputs: -1	 
		 * (e)  
		 */
		public static function MagCompare(alpha:*,beta:*):int {
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);			
			
			if (Magnitude(alpha) > Magnitude(beta)) {
				return 1;
			} else if (Magnitude(alpha) < Magnitude(beta)) {
				return -1;
			}
					
			return 0;
		}		

		/**
		 * DESCRIPTION:Returns true if and only if two complex numbers have the same magnitude
		 * @id=MagEqual
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.MagEqual("3+4*i","4+3*i")); //Outputs: true
		 * (b)trace(ComplexMath.MagEqual("1+6*i","1+6*i")); //Outputs: true 
		 * (c)trace(ComplexMath.MagEqual("1+6*i", 8)); //Outputs: false 
		 */
		public static function MagEqual(alpha:*,beta:*):Boolean {
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);				
			return MagCompare(alpha,beta) == 0;
		}		
		
		
		/**
		 * DESCRIPTION:Tells if a complex number is less than another (by magnitued)
		 * @id=MagLessThan
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a)Use !MagGreaterThan in place of "Less Than or Equal To"
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.MagLessThan(1,2)); //Outputs: true
		 * (b)trace(ComplexMath.MagLessThan(5,5)); //Outputs: false 
		 * (c)trace(ComplexMath.MagLessThan(3+4*i,4+3*i)); //Outputs: false 
		 */	
	
		public static function MagLessThan(alpha:*, beta:*):Boolean{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			return MagCompare(alpha,beta) == -1;
		}

		/**
		 * DESCRIPTION:Tells if a complex number is greater than another (by magnitued)
		 * @id=MagGreaterThan
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a)Use !MagLessThan in place of "Greater Than or Equal To"
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.MagGreaterThan(1,3)); //Outputs: false
		 * (b)trace(ComplexMath.MagGreaterThan("3+0*i","1-1*i")); //Outputs: true 
		 * (c) 
		 */				
		public static function MagGreaterThan(alpha:*, beta:*):Boolean{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			return MagCompare(alpha,beta) == 1;
		}

		/**
		 * DESCRIPTION:Returns the Larger of two numbers (by magnitued)
		 * @id=MagMaximum
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a) Returns the first number if magnitudes are equal
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.MagMaximum("4+4*i", "4+5*i")); //Outputs: 4+5*i
		 * (b) trace(ComplexMath.MagMaximum("9+4*i", "4+5*i")); //Outputs: 9+4*i
		 * (c) 
		 */		
		public static function MagMaximum(alpha:*, beta:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			if(MagCompare(alpha,beta) >= 0) return alpha;
			return beta;
		}

		/**
		 * DESCRIPTION:Returns the Smaller of two numbers (by magnitued)
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a) Returns the second number if magnitudes are equal
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.MagMaximum("4+4i", "4+5i")); //Outputs: 4+4i
		 * (b)trace(ComplexMath.MagMaximum("9+4i", "4+5i")); //Outputs: 4+5i 
		 * (c) 
		 */		
		public static function MagMinimum(alpha:*, beta:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			if(MagCompare(alpha,beta) <= 0) return beta;
			return alpha;
		}		
		
		
		
		/**
		 * DESCRIPTION:Tells whether or not a complex number is strictly real
		 * @id=StrictlyReal
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.StrictlyReal(1)); //Outputs: true
		 * (b)trace(ComplexMath.StrictlyReal("1+0i")); //Outputs: true 
		 * (c)trace(ComplexMath.StrictlyReal("1+i")); //Outputs: false 
		 */		
		public static function StrictlyReal(alpha:*):Boolean{
			alpha = new ComplexNumber(alpha);
			return (alpha.value !=0 && alpha.iValue ==0);
		
		}

		/**
		 * DESCRIPTION:Tells whether or not a complex number is strictly imaginary
		 * @id=StrictlyImaginary
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.StrictlyReal("2*i")); //Outputs: true
		 * (b)trace(ComplexMath.StrictlyReal("1+0*i")); //Outputs: false 
		 * (c) trace(ComplexMath.StrictlyReal("1+1*i")); //Outputs: false
		 */	
		public static function StrictlyImaginary(alpha:*):Boolean{
			alpha = new ComplexNumber(alpha);
			
			return (alpha.value ==0 && alpha.iValue !=0);
		}

		/**
		 * DESCRIPTION:Tells whether or not a complex number is strictly complex
		 * @id=StrictlyComplex
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.StrictlyComplex("1*i")); //Outputs: false
		 * (b)trace(ComplexMath.StrictlyComplex("1+0*i")); //Outputs: false 
		 * (c)trace(ComplexMath.StrictlyReal("1+1*i")); //Outputs: true 
		 */	
		public static function StrictlyComplex(alpha:*):Boolean{
			alpha = new ComplexNumber(alpha);
		
			return (alpha.value !=0 && alpha.iValue !=0);
		
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
		

		/**
		 * DESCRIPTION:Adds two complex numbers
		 * @id=Add
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Add(1, "0+3*i")); //Outputs: 1+3*i
		 * (b)trace(ComplexMath.Add(4,4)); //Outputs: 8
		 * (c) 
		 */		
		public static function Add(alpha:*=0, beta:*=0):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);			
			
			return new ComplexNumber(alpha.value + beta.value, alpha.iValue + beta.iValue);
		}

	

		

		/**
		 * DESCRIPTION:Multiplies two complex numbers
		 * @id=Multiply
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Multiply(1, "0+3*i")); //Outputs: 1+3*i
		 * (b)trace(ComplexMath.Multiply(4,4)); //Outputs: 8 
		 * (c) 
		 */		
		public static function Multiply(alpha:*=1, beta:*=1):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			return new ComplexNumber(alpha.value*beta.value - alpha.iValue*beta.iValue, alpha.value*beta.iValue+alpha.iValue*beta.value);

		}
		
		/**
		 * DESCRIPTION:Subtracts two complex numbers
		 * @id=Subtract
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * (b) 
		 * (c) 
		 */		
		public static function Subtract(alpha:*=0, beta:*=0):ComplexNumber{

			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			return new ComplexNumber(alpha.value - beta.value, alpha.iValue - beta.iValue);
		}
		
		
		/**
		 * DESCRIPTION:Divides two complex numbers
		 * @id=Divide
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a)Handles 9 different cases for dividing by zero
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Divide(1, "0+3*i")); //Outputs: -0.333333333333333*i
		 * (b)trace(ComplexMath.Divide(4,4)); //Outputs: 1 
		 * (c) 
		 */
		public static function Divide(alpha:*=1, beta:*=1):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);
			
			//Handle Divide By Zero
			if(beta.value==0 && beta.iValue==0){
				if(alpha.value >0){
					if(alpha.ivalue == 0){
						return ComplexNumber.PositiveInfinity
					}
					if(alpha.ivalue > 0){
						return ComplexNumber.InfinityQ1
					}
					if(alpha.ivalue < 0){
						return ComplexNumber.InfinityQ4
					}										
				}
				if(alpha.value <0){
					if(alpha.ivalue == 0){
						return ComplexNumber.NegativeInfinity
					}
					if(alpha.ivalue > 0){
						return ComplexNumber.InfinityQ2
					}
					if(alpha.ivalue < 0){
						return ComplexNumber.InfinityQ3
					}										
				}				
				if(alpha.value ==0){
					if(alpha.ivalue == 0){
						return ComplexNumber.NaCN;						
					}
					if(alpha.ivalue > 0){
						return ComplexNumber.PositiveInfinityI
					}
					if(alpha.ivalue < 0){
						return ComplexNumber.NegativeInfinityI
					}										
				}				
			}
			
			return Multiply(alpha, Reciprocal(beta));
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
				

		/**
		 * DESCRIPTION: Raises a complex number to a complex power
		 * @id=Power
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Power(16,1/2,0)); //Outputs: 4
		 * (b)trace(ComplexMath.Power(16,1/2,1)); //Outputs: -4 
		 * (c)trace(ComplexMath.Power(16,1/2,2)); //Outputs: 4 
		 */		
		public static function Power(alpha:*, beta:*=1, selector:int=0):ComplexNumber {
			alpha = new ComplexNumber(alpha);
			beta = new ComplexNumber(beta);			
			var e:ComplexNumber = new ComplexNumber(Math.E,0);
			var newPow:ComplexNumber = ComplexMath.Multiply(beta, ComplexMath.SelectedNaturalLogarithm(alpha, selector));
			return ComplexMath.Power2(e, newPow);
		}
		private static function Power2(a:*, b:*):ComplexNumber {
			var alpha:ComplexNumber = new ComplexNumber(a);
			var beta:ComplexNumber = new ComplexNumber(b);
			if(Equal(alpha,ComplexMath.Zero) && !Equal(beta,ComplexMath.Zero)) return new ComplexNumber(0);
			
			
			var mag:Number = Magnitude(alpha);
			var ang:Number = Angle(alpha);
			var c:Number= beta.value;
			var d:Number = beta.iValue;
			var multiplier:Number = (Math.pow(mag, c))/(Math.pow(Math.E, d*ang));
			var cospart:Number = multiplier*Math.cos(d*Math.log(mag)+c*ang);
			var sinpart:Number = multiplier*Math.sin(d*Math.log(mag)+c*ang);
			return Identity(new ComplexNumber(cospart, sinpart));
			//return new ComplexNumber(RoundTo(cospart), RoundTo(sinpart));
		}
		

		/**
		 * DESCRIPTION:Returns the square of a given complex number
		 * @id=Square
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Square(0.5)); //Outputs: 0.25
		 * (b)trace(ComplexMath.Square("i")); //Outputs: -1 
		 * (c) 
		 */
		public static function Square(alpha:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);			
			return Power(alpha,2);
		}			
		
		
		/**
		 * DESCRIPTION:Returns "the" square root of a given complex number
		 * @id=SquareRoot
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.SquareRoot(1)); //Outputs: 1
		 * (b)trace(ComplexMath.SquareRoot(2)); //Outputs: 1.41421356 
		 * (c)  
		 */		
		public static function SquareRoot(alpha:*):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			return Power(alpha,0.5);
		}
	
		

		/**
		 * DESCRIPTION:Calculates the logarithm of complex number a number if one argument is passes
		 * @id=Logarithm 
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a)If Only a single ar
		 * (b)Use 0s as selcectors for the "common" logarithm
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(ComplexMath.Logarithm(Math.E)); //Outputs: 1
		 * (b)trace(ComplexMath.Logarithm(1)); //Outputs: 0 
		 * (c)trace(ComplexMath.Logarithm(4,4)); //Outputs: 1
		 * (d)trace(ComplexMath.Logarithm(4,2)); //Outputs: 1 
		 * (e)trace(ComplexMath.Logarithm(16, 2,0,0)); //Outputs: 4
		 * (f)trace(ComplexMath.Logarithm(Math.E, Math.E,2,2)); //Outputs: 1 
		 * (g)trace(ComplexMath.Logarithm("1*i", 2, 0,4)); //Outputs: 0.0624525+0.00172241*i
		 * (h)trace(ComplexMath.Logarithm("1*i", "3", 0,4)); //Outputs: 0.0623808+0.00272681*i	
		 */	
		public static function Logarithm(alpha:*,base:*=Math.E,selectA:int=0,selectB:int=0):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			base = new ComplexNumber(base);			
			return ComplexMath.Identity(ComplexMath.Divide(ComplexMath.SelectedNaturalLogarithm(alpha,selectA), ComplexMath.SelectedNaturalLogarithm(base,selectB)));
		}
		private static function SelectedNaturalLogarithm(alpha:*, selector:int=0):ComplexNumber{
			alpha = new ComplexNumber(alpha);
			var mag:Number = ComplexMath.Magnitude(alpha);
			var ang:Number = ComplexMath.Angle(alpha);
			return ComplexMath.Identity(new ComplexNumber(Math.log(mag),ang + 2*Math.PI*selector));

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
		
		//////////////////////////////
		//Section 5: Trigonometric and Hyperbolic Functions
		//////////////////////////////
		
		
		private static var Sin:Object = RealMath.Sine;
		private static var Cos:Object = RealMath.Cosine;
		private static var Tan:Object = RealMath.Tangent;
		private static var Csc:Object = RealMath.Cosecant;
		private static var Sec:Object = RealMath.Secant;
		private static var Cot:Object = RealMath.Cotangent;
	
		

		

		
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function Sine(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);
			return new ComplexNumber(RealMath.RoundTo(Math.sin(a.value)*HCos(a.iValue)), RealMath.RoundTo(Math.cos(a.value)*HSin(a.iValue)));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function Cosine(alpha:*) :ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return new ComplexNumber(RealMath.RoundTo(Math.cos(a.value)*HCos(a.iValue)), RealMath.RoundTo(-1*Math.sin(a.value)*HSin(a.iValue)));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function Tangent(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);		
			return Divide(Sine(a),Cosine(a));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function Cosecant(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);			
			return Reciprocal(Sine(a));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function Secant(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);			
			return Reciprocal(Cosine(a));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function Cotangent(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);			
			return Divide(Cosine(a), Sine(a));
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


		private static var HSin:Object = RealMath.HyperbolicSine;
		private static var HCos:Object = RealMath.HyperbolicCosine;
		private static function HTan(a:Number):Number {return HSin(a)/HCos(a);}
		private static function HCsc(a:Number):Number {return 1/HSin(a);}
		private static function HSec(a:Number):Number {return 1/HCos(a);}
		private static function HCot(a:Number):Number {return HCos(a)/HSin(a);}

		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function HyperbolicSine(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);
			return new ComplexNumber(RealMath.RoundTo(HSin(a.value)*Math.cos(a.iValue)), RealMath.RoundTo(HCos(a.value)*Math.sin(a.iValue)));
		}
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function HyperbolicCosine(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);
			return new ComplexNumber(RealMath.RoundTo(HCos(a.value)*Math.cos(a.iValue)), RealMath.RoundTo(HSin(a.value)*Math.sin(a.iValue)));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function HyperbolicTangent(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);
			return Divide(HyperbolicSine(a), HyperbolicCosine(a));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function HyperbolicCosecant(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);			
			return Reciprocal(HyperbolicSine(a));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function HyperbolicSecant(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);			
			return Reciprocal(HyperbolicCosine(a));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function HyperbolicCotangent(alpha:*):ComplexNumber {
			var a:ComplexNumber = new ComplexNumber(alpha);			
			return Divide(HyperbolicCosine(a), HyperbolicSine(a));
		}
		
		//////////
		//5-2-1 Inverse Trigonometric Functions
		//////////
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcSine(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return  Multiply(I.neg(),Logarithm(Add(Multiply(I,a),SquareRoot(Subtract(1, Square(a))))));
		
		}
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcCosine(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return  Multiply(I.neg(),Logarithm(Add(a,SquareRoot(Subtract(Square(a), 1)))));
		
		}
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcTangent(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return Multiply(Divide(I,2),Subtract(Logarithm(Subtract(1,Multiply(I,a))),Logarithm(Add(1,Multiply(I,a)))));

		}
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcSecant(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return ArcCosine(a.recip());
			
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcCosecant(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return ArcSine(a.recip());
			
		}		

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcCotangent(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return ArcTangent(a.recip());
			
		}		
		
		//////////
		//5-2-1 Inverse Hyperbolic Functions
		//////////
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcHyperbolicSine(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return  Logarithm(Add(a,SquareRoot(Add(Square(a),1))));
		
		}
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcHyperbolicCosine(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return  Logarithm(Add(a,SquareRoot(Subtract(Square(a),1))));
		
		}
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcHyperbolicTangent(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return Logarithm(Divide(SquareRoot(Subtract(1,Square(a))) , Subtract(1,a)));
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcHyperbolicSecant(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return Logarithm(Divide(Add(1,SquareRoot(Subtract(1,Square(a)))),a));
			
		}

		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcHyperbolicCosecant(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return Logarithm(Divide(Subtract(1,SquareRoot(Add(1,Square(a)))),a));
			
		}		
		
		/**
		 * DESCRIPTION:
		 * @id=
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
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
		public static function ArcHyperbolicCotangent(alpha:*):ComplexNumber{
			var a:ComplexNumber = new ComplexNumber(alpha);
			return Logarithm(Divide(SquareRoot(Subtract(Square(a),1)),Subtract(a,1)));
			
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
		public static function SumSeries(unaryOperation:Object,start:*=0,end:*=0):ComplexNumber {
			
			return Sum(VectorUtils.Transform(VectorUtils.ArithmeticSequence(start,end),unaryOperation));
		}
		public static function ProductSeries(unaryOperation:Object,start:*=0,end:*=0):ComplexNumber {

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
		public static function SolveN(unaryOperation:Object,target:Number,desiredAccuracy:*=0.01,guess:*=0):ComplexNumber{
			var difference:ComplexNumber = Subtract(unaryOperation(guess),target);
			if(!MagGreaterThan(difference,desiredAccuracy)){
				return guess;
			}
			return SolveN(unaryOperation,target,desiredAccuracy,Subtract(guess,difference));
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
		public static function IntegrateN(unaryOperation:Object,lowerLimit:*,upperLimit:*,interval:*=0.01):ComplexNumber{
			lowerLimit = new ComplexNumber(lowerLimit);
			upperLimit = new ComplexNumber(upperLimit);
			interval = new ComplexNumber(interval);
			
			
			if(!MagGreaterThan(interval,0)) return ComplexNumber.NaCN;
			var result:ComplexNumber = Zero;
				while(MagLessThan(lowerLimit,upperLimit)){
					result = Add(result, Divide(unaryOperation(Multiply(2, Add(lowerLimit,interval))),2));
					lowerLimit = Add(lowerLimit,interval);
	
				}
			return Multiply(interval,result);
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
		public static function DifferentiateN(unaryOperation:Object,point:*,limit:*=0.01):ComplexNumber{
			point = new ComplexNumber(point);
			limit = new ComplexNumber(limit);
			
			if(!MagGreaterThan(limit,0)) return ComplexNumber.NaCN;			
			
			return Divide(Add(unaryOperation(Add(point,limit)), unaryOperation(point)),limit)
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
		public static function ZScore(x:*,mean:*=0,sDev:*=1):ComplexNumber{
			x = new ComplexNumber(x);
			mean = new ComplexNumber(mean);
			sDev = new ComplexNumber(sDev);
			
			return Divide(Subtract(x,mean),sDev);
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
		public static function InvertZScore(z:*,mean:*=0,sDev:*=1):ComplexNumber{
			z = new ComplexNumber(z);
			mean = new ComplexNumber(mean);
			sDev = new ComplexNumber(sDev);
			
			return Add(Multiply(z,sDev),mean);
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
		public static function NormalDistribution(mean:*,sDev:*):Object{
			return function(x:*):ComplexNumber{
				return Reciprocal((Multiply(Multiply(sDev,Math.sqrt(2*Math.PI))) , Power(Math.E,Multiply(-0.5,Square(ZScore(x,mean,sDev))))));
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
		public static function StandardNormalDistribution(x:*):ComplexNumber{
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
		public static function NormalProbability(x:*,mean:*,sDev:*,negativeInfinityApproximation:*=-5,integrationInterval:*=0.0001):ComplexNumber{
			x = new ComplexNumber(x);
			mean = new ComplexNumber(mean);
			sDev = new ComplexNumber(sDev);
			negativeInfinityApproximation = new ComplexNumber(negativeInfinityApproximation);
			integrationInterval = new ComplexNumber(integrationInterval);
			
			
			
			
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
		public static function StandardNormalProbability(z:*,negativeInfinityApproximation:*=-5,interval:*=0.0001):ComplexNumber{
			z = new ComplexNumber(z);
			negativeInfinityApproximation = new ComplexNumber(negativeInfinityApproximation);
			interval = new ComplexNumber(interval);			
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
		public static function RoundTo(num:*,precision:uint=10):ComplexNumber {
			num = new ComplexNumber(num);
			var formatter:NumberFormatter = new NumberFormatter();
			formatter.precision = precision;
			formatter.rounding = "nearest";
			
			
			return new ComplexNumber( Number(formatter.format(num.value)),Number(formatter.format(num.iValue)) )
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
		public static function Random(r1:Number=1,r2:Number=0,i1:Number=1,i2:Number=0,inclusive:Boolean=true):ComplexNumber {
    	  	var low:Number = Math.min(r1,r2);
    	  	var high:Number = Math.max(r1,r2);
    	    var newR:Number = low + Math.random() * (high - low);
    	    
    	    var iLow:Number = Math.min(i1,i2);
    	    var iHigh:Number = Math.max(i1,i2);
    	    var newI:Number = iLow + Math.random() * (iHigh - iLow);
    	    
    	    return new ComplexNumber(newR,newI);
	    
	    
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
		public static function RandomOrg(lower:Number=0,upper:Number=1,inclusive:Boolean=true,fallback:Boolean=true):ComplexNumber{
			if(fallback){
				return Random(lower,upper,lower,upper,inclusive);
			}
			return Zero;
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
		public static function Jitter(a:*, magnitude:Number=0.1):ComplexNumber{
			a = new ComplexNumber(a);
			var newR:Number = a.value + (2*Math.random()-1)*magnitude;
			var newI:Number = a.iValue + (2*Math.random()-1)*magnitude;
			return new ComplexNumber(newR,newI);
		}













		
		
							/////////////////////////
					//////////////////////////////////////////////////		
				///////////////////////////////////////////////////////////////////////////
		/////////////////////////
		///////////////////////// PART II: Complex Vectors VECTORS
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
		public static function ScaleVector(alpha:Vector,scalar:*):Vector{
			scalar = new ComplexNumber(scalar);
			return VectorUtils.Transform(alpha,function(x:*):ComplexNumber{return Multiply(scalar,x)});
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
			var collapsable:Vector = VectorUtils.Combine(alpha,beta,Multiply,Zero);
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
			var a0:ComplexNumber=Zero; var a1:ComplexNumber=Zero; var a2:ComplexNumber=Zero;
			var b0:ComplexNumber=Zero; var b1:ComplexNumber=Zero; var b2:ComplexNumber=Zero;
			
			if(alpha[0]){a0=alpha[0];}
			if(alpha[1]){a1=alpha[1];}
			if(alpha[2]){a2=alpha[3];}
			if(beta[0]){a0=beta[0];}
			if(beta[1]){a1=beta[1];}
			if(beta[2]){a2=beta[3];}			

			var i:ComplexNumber = Subtract(Multiply(a1,b2) , Multiply(a2,b1));
			var j:ComplexNumber = Subtract(Multiply(a2,b0) , Multiply(a0,b2));
			var k:ComplexNumber = Subtract(Multiply(a0,b1) , Multiply(a1,b0));
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
		public static function DistanceVector(alpha:Vector,beta:Vector,norm:*=2):ComplexNumber{
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
		public static function PNorm(alpha:Vector, norm:*=2):ComplexNumber{
			norm = new ComplexNumber(norm);
			
			if(norm.value == 0){
				return Maximum(VectorUtils.Transform(alpha,Magnitude));
			}
			var summable:Vector =  VectorUtils.Transform(alpha,function(x:*):ComplexNumber{
				return Power(Magnitude(x),norm.value);
			});
			
			return Power(Sum(summable),1/norm.value);
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
		public static function MagnitudeVector(alpha:Vector):ComplexNumber{
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
		public static function AngleBetween(alpha:Vector,beta:Vector):ComplexNumber{
			return ArcCosine( Divide(DotProduct(alpha,beta),Multiply(MagnitudeVector(alpha),MagnitudeVector(beta))) );
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
		public static function GenerateIdentity(height:*=1,width:*=1):Vector{
			height = new ComplexNumber(height);
			width = new ComplexNumber(width);
			
			
			return VectorUtils.GenerateIdentity(height.value,width.value,One,Zero);
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
		public static function ScaleMatrix(alpha:Vector,scalar:*):Vector{
			return VectorUtils.TransformEndNodes(alpha,function(x:*):ComplexNumber{return Multiply(scalar,x)});
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
		public static function ScaleRow(alpha:Vector,index:uint=0,scalar:*=1):Vector{
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
		
		
		public static function ConjugateMatrix(m:Vector):Vector{
			return VectorUtils.FillMatrixByIndex(m,function(i:int,j:int):ComplexNumber{return Conjugate(m[i][j]);})
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
		public static function PowerMatrix(alpha:Vector,power:*=1):Vector{
			power = new ComplexNumber(power);
			var powerList:Vector = new Vector();
			var newMatrix:Vector;
			
			if(power==0){
				return GenerateIdentity(VectorUtils.Height(alpha),VectorUtils.Width(alpha));
			}else if(power>0){
				newMatrix = alpha.clone();
			}else{
				newMatrix = InvertMatrix(alpha);
			}
			for(var i:uint = 0; i<power.value; i++){
				powerList.newMatrix(alpha.clone());
			}

			return VectorUtils.Collapse(powerList,MultiplyMatrix);
		}

		
		/**
		 * DESCRIPTION: Calculates the Determinant of a given matrix
		 * @id=determinant
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
		public static function Determinant(alpha:Vector):ComplexNumber{
			if(VectorUtils.Width(alpha) != VectorUtils.Height(alpha)) return Zero;
			
			
			if(VectorUtils.Width(alpha) < 2) return alpha[0][0];

			//These functions should be changed for optimization
			function UseRow():Boolean{return true;}
			function WhichRowCol():int{return 0;}			
			
			var useRow:Boolean = UseRow();
			var whichRowCol:int = WhichRowCol();
			var i:int = 0;
			var tempMatrix:Vector;
			var detList:Vector = new Vector();			
			var signedMatrix:Vector = VectorUtils.FillByIndex(alpha,function(i:int,j:int):*{return ((i+j) % 2 == 0)? alpha[i][j]:Negative(alpha[i][j]);})
			if(useRow){
				for(i = 0; i < VectorUtils.Width(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,whichRowCol),i);
					detList.push(Multiply(signedMatrix[whichRowCol][i],Determinant(tempMatrix)));
				}
			}else{
			for(i= 0; i < VectorUtils.Height(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,i),whichRowCol)
					detList.push(Multiply(signedMatrix[whichRowCol][i],Determinant(tempMatrix)));

				}
			}
			return VectorUtils.Collapse(detList,Add);
		}

		/**
		 * DESCRIPTION: Calculates the Permanent of a given matrix
		 * @id=permanent
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
					detList.push(Multiply(alpha[whichRowCol][i],Permanent(tempMatrix)));
				}
			}else{
			for(i= 0; i < VectorUtils.Height(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,i),whichRowCol)
					detList.push(Multiply(alpha[whichRowCol][i],Permanent(tempMatrix)));

				}
			}
			return VectorUtils.Collapse(detList,function(a:Number,b:Number):Number{return a+b;});
		}
				
		/**
		 * DESCRIPTION: Inverts a matrix
		 * @id=invertMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix to be inverted
		 * -------------------------------------
		 * RETURNS: An inverted version of a given matrix
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a) If checkDeterminant is set to true and alpha is not invertable, then the function returns a matrix the same size as alpha, filled with zeross.
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */			
		public static function InvertMatrix(alpha:Vector,checkDeterminant:Boolean=true):Vector{
			if(checkDeterminant){
				if(Determinant(alpha)==Zero){
					return VectorUtils.ConstantMatrix(VectorUtils.Height(alpha),VectorUtils.Width(alpha),Zero)
				}
			}
						
			var i:int =0;
			var j:int = 0;
			var mat:Vector = alpha.clone();
			
			var identity:Vector = GenerateIdentity(VectorUtils.Height(alpha),VectorUtils.Width(alpha));

			
			

			var scalar:*;

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
		public static function Sort(list:Vector,sortLex:Boolean=true,ascending:Boolean=true):Vector{
			var sorted:Vector = list.clone();
		
			if(sortLex){
				sorted.sortOn(LexCompare);
			}else{
				sorted.sortOn(MagCompare);
			}
			
			if(!ascending){
				return sorted.reversed();	
			}
			
			
			return sorted;
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
		public static function Minimum(list:Vector):ComplexNumber{
			return Sort(list,true,true)[0];
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
		public static function Maximum(list:Vector):ComplexNumber{
			return Sort(list,true,false)[0]; 
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
		public static function Percentile(list:Vector, n:*):ComplexNumber{
			n = new ComplexNumber(n).value;
			
			var orderedList:Vector = Sort(list);
			var theIndex:Number = n*(orderedList.length+1);
			if(theIndex == Math.floor(theIndex)){
				return new ComplexNumber(orderedList[theIndex - 1]);
			}
			else {
				return Divide(Add(orderedList[Math.floor(theIndex-1)] , orderedList[Math.ceil(theIndex-1)])  ,2);
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
		public static function Median(list:Vector):ComplexNumber{
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
		public static function Q1(list:Vector):ComplexNumber{
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
		public static function Q3(list:Vector):ComplexNumber{
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
		public static function Sum(list:Vector):ComplexNumber{
			return VectorUtils.Collapse(list,function(a:*,b:*):ComplexNumber{return Add(a,b);});
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
		public static function Product(list:Vector):ComplexNumber{
			return VectorUtils.Collapse(list,function(a:*,b:*):ComplexNumber{return Multiply(a,b);});
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
		public static function Mean(list:Vector):ComplexNumber{
			return Divide(Sum(list),list.length);
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
		public static function Variance(list:Vector):ComplexNumber{
			if (list.length <2) return ComplexNumber.NaCN;
			var theMean:ComplexNumber = Mean(list);
			var theSum:ComplexNumber = Zero;
			for(var i:uint = 0; i<list.length; i++)
			{	
				theSum = Add(theSum,Square(Subtract(list[i],theMean)))

			}
			return Multiply(1/(list.length),theSum);
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
		public static function StandardDeviation(list:Vector):ComplexNumber{
			return SquareRoot(Variance(list));
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
		public static function NormalProbabilityList(list:Vector,negativeInfinityApproximation:*=-5,integrationInterval:*=0.0001):Vector{
			var m:ComplexNumber = Mean(list);
			var sd:ComplexNumber = StandardDeviation(list);
			negativeInfinityApproximation = new ComplexNumber(negativeInfinityApproximation);
			return VectorUtils.Transform(list,function(x:*):ComplexNumber{
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
			var m:ComplexNumber = Mean(list);
			var sd:ComplexNumber = StandardDeviation(list);
			return VectorUtils.Transform(list,function(x:ComplexNumber):ComplexNumber{
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
		public static function RoundedList(list:Vector, precision:*):Vector{
			precision = new ComplexNumber(precision).value
			return VectorUtils.Transform(list,function(x:*):ComplexNumber{
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
		public static function JitteredList(list:Vector, magnitude:*=0.1):Vector{
			magnitude = new ComplexNumber(magnitude).value
			return VectorUtils.Transform(list,function(x:*):ComplexNumber{
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
		public static function IsOutlier(list:Vector,value:*,distance:*=1.5):Boolean{
			value = new ComplexNumber(value);
			distance = new ComplexNumber(distance).value;
			
			var range:ComplexNumber = Multiply(distance,InterQuartileRange(list));
			if( LexLessThan(value  , Subtract(Q1(list),range)) || LexGreaterThan(value , Add(Q3(list),range))) return true;
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
		public static function InterQuartileRange(list:Vector):ComplexNumber{
				return Subtract(Q3(list) , Q1(list));
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
		public static function Outliers(list:Vector,distance:*=1.5):Vector{
			return VectorUtils.Filter(list, function(x:*):Boolean{
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
		public static function OutliersRemoved(list:Vector,distance:*=1.5):Array{
			return VectorUtils.Filter(list, function(x:*):Boolean{
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
		public static function Correlation(x:Vector,y:Vector):ComplexNumber{
			if (x.length <2) return ComplexNumber.NaCN;
			var xMean:ComplexNumber = Mean(x);
			var yMean:ComplexNumber = Mean(y);
			var xSD:ComplexNumber = StandardDeviation(x);
			var ySD:ComplexNumber = StandardDeviation(y);
			var theSum:ComplexNumber = Zero;
			for(var i:uint = 0; i<x.length; i++)
			{
				
				theSum = Add(theSum, Multiply(Divide(Subtract(x[i],xMean),xSD),Divide(Subtract(y[i],yMean),ySD))  )
			}
			return Multiply(1/(x.length-1),theSum);
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
		public static function LinRegSlope(x:Vector,y:Vector):ComplexNumber{
		
			return Multiply(Correlation(x,y),Divide(StandardDeviation(y),StandardDeviation(x)));
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
		public static function LinRegIntercept(x:Vector,y:Vector):ComplexNumber{
		
			return Subtract(Mean(y) , Multiply(LinRegSlope(x,y) , Mean(x)));
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
			return function(a:*):ComplexNumber{
				
				return Add( Multiply(LinRegSlope(x,y),a) , LinRegIntercept(x,y) );
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