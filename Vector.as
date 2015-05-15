package com.google.code.p.Mallory
{
	public dynamic class Vector extends Array
	{
		//public static const VectorMatch:RegExp = new RegExp("[\-]?[0-9]+[\.]?[0-9]*[\*][i]","g");		
		public static const VectorMatch:RegExp = new RegExp("\[ [],? \]","g");		
		public static const Empty:Vector = new Vector();		
		
		
		//This is the constructor for the vector class. It works exactly like the constructor for the Array class 
		public function Vector(...rest){
			
			if(rest.length == 1 && rest[0] is int ){
				super (rest[0]);
			}else{
				for(var i:uint=0; i<rest.length; i++){
				this[i]=rest[i];
				}
			}
		}
		
		//This function converts an array to a Vector
		public static function ArrayToVector(array:Array):Vector{
			var newVector:Vector = new Vector();
				for each(var e:* in array){
					newVector.push(e);
				}
			return newVector;
		}
		
		//This function returns a string representation of the vector
		public function toString(seperator:String=",",leftBracket:String="[",rightBracket:String="]"):String{
			var arrayString:String = leftBracket;
			for (var i:uint = 0; i < this.length; i++){
				if(this[i] !=null){
					arrayString += this[i].toString();
				}else{
					arrayString += null;
				}

				if(i != this.length-1){
					arrayString +=seperator;
				}
			}
			return arrayString + rightBracket;
			
		}
		
		//This function returns an xml representation of a vector
		public function toXML():XML{
				
				var memArray:Array = new Array();
				for (var i:int =0; i <this.length; i++){
					memArray.push("<coordinate>" + this[i]+"</coordinate>");
				}
				return new XML("<vector>" + memArray.join("") + "</vector>");
		}		
		
		//This function returns a selected element from a vector
		public function getElement(index:int=0):*{
			return this[index];
		}
		
		//This function removes a selected element from a vector
		public function removeElement(index:int=0):*{
			return this.splice(index,1)[0];
		}
		
		//This function sets a specific element of a vector to a specific value 
		public function setElement(newElement:*=null,index:uint=0):*{
			if(this[index]){
				return this.splice(index,1,newElement)[0];				
			}
			addElement(null,index);
			return setElement(newElement,index);
		}
		//This funciton adds an elemnent to an array at a specific index. 
		//If no index is specified, then it addes it to the end
		//If the specified index is out of bounds of the vector, then placeHolder is inserted into the array until the desired length is met
		public function addElement(newElement:*=null,index:int=-1,placeHolder:*=null):uint{
			if(index<0){
				return this.push(newElement);
			}
			while(index > length){
				this.push(placeHolder);
			}
			
			//Personal note: What doe push and splice return? 
			this.splice(index,0,newElement);
			return this.length;
		}
		
		
		//The getters and setters for x,y,z and t allow the vector to act as a 1 to 4 dimensional point.
		public function get x():*{
			if(this[0]){
				return this[0];	
			}
			return 0;
		
		}
				
		public function get y():*{
			if(this[1]){
				return this[1];	
			}
			return 0;
		}		
		public function get z():*{
			if(this[2]){
				return this[2];	
			}
			return 0;
		}		
		public function get t():*{
			if(this[3]){
				return this[3];	
			}
			return 0;
		}
		
		public function set x(newX:*):void{
			this.setElement(newX,0);
		}		
		public function set y(newY:*):void{
			this.setElement(newY,1);
		}		
		public function set z(newZ:*):void{
			this.setElement(newZ,2);
		}		
		public function set t(newT:*):void{
			this.setElement(newT,3);
		}
		
		
		
		
		
		
		
		
		
		//This function returns a clone of a given vector.
		public function clone(deep:Boolean=true):*{
			var newVector:Vector = new Vector(this.length);
			for(var i:uint=0; i<newVector.length; i++){
				if(deep){
					if(this[i] is Vector){
						newVector[i] = this[i].clone();
					}else{
						newVector[i] = this[i];	
					}
				}else{
					newVector[i] = this[i];
				}
				
			}

			return newVector;
		}
		public function reversed():Vector{
			var newVector:Vector = new Vector(this.length);
			for(var i:uint=0; i<newVector.length; i++){
				newVector[i] = this[this.length-1-i];
			}
			return newVector;
		}		
		
		
	}
}