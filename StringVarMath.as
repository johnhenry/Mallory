package com.google.code.p.Mallory
{
	public class StringVarMath
	{
		
		public static const Zero:String = "0";
		public static const One:String = "1";
		
		
		public static function Negative(element:String):String{
		
			if(element.charAt() == "-") return element.substr(1);
			return "-" + element;
		
		
		}
		public static function Add(a:String, b:String):String{
			
			if(a == Zero) return b;
			if(b == Zero) return a;
			
			
			return (a + " + " + b);

		}


		

		public static function Multiply(a:String, b:String):String{
			
			if(a == Zero || b == Zero) return Zero;

			
			if(a == One) return b;
			if(b == One) return a;
			if(a == Negative(One)) return Negative(b);
			if(b == Negative(One)) return Negative(a);
			if(a == b) return ("("+a + "^2)")
			
			return ("(" + a + " * " + b + ")");

		}		
		
		public static function FromCode(code:int):String{
			
			return String.fromCharCode(code);
		}
		
		
		
	}
}