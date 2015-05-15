package com.google.code.p.Mallory
{
	public class Cycle
	{
		//This function creates a new Permutation cycle out of an array of elements
		//Sample Usage: var cyc1:Cycle = new Cycle(["a","b","c"]);
		
		public function Cycle(elements:Array){
			var valid:Boolean = true
			//This code block checks to make sure that elements has no repeats
			for (var i:int = 0; i <elements.length; i ++){
				if (elements.lastIndexOf(elements[i]) !=i ){
					valid = false;
					break;
				}
			
			}
			
			//This assignes _cycle to elements if it has no repeats
			if(valid){
				_elements = elements;
			}
			
		}

		//This is the list of ordered elements of the permutation cycle

		private var _elements:Array;
		public function get elements():Array{
			var newElements:Array = new Array();
			for each (var element:* in _elements){
				newElements.push(element);
			}
			
			return newElements;
		}
		//////////
		//This function returns the length of a cycle
		//////////
		public function get length():int{
			if(elements.length <2){ 
				return 1;
			}
			
			return elements.length;
		}
		
		//This function applys the cycle to an element and returns the new element in the set
		public function apply(element:*):*{
		
			//This code block returns the first element if the given element is the last
			if(element == _elements[_elements.length - 1]){
				return _elements[0];
			}
			//This code block returns the next element in the cycle if it is not the last
			for(var i:int = 0; i < _elements.length; i++){
				if (element == _elements[i]){
					return _elements[i+1];
				}
			}
			//This code block returns the original element if it does not exist within the cycle
			return element;
		
		}
		//This function returns the inverse of a given permutation cycle
		public function inverse():Cycle{
			
			return new Cycle(elements.reverse());
		}
		
		//This function returns the cycle with a representation that is shifted left
		public function shiftedLeft():Cycle{
		
			var newElenemts:Array = elements;

				
			for(var i:int = 0; i < newElenemts.length; i++){
				newElenemts[i] = apply(newElenemts[i]);
			}
			
			return new Cycle(newElenemts);
		}

		//This function returns the cycle with a representation that is shifted right		
		public function  shiftedRight():Cycle{
		
			var newElenemts:Array = elements;
				
			for(var i:int = 0; i < newElenemts.length; i++){
				newElenemts[i] = inverse().apply(newElenemts[i]);
			}
			
			return new Cycle(newElenemts);
		}
		
		//This function returns the cycle represented as a permutation
		public function toPermutation():Permutation{
		
			return new Permutation(elements, this.shiftedLeft().elements);
			//return new Permutation([1],[2]);
		
		}
		
		//Returns the Cycle as a string
		public function toString():String{
			return "(" + elements.toString() + ")";
			
		}
		
		//This function returns true if an element is contained within the permutation cycle
		public function contains(element:*):Boolean{
			for(var i:int = 0; i < elements.length; i++){
				if(element == elements[i]){
					return true;
				}
			}
			return false;
		}
		
		//This returns a cycle as a product of transpositions
		public function transpotions():Array{
		
			var transpositionArray:Array = new Array();
			
			if(length <2){
			
				transpositionArray.push(new Cycle(new Array(0,1)));
				transpositionArray.push(new Cycle(new Array(1,0)));
				return transpositionArray;
			}
			

			for (var i:int = 0; i < length-1; i++)
			{
			transpositionArray.push(new Cycle(new Array(elements[i],elements[i+1])));
			}
			return transpositionArray;
		}
		
		//This function returnst whether or not the cycle is even.
		public function even():Boolean{
		

			
			return (length % 2 == 1);
		
		
		}

		//This function returnst whether or not the cycle is odd.
		public function odd():Boolean{
		
			return !even();
		
		
		}
		
		
		
		//This returns a cycle as an alternate product of transpositions
		public function transpotionsAlt():Array{
			
			var transpositionArray:Array = new Array();
			
			if(length <2){
			
				transpositionArray.push(new Cycle(new Array(0,1)));
				transpositionArray.push(new Cycle(new Array(1,0)));
				return transpositionArray;
			}
			
			for (var i:int = 0; i < length-1; i++)
			{
				transpositionArray.push(new Cycle(new Array(elements[length-2-i],elements[length-1])));
			}
			return transpositionArray;
		}
		
		
		
		
		
		//This function checks to see of two cycles are disjoint
		public static function Equal(sigma:Cycle, tao:Cycle):Boolean{

			if(sigma.length != tao.length){
				return false;
			}
		
			for(var i:int = 0; i < sigma.length; i ++)
			{

					var equalCount:int = 0;
					for(var j:int = 0; j < sigma.length; j++){
						if(sigma.elements[j] == tao.elements[j])
						{
							equalCount++;
						}
										
					}

					if(equalCount == sigma.length){
					
						return true;
					}

				sigma = sigma.shiftedLeft();

			}
			

			return false;
		}
		
		
		
		
		
		//This function checks to see of two cycles are disjoint
		public static function disjoint(sigma:Cycle, tao:Cycle):Boolean{
			
			for(var i:int = 0; i < sigma.length; i++){
				for(var j:int = 0; j < tao.length; j++){
					if (sigma.elements[i] == tao.elements[j]){
						return false;
					}
				}
			}
			
			return true;
			
		}
		
		
	}
}