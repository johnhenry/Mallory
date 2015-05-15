package com.google.code.p.Mallory
{
	public class IntegerMath
	{

		
		//////////////////////////////
		//Section 0:Constants
		//These are important constants
		//////////////////////////////
		
		public static const Zero:int = 0;
		public static const One:int = 1;
		public static const Infinity:int = int.MAX_VALUE;
		
		//////////////////////////////
		//Section 1:Comparison Functions
		//
		//////////////////////////////	
		
		public static function Compare(alpha:int, beta:int):int{
			if(alpha < beta) return -1;
			if(alpha > beta) return 1;
			return 0;
		}
		
		public static function LessThan(alpha:int, beta:int):Boolean{
			return Compare(alpha,beta) == -1;
		}
				
		public static function Equal(alpha:int, beta:int):Boolean{

			return Compare(alpha,beta) == 0;
		}
		public static function GreaterThan(alpha:int, beta:int):Boolean{

			return Compare(alpha,beta) == 1;
		}		
		
		public static function Amicable(alpha:int, beta:int):Boolean{
			return Equal(AddList(ProperFactors(alpha)),beta) && Equal(AddList(ProperFactors(beta)),alpha);
		}	
		
		
		//////////////////////////////
		//Section 2:Umary Functions Functions
		//These are important constants
		//////////////////////////////			
					
		public static function Wrap(alpha:*):int{
			if(alpha is ComplexNumber){
				return int(alpha.value);
			}
			if(ComplexNumber.IsComplex(alpha)) {
				return int(new ComplexNumber(alpha).value)
			};			

			return int(alpha);
		}
				
		public static function Negative(alpha:int):int{
		
			return -1*alpha;
		}
		
		public static function Reciprocal(alpha:int):int{
		
			if(alpha ==1) return One;
			return Zero;
		}		
		
		public static function Conjugate(alpha:int):int{
		
			return alpha;
		}
		
	
		public static function Magnitude(alpha:int):int{
			return  alpha;
		}
		
		public static function Angle(alpha:int):int{

			return Zero;
		}


		public static function Identity(alpha:int):int{
		
			return alpha;
		}


		
		//////////////////////////////
		//Section 3:Binary Functions
		//These are functions that take two numbers and return a third
		//////////////////////////////			
		
		//This function adds two complex numbers
		public static function Add(alpha:int, beta:int):int{
			return alpha + beta;
		}
		
		//This function adds an array of complex numbers
		public static function AddList(list:Array):int{
		
			if(list.length == 0) return Zero; 
			
			if(list.length == 1) return list[0];
			
			while(list.length >2){
				list[0] = Add(list[0],list[1]);
				list.splice(1,1)
			}
			
			return Add(list[0],list[1]);
				
		}
		//This function adds complex numbes iteratively
		public static function AddIteratively(...arguments):int {
			var i:int =  0;
			var sum:Number = Zero;


			while (i<arguments.length) {
				sum += arguments[i];
				i++;
			}
			return sum;
		}		
		
		//This function adds two complex numbers
		public static function Multiply(alpha:int, beta:int):int{
			return alpha *beta;

		}
		
		//This function adds an array of complex numbers
		public static function MultiplyList(list:Array):int{
		
			if(list.length == 0) return One; 
			
			if(list.length == 1) return list[0];
			
			while(list.length >2){
				list[0] = Multiply(list[0],list[1]);
				list.splice(1,1)
			}
			
			return Multiply(list[0],list[1]);
				
		}
		//This function multiplies complex numbes recursively with the use of a helper function MultHelp
		public static function MultiplyIteratively(...arguments):int {
			var i:int =  0;
			var product:Number = One;


			while (i<arguments.length) {
				product *= arguments[i];
				i++;
			}
			return product;

		}
		
		//This function subtracts two complex numbers
		public static function Subtract(alpha:int, beta:int):int{
			return alpha - beta;
		}
		
		//This function divides two complex numbers
		public static function Divide(alpha:int, beta:int):int{
			return alpha / beta;
		}
		
		public static function Modulus(alpha:int, beta:uint):int{
			if(alpha >= beta) return Modulus(alpha-beta, beta);
			if(alpha < 0) return Modulus(alpha+beta, beta);
			return alpha;
		}
		public static function Power(alpha:int, beta:int):int{

			return Math.pow(alpha,beta);
		}
		
		
		//////////////////////////////
		//Section 4:Factors and Primes
		//////////////////////////////
		
		public static function Prime(number:int):Boolean{
			
			
			var	val:int = Math.abs(number);
			if(val == 1 || val == 0) return false;
			
			for(var i:int = 2; i <=Math.sqrt(val); i++){
				if (val % i == 0){
					return false;
				}
			}
							
			return true;	
		}
					
		
		public static function Composite(number:int):Boolean{
			
			if(Math.abs(number) == 1) return false;
							
			return !Prime(number);	
		}
		
		public static function Perfect(number:int):Boolean{
			
			return Abundance(number) == 0; 
		}
		
		public static function Smooth(number:int, B:int):Boolean{
			
			var smoothValue:int = B;
			var	factorArray:Array = PrimeFactors(number);
			for(var i:int = 0; i < factorArray.length; i++){
				if(factorArray[i] > smoothValue)return false;	
			}	
			return true;
		}
		
		public static function PowerSmooth(number:int, B:int):Boolean{
			
			var smoothValue:int = B;
			var	factorArray:Array = PrimePowers(number);
			for(var i:int = 0; i < factorArray.length; i++){
				if(factorArray[i] > smoothValue)return false;	
			}	
			return true;
		}
		
		
		
		public static function Abundance(number:int):int{
			
			return AddList(ProperFactors(number)) - number;

		}
		public static function Deficiency(number:int):int{
			
			return -1*Abundance(number) ;

		}		
		
		
		
		public static function Factors(number:int):Vector{
			var num:int = Math.abs(number);
			var factorArray:Vector = new Vector();
			for(var i:int = 1; i <=num; i++){
				if (num % i == 0){
					factorArray.push(i);
				}
			}
			return  factorArray;
		}
		
		public static function ProperFactors(number:int):Vector{
			
			var pFactors:Vector = Factors(number);
			pFactors.pop()
			return pFactors;
		
		}		
		
		public static function PrimeFactors(number:int):Vector{
			var num:int = number;
			var primeArray:Vector = new Vector();
			primeArray.push(num);
			while(Composite(num)){
				for(var i:int = 2; i <=Math.sqrt(num); i++){
					if (num % i == 0){
						
						primeArray.splice(primeArray.length-1,1,i);
						num /=i;
						primeArray.push(num);
						break;
					}
				}
			} 
			return  primeArray;
		}		
		
		
		public static function DistinctPrimeFactors(number:int):Vector{
			
			var factorArray:Vector = PrimeFactors(number);
			var membersOnly:Vector = new Vector();

			
			for(var i:int = 0; i < factorArray.length; i++){
				if(membersOnly.lastIndexOf(factorArray[i])==-1)
				{
					membersOnly.push(factorArray[i]);
				}
				
			}
			return membersOnly;
		
		}		
		
		public static function PrimeExponents(number:int):Vector{
			
			var factorArray:Vector = PrimeFactors(number);
			var membersOnly:Vector = new Vector();
			var powersOnly:Vector = new Vector();
			
			for(var i:int = 0; i < factorArray.length; i++){
				if(membersOnly.lastIndexOf(factorArray[i])==-1)
				{
					membersOnly.push(factorArray[i]);
					powersOnly.push(0);
				}
				powersOnly[powersOnly.length-1] = powersOnly[powersOnly.length-1]+1;
			}
			return powersOnly;
		
		}			

		public static function PrimePowers(number:int):Vector{
			
			var factorArray:Vector = PrimeFactors(number);
			var membersOnly:Vector = new Vector();
			var membersMultiplied:Vector = new Vector();
			
			for(var i:int = 0; i < factorArray.length; i++){
				if(membersOnly.lastIndexOf(factorArray[i])==-1)
				{
					membersMultiplied.push(factorArray[i]);
					membersOnly.push(factorArray[i]);
					
				}else{
					membersMultiplied[membersMultiplied.length -1] = Multiply(membersMultiplied[membersMultiplied.length -1],factorArray[i]);
				
				}
				
			}
			return membersMultiplied;
		
		}	



		public static function PrimeFactorization(number:int):String{
		
			var members:Array = DistinctPrimeFactors(number);
			var powers:Array = PrimeExponents(number);
			var rep:Array = new Array();
			
			for(var i:int = 0; i < members.length; i++){
				rep.push(String(members[i] + "^" + powers[i]));
			}
		
			return rep.join(" * ");
		
		}			
		
		public static function PrimesTo(number:int):Vector{
			if(number < 2) return new Vector();
			var num:int = number;
			var primeArray:Vector = new Vector();
			primeArray.push(2);
			//Creates a list of odd numbers from 3 to the factored value
			for(var i:int = 3; i<=num; i++){
				if(!( i%2 ==0)){
				primeArray.push(i);
				}
			
			}
			var j:int = 1;
			while(j < primeArray.length){
				
				for(i=j+1; i<primeArray.length; i++){
					if(primeArray[i] % primeArray[j] == 0){
						primeArray.splice(i,1);
						i--;
					}
				}
				j++;
			}
			return  primeArray;
		}				
		
		public static function Totient(number:int):int{
			
			if (Prime(number)) number - 1;
			
			var members:Array = DistinctPrimeFactors(number);
			var product:Number = number;
			
			for(var i:int = 0; i<members.length; i++){
				product *= (1 - 1/members[i] );
			}
			
			return product;
		
		}
		
		public static function Radical(number:int):int{
		
			return MultiplyList(DistinctPrimeFactors(number));
		}
		
		
		public static function Divisor(number:int, n:int):int{
			var members:Array = Factors(number);
			var sum:int = number;
			
			for(var i:int = 0; i < members.length; i ++){
				members[i] = Power(members[i],n);
				
			}
			return AddList(members);
		}		

		public static function GCD(alpha:int, beta:int):int{
		
			var a:int = Math.max(Math.abs(alpha), Math.abs(beta));
			var b:int = Math.min(Math.abs(alpha), Math.abs(beta));
			var r:int = a % b;
			if( r == 0) 
			{
				return b
			};
			
			return GCD(b, r);

		}
		
		public static function GCDList(list:Array):int{
		
			if(list.length == 0) return One; 
			
			if(list.length == 1) return list[0];
			
			while(list.length >2){
			
			list[0] = GCD(list[0],list[1]);
			list.splice(1,1)
			
			
			}
			
			return GCD(list[0],list[1]);
		
		
		
		}		
		
		
		public static function LCM(alpha:int, beta:int):int{
		
			return (alpha* beta)/GCD(alpha,beta);


		}
		public static function LCMList(list:Vector):int{
			if(list.length == 0) return Infinity; 
			if(list.length == 1) return list[0];
			while(list.length >2){
				list[0] = LCM(list[0],list[1]);
				list.splice(1,1)
			}
			return LCM(list[0],list[1]);
		}		
		
		public static function Factorial(number:int,factor:int=1):int{


			if(number <=1) return 1;
			return Multiply(number, Factorial(number - factor));

		}	
		public static function Primorial(number:int):int{
			
			return MultiplyList(PrimesTo(number));
		
		}
		
		public static function Permutation(n:int,r:int):int{
			return Factorial(n)/Factorial(n-r);
		}
		
		public static function Combination(n:int,r:int):int{
			return Factorial(n)/(Factorial(r)*Factorial(n-r));
		}		
		
			
		
		
		//////////////////////////////
		//Section 5:Digit Manipulation
		//////////////////////////////		
		
		public static function ToArray(number:int):Array{
		
			var tempString:String = String(number);
			var tempArray:Array = new Array();
			var size:int = tempString.length;
			for(var i:int = 0; i <size; i++){
				tempArray.push(int(tempString.charAt(size -1-i)));
			}
			return tempArray;
		}		

		public static function FromArray(inArray:Array):int{
			return parseInt(inArray.reverse().join(""));
		}		
		
		public static function Place(number:int,index:int):int{
			return int(ToArray(number)[index]);
		}		
		
		public static function Round(number:int,place:int):int{
			
			if(Equal(place, Zero)) return number;
		

			var roundingArray:Array = ToArray(number);
			
			var decider:int = roundingArray[place-1];
			
			for(var i:int = 0; i < place; i++){
				roundingArray[i]=0;
			}

			var newInteger:int = FromArray(roundingArray);
			
			if(decider >4){
				newInteger = Add(newInteger, Power(10,place));
			
			}
				
			return newInteger;
		
		}

		//////////////////////////////
		//Section 6:Randomness
		//////////////////////////////

		public static function Random(r1:int=10,r2:int=0,inclusive:Boolean=true):int {
    	  	var low:int = Math.min(r1,r2);
    	  	var high:int = Math.max(r1,r2);
    	  
    	    if(low > high) return Number.NaN;
    	    return Math.round(low + Math.random() * (high - low));
	    }
		
		//This funcion returns a random integer between two given integers based on a random process through random.org.
		//This funciton is not yet implemented.		
		public static function RandomOrg(lower:int=0,upper:int=10,inclusive:Boolean=true,fallback:Boolean=true):int{
			if(fallback){
				return Random(lower,upper,inclusive);
			}
			return 0;
		}	    
	    
	    		
				
	}
}