package com.google.code.p.Mallory
{
	public class Logic
	{	
		//Person Note: I should try to find a way to do something about the fact that the number zero (0) is treated as false;
		
		//This function always returns true, no matter what the passes arguments
		public static function Truth(...anything):Boolean{
			return true;
		}
		//This function always returns false, no matter what the passes arguments
		public static function Falsehood(...anything):Boolean{
			return false;
		}
		
		//This function returns true if and only if both of the given argumens are true
		public static function And(a*;b:*):Boolean{
			return a && b;
		}
		
		//This function returns true only if and only if at least one of the given argumens are true
		public static function Or(a*;b:*):Boolean{
			return a || b;
		}
		
		//This function returns true only if and only if exactly one of the given argumens are true
		public static function Xor(a*;b:*):Boolean{
			if(a && b){
				return false
			}
			return a || b;
		}
		//This function returns true only if the given argument is false
		public static function Not(a):Boolean{
			return !a;
		}		
		
		
		
	}
}