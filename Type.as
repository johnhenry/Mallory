package com.google.code.p.Mallory
{
	public class Type
	{
		public static const NUMBER:String = "number";
		public static const VECTOR:String = "vector";		
		public static const MATRIX:String = "matrix";
		public static const FUNCTION:String = "function";		
		public static const ERROR:String = "error";
		public static const BOOLEAN:String = "boolean";	
		public static const PERMUTATION:String = "permutation";		
		
		
		public static function GetType(obj:*):String{
			
			if(obj is int || obj is Number || obj is ComplexNumber || ComplexNumber.IsComplex(obj)){
				return NUMBER;
			}
			
			if(obj is Vector){
				if(VectorUtils.IsMatrix(obj)){
					return MATRIX;
				}
				return VECTOR;				
			}
			
			if(obj is Error){
				return ERROR;
			}
			
			if(obj is Boolean){
				return BOOLEAN;
			}
			
			if(obj is String){
				return ERROR;
			}
			
			if(obj is Expression){
				return FUNCTION;
			}
			
			return FUNCTION; 
		}

	}
}