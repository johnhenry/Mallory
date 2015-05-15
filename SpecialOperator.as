package com.google.code.p.Mallory
{
	public class SpecialOperator
	{
		
		
		public function SpecialOperator(newRep:String,newFunct:String){
			_rep = newRep;
			_funct = newFunct;
		}
		private var _rep:String;
		public function get rep():String{
			return _rep;
		}		
		private var _funct:String;	
		public function get funct():String{
			return _funct;
		}
		public function toString():String{
			return "Operator: " + rep;
		}
		
		public static var Plus:SpecialOperator = new SpecialOperator("+", "add");
		public static var Minus:SpecialOperator  = new SpecialOperator("-", "subtract");		
		public static var Times:SpecialOperator  = new SpecialOperator("*", "multiply");		
		public static var Divided:SpecialOperator  = new SpecialOperator("/", "divide");
		public static var Power:SpecialOperator  = new SpecialOperator("^","power");		
		public static var Modulous:SpecialOperator = new SpecialOperator("%", "mod");
		public static var Elipses:SpecialOperator  = new SpecialOperator("...",null);		
		public static var System:SpecialOperator  = new SpecialOperator("#",null);					
	}
}