package com.google.code.p.Mallory
{

	
	public class IntUtils
	{

		//this function takes the last three digits of a positive integer and converts them to english wording 
		public static function ToWordsTripple(num:uint=0):String{
			var intString:String = "";

			
			switch(num){
				case 0: intString += "zero"; break;
				case 1: intString += "one"; break;			
				case 2: intString += "two"; break;
				case 3: intString += "three"; break;			
				case 4: intString += "four"; break;			
				case 5: intString += "five"; break;			
				case 6: intString += "six"; break;			
				case 7: intString += "seven"; break;			
				case 8: intString += "eight"; break;
				case 9: intString += "nine"; break;							
				case 10: intString += "ten"; break;			
				case 11: intString += "eleven"; break;
				case 12: intString += "twelve"; break;
				case 13: intString += "thirteen"; break;
				case 14: intString += "fourteen"; break;
				case 15: intString += "fifteen"; break;
				case 16: intString += "sixteen"; break;
				case 17: intString += "seventeen"; break;
				case 18: intString += "eighteen"; break;																								
				case 19: intString += "nineteen"; break;
				default:
			}
			if(num < 20){
				return intString;
			}
			var numString:String = num.toString();
			var lowerPlace:int = int(num.toString().charAt(num.toString().length-1));
			var tensPlace:int = int(num.toString().charAt(num.toString().length-2));
			
			if(lowerPlace !=0){
				switch(tensPlace){
					case 2: intString = "twenty-" + ToWordsTripple(lowerPlace); break;
					case 3: intString = "thirty-" + ToWordsTripple(lowerPlace); break; 			
					case 4: intString = "fourty-" + ToWordsTripple(lowerPlace); break; 
					case 5: intString = "fifty-" + ToWordsTripple(lowerPlace); break;
					case 6: intString = "sixty-" + ToWordsTripple(lowerPlace); break;
					case 7: intString = "seventy-" + ToWordsTripple(lowerPlace); break;			
					case 8: intString = "eighty-" + ToWordsTripple(lowerPlace); break;
					case 9: intString = "ninty-" + ToWordsTripple(lowerPlace); break;			
				}
			}else{
				switch(tensPlace){
					case 2: intString = "twenty"; break;
					case 3: intString = "thirty"; break; 			
					case 4: intString = "fourty"; break; 
					case 5: intString = "fifty"; break;
					case 6: intString = "sixty"; break;
					case 7: intString = "seventy"; break;			
					case 8: intString = "eighty"; break;
					case 9: intString = "ninty"; break;
				}
			}
			if(num < 100){
				return intString;
			}
			
			
			
			
			lowerPlace = int(tensPlace.toString()+lowerPlace.toString());
			var hundredsPlace:int = int(num.toString().charAt(num.toString().length-3));
			
			
			if(lowerPlace !=0){
					intString = ToWordsTripple(hundredsPlace) + "-hundred-" + ToWordsTripple(lowerPlace);
			}else{
					intString = ToWordsTripple(hundredsPlace) + "-hundred";
			}	

			return intString;
		}
		
		//This is an array of accepted names for number groups
		//In the future, it will contain more names for groupings
		public static const ActualNames:Array = ["","-thousand","-million","-billion","-trillion","-quadrillion","-quintillion","-sextillion","-septillion","-octillion","-nonillion","-decillion"]			
		//This is an array of of fake names for number groups
		public static const FakeNames:Array = ["ZILLION!!!", "-BAJILLION!!!","-AGAZILLION!!!"]		
		//This function assigns names for number grouping
		//Will, in the futre, assign fake names randomly once actual names have fun out
		public static function NumberGroupNames(index:uint=0):String{

			if(index< ActualNames.length){
				return ActualNames[index];
			}else{
				return FakeNames[0];
			}
		}
		//This function converts an integer, or a string representation of an integer to english words
		//Passing in a string representation allows you to bipass the limit to the size of available numbers in actionscript
		public static function ToWords(num:*):String{

			var negative:Boolean = false;
			
			if(num is String){
				if(num.charAt(0)=="-"){
					negative = true;
					num = num.substring(1);
				}
			}
			
			if(num < 0){
				negative = true;
				num *=-1;
			}			
			
			var numString:String = num.toString().split(",").join("");;
			var numArray:Array = new Array();

			while(numString.length >0){
				var intGroup:int; 
			
				if(numString.length > 2){
					intGroup= int(numString.substring(numString.length-3));
					numString = numString.substr(0,numString.length-3);
				}else if (numString.length > 1){
					intGroup= int(numString.substring(numString.length-2));
					numString = numString.substr(0,numString.length-2);				
				}else{
					intGroup= int(numString.substring(numString.length-1));
					numString = numString.substr(0,numString.length-1);				
				}
				
				numArray.splice(0,0,intGroup);
			}
			
			if(numArray.length==1){
				if(negative){
					return "negative " + ToWordsTripple(numArray[0]);
				}
				
				return ToWordsTripple(numArray[0]);
			}
			for(var i:uint =0; i<numArray.length; i++){
				if(numArray[i]==0){
					numArray[i] =null;
				}else{
					numArray[i] = ToWordsTripple(numArray[i]) +  NumberGroupNames(numArray.length-i-1)	
				}
				; 
			}
			for(i=0;i<numArray.length;i++){
				if(numArray[i]==null){
					numArray.splice(i,1);
					i--;
				}
			}
			
			numString = numArray.join();
			
				
			if(negative){
				return "negative " + numString;
			}
			return numString;
	
		}
		
		//This function converts an integer, or a string representation of an integer to english words (Ordinal)
		//Passing in a string representation allows you to bipass the limit to the size of available numbers in actionscript
		
		public static function ToWordsOrdinal(num:*):String{
			var originalString:String = ToWords(num);
			var numString:String = ToWords(num);
			
	
			
			var lastWord:String = numString.substr(numString.lastIndexOf("-"));		
			numString = numString.substring(0,numString.lastIndexOf("-"))		
					switch(lastWord){
						case "-one": return numString+"-first";
						case "-two": return numString+"-second";
						case "-three": return numString+"-third";
						case "-four": return numString+"-fourth";
						case "-five": return numString+"-fifth";
						default: 
						
					}
					switch(originalString){
						case "one": return numString+"first";
						case "two": return numString+"second";
						case "three": return numString+"third";
						case "four": return numString+"fourth";
						case "five": return numString+"fifth";
					}
		
			return originalString+"th";
		}
		//This function converts an integer, or a string representation of an integer to english words (one)
		//It then removes the preceding "one-" to facilitate more a more common reading
		//Passing in a string representation allows you to bipass the limit to the size of available numbers in actionscript
		public static function ToWordsOrdinalLazy(num:*):String{
			if (ToWordsOrdinal(num).substring(0,4)=="one-"){
				
				return ToWordsOrdinal(num).substring(4);
			}
			
			return ToWordsOrdinal(num);
		
		
		}
		 


		
		//This function converts an number, or a string representation of an decimal to english words
		//Passing in a string representation allows you to bipass the limit to the size of available numbers in actionscript		
		public static function ToWordsDecimal(num:*):String{
			num = num.toString();
			if(num.toString().lastIndexOf(".") == -1){
				return ToWords(num);
			};			
			var integer:String = num.split(".")[0];
			var decimal:String = num.split(".")[1];

			
			var finalString:String;
			var pluralFraction:Boolean = false;
			
			if(decimal && decimal.charAt(decimal.length-1)!="1"){
				pluralFraction = true;
			} 


			if((!integer || ToWords(integer) =="zero")&& decimal.length>0){
				finalString = ToWords(decimal) + " " + ToWordsOrdinalLazy(Math.pow(10,decimal.length));
			}else if((!decimal || ToWords(decimal) =="zero")&& integer.length>0){
				finalString = ToWords(integer);
			}else if(!(integer || decimal)){
				return null;
			}
			else{
				finalString = ToWords(integer) + " and " + ToWords(decimal) + " " + ToWordsOrdinalLazy(Math.pow(10,decimal.length));
			}
			
			if(pluralFraction){
				finalString+="s"
			}
			
			return finalString;


		}

	}	
}