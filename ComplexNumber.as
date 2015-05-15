package com.google.code.p.Mallory
{
	
	public dynamic class ComplexNumber extends Array
	{

		public static const ComplexMatch:RegExp = new RegExp("[\-]?[0-9]+[\.]?[0-9]*[\+][\-]?[0-9]+[\.]?[0-9]*[\*][i]","g");		
		public static const RealMatch:RegExp = new RegExp("[\-]?[0-9]+[\.]?[0-9]*","g");
		public static const ImaginaryMatch:RegExp = new RegExp("[\-]?[0-9]+[\.]?[0-9]*[\*][i]","g");		
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
		
		
		
		
		
		private var _coordinates:Vector;
		
		
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
		public function ComplexNumber(...arguments) {
				_coordinates = new Vector(2);
				value = Number.NaN;
				iValue = Number.NaN;
			
			switch(arguments.length){
				case 0:
				//overload ComplexNumber()				
				value = new Number(0);
				iValue = new Number(0);
				break;
				case 1:
				
				//overload ComplexNumber(arguments[0]:ComplexNumber)
				if((arguments[0]) is ComplexNumber){
					value = new Number(arguments[0].value);
					iValue = new Number(arguments[0].iValue);
					
				}
				//overload ComplexNumber(arguments[0]:Number)				
				else if((arguments[0]) is Number){
					value = new Number(arguments[0]);
					iValue = new Number(0);
				}
				//overload ComplexNumber(arguments[0]:XML)
				else if((arguments[0]) is XML){
					value = fromXML(arguments[0]).value;
					iValue = fromXML(arguments[0]).iValue;
				}				
				
				//overload ComplexNumber(arguments[0]:String)
				else if((arguments[0]) is String){
					value = fromString(arguments[0]).value;
					iValue = fromString(arguments[0]).iValue;
				}
				break;
				case 2:
				//overload ComplexNumber(arguments[0]:Number,arguments[1]:Number)
				value = new Number(arguments[0]);
				iValue = new Number(arguments[1]);				
				break;
			}
		
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
		public static function IsNotComplex(element:*):Boolean{
			var newElement:ComplexNumber = new ComplexNumber(element);
			if(isNaN(newElement.value)  || isNaN(newElement.iValue)) {
				return true;
				}
			return false;
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
		public static function IsComplex(element:*):Boolean{
			var newElement:ComplexNumber = new ComplexNumber(element);
			if(!isNaN(newElement.value)  && !isNaN(newElement.iValue)) {
				return true;
				}
			return false;
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
		public static function Wrap(...arguments):*{
			if(arguments.length ==0) return false;
					
			if(arguments.length ==1){					
				return new ComplexNumber(arguments[0]);
			}
			if(arguments.length == 2){
			
				return new ComplexNumber(Number(arguments[0]),Number(arguments[1]));
			}
			return false;	
				

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
		public function get value():Number {
			_coordinates[0]
			return _coordinates[0]
		}
		public function set value(val:Number):void {
			_coordinates[0] = val as Number;
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
		public function get iValue():Number {
			return _coordinates[1];
		}
		public function set iValue(val:Number):void {
			_coordinates[1] = val as Number;
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
		public function toXML():XML {
			
			return new XML("<complexNumber><value>"+value+"</value><iValue>"+iValue+"</iValue></complexNumber>");
		}
		public function fromXML(num:XML):ComplexNumber{
				return new ComplexNumber(new Number(num.value), new Number(num.iValue));

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
		public function toVector():Vector{

			return _coordinates.clone();
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
		public function fromNumber(num:Number):ComplexNumber{
				return new ComplexNumber(num,0);

		}
		/**
		 * DESCRIPTION:Returns the string representation of a complex number
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
		public function toString(fullMode:Boolean = false):String {
			
			
			var odd:String = "i";
			if(fullMode){
				return(value + "+" + iValue + "" + odd);
			}
					
			if (value == 0 && iValue == 0) { 
				return String(0);
			} else if (iValue == 0) {
				return String(value);
			}

			
			var ima:String;
			//formats the imaginary part
 			if (iValue == 1) {
				ima = odd;
			} else if (iValue == -1) {
				ima = "-"+odd;
			} else if (iValue<0) {
				ima = iValue+"*"+odd;
			} else {
				ima = iValue+"*"+odd;
			}
			if (value == 0) {
				return ima;
			}
			return value+"+"+ima; 
			//this is an alternet representation
		
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
		public function fromString(expression:String):ComplexNumber{
				expression = expression.split(" ").join("");				
				var val:Number;
				var iVal:Number;
				
				
				if(expression.match(ComplexMatch).length > 0 && expression == expression.match(ComplexMatch)[0]) {
					var exArray:Array = expression.split("+");
					exArray[1] = exArray[1].slice(0,exArray[1].length-2);
					val = new Number(exArray[0]);
					iVal = new Number(exArray[1]);
				
				}else if(expression.match(RealMatch).length > 0 && expression == expression.match(RealMatch)[0]){ 
					val = new Number(expression);
					iVal = new Number(0);

				}else if(expression.match(ImaginaryMatch).length > 0 && expression == expression.match(ImaginaryMatch)[0]) {
					expression = expression.slice(0,expression.length-2);
					val = new Number(0);
					iVal = new Number(expression);
				}else if (expression == "i"){
					val = new Number(0);
					iVal = new Number(1);
				}
						
			return new ComplexNumber(val, iVal);
						
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
		public function neg():ComplexNumber{
			return ComplexMath.Negative(this);
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
		public function recip():ComplexNumber{
			return ComplexMath.Reciprocal(this);
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
		public function conj():ComplexNumber{
			return ComplexMath.Conjugate(this);
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
		public function flip():ComplexNumber{
			return ComplexMath.Flip(this);
		}				
	
	}
		
	
}