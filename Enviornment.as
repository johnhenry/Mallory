package com.google.code.p.Mallory
{	
	import flash.utils.ByteArray;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	

	public class Enviornment 
	{	
 		
 
	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
		private var _items:Object = new Object();
 		private var _immutableItems:Object = new Object();
		
		/**
		 * DESCRIPTION:Constructor for Enviornment
		 * @id=Enviornment
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {...} rest	list of arguments 
		 * -------------------------------------
		 * NOTES:
		 * (a) every odd argument (1st,3rd,5th...) becomes an immutable key 
		 * (b) every even argument becomes an immutable value
		 * -------------------------------------
		 * EXAMPLES:
		 * (a) trace(new Enviornment("x",1,"y",2,"z",3));//Output: {x : 1 ; z : 3 ; y : 2}
		 * 
		 */ 		
 		public function Enviornment(...rest){
			if(rest.length % 2 ==1){ rest.pop()}
			
			for(var i:int = 0; i < rest.length; i+=2){
				if(rest[i] is String){
					assignImmutable(rest[i],rest[i+1]);
				}
			}

		
		
		}
		
		/**
		 * DESCRIPTION:Checks to see if a key is in the enviorment
		 * @id=existKey
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
		public function existKey(request:String):Boolean{
			for (var key:String in _immutableItems){
				if(key == request) return true;
			}
			for (key in _items){
				if(key == request) return true;
			}
			return false;
		}
		
		/**
		 * DESCRIPTION:Checks to see if a key is in an enviornment an if it's value is immutable
		 * @id=existImmutableKey
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {Boolean}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public function existImmutableKey(request:String):Boolean{
			for (var key:String in _immutableItems){
				if(key == request) return true;
			}
			return false;
		}		
				
		
		
		/**
		 * DESCRIPTION:Checks to see if a value is in an enviornment
		 * @id=existValue
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {Boolean}
		 * -------------------------------------
		 * NOTES:
		 * (a)I have a weird feeling about using this 
		 * because a single value could have multiple keys, thus it probably wouldn't bee to useful.
		 * Check for keys instead.
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */		
		public function existValue(request:*):Boolean{
			for each(var value:* in _immutableItems){
				if(value == request) return true;
			}
			for each(value in _items){
				if(value == request) return true;
			}
			return false;
		}
		
		/**
		 * DESCRIPTION:Converts an enviornment to a string
		 * @id=toStringRep
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {String}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */				
		public function toString(showImmutable:Boolean=true,showRest:Boolean=true):String{
			var result:Array = new Array()
				
			if(showImmutable){
				for (var key:String in _immutableItems){
					result.push(key + " : " + _immutableItems[key].toString());	
				}

			}
			if(showRest){
					for (key in _items){
					result.push(key + " : " + _items[key].toString());
				}	
			}				
			return "{" + result.join(" ; ") + "}";
		}
		
		/**
		 * DESCRIPTION:Clones an enviornment
		 * @id=clone
		 * -------------------------------------
		 * PARAMETERS:
		 * -------------------------------------
		 * RETURNS:
		 * @return {Enviornment}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */			
		public function clone():Enviornment{
			var newEnviornment:Enviornment = new Enviornment();
			var newItems:Object = new Object();
			var newImmutableItems:Object = new Object()
    
		    var ba:ByteArray = new ByteArray();
		    ba.writeObject(_items);
		    ba.position = 0;
		    newEnviornment._items = ba.readObject();			
			
		    ba = new ByteArray();
		    ba.writeObject(_immutableItems);
		    ba.position = 0;
		    newEnviornment._immutableItems = ba.readObject();				

			return newEnviornment;
		}
		
		/**
		 * DESCRIPTION: Returns an enviornment's size
		 * @id=size
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {uint}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */		
		public function get size():uint{
			var num:uint = 0;
			for (var key:String in _immutableItems){num++;}			
			for (key in _items){num++;}
			return num;
		}
		
		/**
		 * DESCRIPTION:Returns a list of an enviornment's keys 
		 * @id=keys
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a) These keys don't seem to be arranged in any particular order
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public function get keys():Array{
			var keyArray:Array = new Array();
			for (var key:String in _immutableItems){keyArray.push(key)}			
			for (key in _items){keyArray.push(key)}			
			return keyArray;
		}

		/**
		 * DESCRIPTION:Returns a list of an enviornment's immutable keys 
		 * @id=immutableKeys
		 * -------------------------------------
		 * PARAMETERS:
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
		public function get immutableKeys():Array{
			var keyArray:Array = new Array();
			for (var key:String in _immutableItems){keyArray.push(key)}			
			return keyArray;
		}
		
		/**
		 * DESCRIPTION:Returns a list of values in an enviornment
		 * @id=values
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a) Values don't seem to appear in any particular order
		 * (b) Since values don't appear in any particular order,
		 * it's probably better to get the keys and then evaluate them in the eneviornement to get a list of values 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		 
		public function get values():Array{
			var valueArray:Array = new Array();
			for each(var value:* in _immutableItems){valueArray.push(value)}
			for each(value in _items){valueArray.push(value)}
			return valueArray;
		}
		
	
		
		/**
		 * DESCRIPTION:Assigns a key to a value
		 * @id=assign
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
		public function assign(key:String,value:*=undefined):Boolean{
				if(key == value){
					return remove(key);
				}
				if(value == undefined){
					return remove(key);
				}
				if(existImmutableKey(key)){
					return false;
				}
				
				_items[key] = value;
				return true;
		}
		
		/**
		 * DESCRIPTION:Assigns a key to a value and makes it immutable
		 * @id=assignImmutable
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
		public function assignImmutable(key:String,value:*=undefined):Boolean{
				if(key == value){
					return remove(key);
				}
				if(value == undefined){
					return remove(key);
				}
				if(existKey(key)){
					return false;
				}				
				_immutableItems[key] = value;
				
				return true;
		}		
		
		/**
		 * DESCRIPTION:Assigns a key to a value, but the value is evaluated in the enviornment first
		 * @id=assignDeep
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
		public function assignDeep(key:String,value:*):Boolean{
				return assign(key,retrieveDeep(value));
		}
		
		/**
		 * DESCRIPTION:Assigns a key to a value and makes it immutable, but the value is evaluated in the enviornment first 
		 * @id=assignImmutableDeep
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
		public function assignImmutableDeep(key:String,value:*):Boolean{
				return assignImmutable(key,retrieveDeep(value));
		}				

		/**
		 * DESCRIPTION:Retrieves the value of a given key
		 * @id=retrieve
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
		public function retrieve(key:String):*{
			if(!existKey(key)){
				return key;	
			}
			if(existImmutableKey(key)){
				return _immutableItems[key];
			}
			
			return _items[key];
		}

		/**
		 * DESCRIPTION:Retrieves the deepest value of a given key
		 * @id=retrieveDeep
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
		public function retrieveDeep(key:String):*{
			
			var previousValue:* = retrieve(key);
			
			for(var i:int =0; i<size; i++){
				if(previousValue == key) return key;				
				if(!(previousValue is String) || previousValue == retrieve(previousValue)){
					return previousValue;
				}
				previousValue = retrieve(previousValue);
				
			}
			
			return undefined;
			
		
		}		
		
		
		/**
		 * DESCRIPTION:Removes a value from a list
		 * @id=remove
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
		public function remove(key:String):Boolean{
			if(existImmutableKey(key)){
				return false;
			}
			if(existKey(key)){
				delete _items[key];
				
				return true;	
				
			}
			return false;
		}

		/**
		 * DESCRIPTION:Removes an immutable value of an enviornment
		 * @id=removeImmutable
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {} 
		 * @param {} 
		 * -------------------------------------
		 * RETURNS:
		 * @return {}
		 * -------------------------------------
		 * NOTES:
		 * (a)By definition, you shouldn't be able to remove an immutable value, but this might be useful for debugging
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */		
		public function removeImmutable(key:String):Boolean{
			if(existImmutableKey(key)){
				delete _immutableItems[key];
				return true;	

			}
			return false;
		}		


	}
	
}