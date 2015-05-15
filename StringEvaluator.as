package com.google.code.p.Mallory
{
	public class StringEvaluator
	{
		//Parse the string and do yo' thang!
		
		//KNOWN ISSUE!!! "sin(-12+4)" sin(subtract,16). 
		//The Answer may lie fixingin the ComplexNumber.fromString Method. 
		//Giving addition a "lower" priority than multiplication seems to have fixed this
		//However, a similar problem still arrises with "-1%4"
		//Predictably, giving % a lower priority that - fixes this, but im not sure if this is consistant with accepted practeces in math
		
		//KNOWN ISSUE!!!
		//Runtime functions (Expressions) cause problems
		//They cannot be passed into lambda functions
		//They cannot "contain" other runtime functions
		
		/**
		 * DESCRIPTION:Regular expression match for acceptable variables
		 * @id=VarMatch
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
		public static const VarMatch:RegExp = new RegExp("[_a-zA-Z]+[_a-zA-Z0-9]*","g");		
		//public static const VarMatch:RegExp = /[_a-zA-Z]+[_a-zA-Z0-9]*/g;	
		
		/**
		 * DESCRIPTION:List of special operators
		 * @id=operatorList
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
		private static const operatorList:Array = [
				SpecialOperator.Modulous,			
				SpecialOperator.Plus,
				SpecialOperator.Minus,
				SpecialOperator.Times,										
				SpecialOperator.Divided,
				SpecialOperator.Power
			];


		/**
		 * DESCRIPTION:Evaluates a given expression in an evniornment
		 * @id=Evaluate
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
		public static function Evaluate(expression:*,enviornment:Enviornment):*{
			
			//Returns the object if it is not a string
			if(!(expression is String)) return expression;
						
			//Strips the string of whitespace
			expression = expression.split("\r").join("");			
			expression = expression.split(" ").join("");

			
			//Returns the expression as a complex number if it is a comple number
			if(ComplexNumber.IsComplex(expression)) {return new ComplexNumber(expression)};
			
			//Returns the expression as a vector if it is a vector 
			if(UnSurroundOK(expression,"[","]")){
				return VectorEvaluate(UnSurround(expression),enviornment);
			}				
			
			//Returns the expression without parantheses if they are deemed unnecissary 
			if(UnSurroundOK(expression,"(",")")){
				return Evaluate(UnSurround(expression),enviornment);
			}

			//Counts parenthases
			var pCount:int = CountChar(expression,"(") - CountChar(expression,")");
			if(pCount > 0){return new Error( "Missing " + pCount +" ')'.");}
			if(pCount < 0){return new Error("Missing " + -pCount +" '('.");}			 

			//this part assigns a variable to a value (Shouldn't probably be made to work with the special operators);
			if(SplitBinary(expression,"=").length ==2){
				//return Assign(expression,enviornment);
			}
		
			//Checks the expression for binary operators
			for(var i:uint=0; i < operatorList.length; i++){
				var currentOperator:SpecialOperator = operatorList[i];
				if(SplitBinary(expression,currentOperator.rep).length ==2){
					return FunctionEvaluate(currentOperator.funct,SplitBinary(expression,currentOperator.rep),enviornment);				
				}				
			
			}

			//Checks to see if the remaining expression is a function expression
			var pPosition:int = expression.indexOf("(");
			if(pPosition >0){	
				var functionName:String = expression.substr(0, pPosition);
				var arguments:Array = SeperateArray(expression.substr(pPosition+1, expression.length-pPosition-2));
				return FunctionEvaluate(functionName, arguments,enviornment);
			}	
			
			//Returns the expression as evaluated in the enviornment.
			return enviornment.retrieve(expression);			
		}
		
		/**
		 * DESCRIPTION:Evaluates an assingment expression
		 * @id=Assign
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
		/*private static function Assign(expression:String,enviornment:Enviornment):*{
				var newKey:String = SplitBinary(expression,"=")[0].toString();
				var newValue:String =SplitBinary(expression,"=")[1];
				
				//Assigns an expression to a variable "variable(x) = expression"
				if(newKey.indexOf("(")>-1){
					var pPos:int = newKey.indexOf("(");					
					var newKeyName:String = newKey.substring(0, pPos);
					
					if(enviornment.existImmutableKey(newKeyName)){
						return new Error( newKeyName + " is immutable.");
					}
					
					if(!(newKeyName.match(VarMatch).length > 0 && newKeyName == newKeyName.match(VarMatch)[0])) {
						return new Error("Expression Assingment Failed"); 
					}
					var pPos2:int = newKey.indexOf(")");
					var newVars:Array = newKey.substring(pPos+1, pPos2).split(",");
					var newExpression:Expression = new Expression(newValue,newVars);
					return enviornment.assign(newKeyName,newExpression);
											
				}
				
				//Assigns a value to a variable "variable = value"
				if(newKey.match(VarMatch).length > 0 && newKey == newKey.match(VarMatch)[0]) {
					if(enviornment.existImmutableKey(newKey)){
						return new Error( newKey + " is immutable.");
					}
					
					if(newValue is String && newKey == newValue){
						return enviornment.remove(newKey);
					}
					
					if(newValue != ""){
						return enviornment.assignDeep(newKey,Evaluate(newValue,enviornment));
					}
					return new Error("No assingment made");
				}	
				return new Error("Variable Assingment Failed");		
		}*/
		
		/**
		 * DESCRIPTION:Evaluates a function and parameters
		 * @id=FunctionEvaluate
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
		private static function FunctionEvaluate(fName:String,parameters:Array,enviornment:Enviornment):*{
			//Evaluate each parameter			
			for(var i:int = 0; i<parameters.length; i++){

				parameters[i]= Evaluate(parameters[i],enviornment);
			}
			
			//Check for function existance
			if(!enviornment.existKey(fName)){
				return fName + "(" + parameters + ")";
			}
			
			var f:* = enviornment.retrieve(fName);			
			
			//Special Instructions for accessing other enviornments
			if(f is Enviornment){
				return f.retrieve(parameters[0]);
			}
			
			//Checks parameters to see if they can be evaluated
			for(i = 0; i<parameters.length; i++){
				//if((parameters[i] is String)&&ComplexNumber.IsNotComplex(parameters[i])){
				if((parameters[i] is String) is String && parameters[i] == Evaluate(parameters[i],enviornment) ){
					//return fName + "(" + parameters[i] == enviornment.retrieve(parameters[i]) + ")";
					return fName + "(" + parameters + ")";				
				};
			}			
			//Special Instructions for applying expressions (run time created funcions) to parameters
			if(f is Expression){
				return f.evaluate(parameters,enviornment);
			}
			
			//Applys normal functions to parameters			
			return f.apply(null,parameters);

		}		
		
		/**
		 * DESCRIPTION:Evaluates a given expression as a vector
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
		 * (a) It is assumes that the leading and trailing brackets have already been removed
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * (b) 
		 * (c) 
		 */		
		public static function VectorEvaluate(expression:*,enviornment:Enviornment):Vector{

			var newVector:Vector = Vector.ArrayToVector(SeperateArray(expression));

			for (var i:uint=0; i<newVector.length; i++){
				newVector[i] = Evaluate(newVector[i],enviornment);
			}
			return newVector;

		}			
		
		/**
		 * DESCRIPTION: Chounts the number of a specific characters in an expression
		 * @id=CountChar
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
		private static function CountChar(expression:String,char:String=" "):int{
			var count:int = 0;
			for(var i:int = 0; i<expression.length; i++){
				if(expression.charAt(i)==char){
					count++;
				}
			}
			return count;
		}	

		/**
		 * DESCRIPTION:Checks to see if an expression is surrounded by brackets
		 * @id=IsSurrounded
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
		private static function IsSurrounded(expression:String,leftBracket:String="(",rightBracket:String=")"):Boolean{
			if(expression.charAt(0)==leftBracket && expression.charAt(expression.length-1)==rightBracket ){
				return true;
			}
			return false;
		}
		
		/**
		 * DESCRIPTION:Checks to see if it is ok to remove brackets from an expression
		 * @id=UnSurroundOK
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
		private static function UnSurroundOK(expression:String,leftBracket:String="(",rightBracket:String=")"):Boolean{
			if(!IsSurrounded(expression,leftBracket,rightBracket)){
				//Return original expression if not surrounded
				return false;
			}
			var newExpression:String = expression.substring(1,expression.length-1);


			if(newExpression.lastIndexOf(leftBracket) > newExpression.lastIndexOf(rightBracket)){
				//return original expression if removing was a mistake
				return false;
			}
			
			return true;	
		}
		
		/**
		 * DESCRIPTION:Removes outer brackets from an expression
		 * @id=UnSurround
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
		private static function UnSurround(expression:String):String{
			return expression.substring(1,expression.length-1);
		}
		
		/**
		 * DESCRIPTION:Seperates a given into elements and returns an array of them
		 * @id=SeperateArray
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
		private static function SeperateArray(expression:String,splitter:String=","):Array{
			var exArray:Array = expression.split(splitter);
			var i:int;
			var leftBracket:String="(";
			var rightBracket:String=")";
			
			for(i= 0; i < exArray.length-1; i++){
				if(CountChar(exArray[i],leftBracket)>CountChar(exArray[i],rightBracket)){
					exArray[i] = exArray[i].concat(splitter,exArray[i+1]);
					exArray.splice(i+1,1);
					i--;
				}
			}
			
			leftBracket="[";
			rightBracket="]";
			
			for(i= 0; i < exArray.length-1; i++){
				if(CountChar(exArray[i],leftBracket)>CountChar(exArray[i],rightBracket)){
					exArray[i] = exArray[i].concat(splitter,exArray[i+1]);
					exArray.splice(i+1,1);
					i--;
				}
			}			

			leftBracket="{";
			rightBracket="}";
			
			for(i= 0; i < exArray.length-1; i++){
				if(CountChar(exArray[i],leftBracket)>CountChar(exArray[i],rightBracket)){
					exArray[i] = exArray[i].concat(splitter,exArray[i+1]);
					exArray.splice(i+1,1);
					i--;
				}
			}	

			
			return exArray;
				
		}
		
		/**
		 * DESCRIPTION:Splits and expression over a binary operator into an array
		 * @id=SplitBinary
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
		private static function SplitBinary(expression:String,splitter:String="+"):Array{
			var exArray:Array = SeperateArray(expression,splitter);
				if(exArray.length>1){				
					var first:String = exArray.shift();
					var second:String = exArray.join(splitter);
					exArray = new Array();
					exArray.push(first, second);
				}
			return exArray;
		}		
		
		
		
		
		
		
		
		
		
		
	}
}