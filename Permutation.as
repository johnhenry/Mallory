package com.google.code.p.Mallory
{
	public class Permutation
	{
		
		//This function creates a new Permutation out of two arrays or equal lengths
		//Sample Usage: var perm1:Permutation = new Permutation(["a","b","c"],["c", "b", "a");
		public function Permutation(input:Array, output:Array){
			
			//To Be Added:each array must contain no repeats
			//To Be Addes:each array must contain the elements of the other array
			//This code block checks to see if the domain and range have the same length
			if(input.length == output.length){
				_domain = input;
				_coDomain = output;
			
			}
		
		}
		//This is the domain of the permutation
		private var _domain:Array;
		public function get domain():Array{
			
			var newElements:Array = new Array();
			for each (var element:* in _domain){
				newElements.push(element);
			}
			
			return newElements;
		
		}
		
		//This is the codomain of the permutation
		private var _coDomain:Array;
		public function get coDomain():Array{
			
			var newElements:Array = new Array();
			for each (var element:* in _coDomain){
				newElements.push(element);
			}
			
			return newElements;		
		}
		//This function applys the permutation to an element and returns the new element in the set
		public function apply(element:*):*{
			//This code block returns the corresponding element in the codomain if it is in the set
			for(var i:int = 0; i < _domain.length; i++){
				if (element == _domain[i]){
					return _coDomain[i];
				}
			}
			//This code block returns the original element if it is not in the permutation domain
			return element;
			
		
		
		
		}
		//This function returns the inverse of a given permutation
		public function inverse():Permutation{
		
			//returns the inverse permutation by switching the domain and codomain
			return new Permutation(this.coDomain,this.domain)
		
		}
		
		//Raises a given permutation to a power
		public function power(pow:int):Permutation{
		
			if(pow == 0) return Identity;
			if(pow == 1) return this;
			if(pow == -1) return this.inverse();
			
			var newPermutation:Permutation = this;
			var oldPermutation:Permutation = this;
			
			//this code block changes the sign of the permutation 
			if (pow < -1){
				newPermutation = this.inverse();
				oldPermutation = this.inverse();
				pow *=-1;
			}

			
			while(pow > 1){
				newPermutation = Compose(newPermutation, oldPermutation)
				pow--;
			}
			
			return newPermutation;

		
		}
		
		//Returns the Permutation as a string
		public function toString():String{
			
			var tempString:Array = new Array();
			for(var i:int = 0; i < domain.length; i ++){

				tempString.push(domain[i].toString()+ " -> " + coDomain[i].toString());
			}
			
			
			return "(" + tempString.toString() + ")";
			
		}
		
		//This function converts the permutation into an array of cycles
		public function cycles():Array{
		
			var tempPerm:Permutation = new Permutation(domain, coDomain);
			var cycles:Array = new Array();
			var tempArray:Array = new Array();

			while(tempPerm.domain.length >0){

				var start:* = tempPerm.domain[0];
				var current:* = start;

				do{

				tempArray.push(current);
				current = apply(current)

				for(var i:int = 0; i < tempPerm.coDomain.length; i ++){

					if(current == tempPerm.coDomain[i]){
						
						tempPerm._domain.splice(i,1);
						tempPerm._coDomain.splice(i,1);
						break;
					}
				
				
				}
				
				
				}while(current != start)
				
			cycles.push(new Cycle(tempArray));
			tempArray = new Array();
			}
			
			return cycles;
				
				
		}
		
		public function order():int{
		
			var cycleArray:Array = cycles();
			
			var lengthArray:Array = new Array();
			
			for(var i:int; i<cycleArray.length; i++){
				lengthArray.push(new ComplexNumber(cycleArray[i].length));				
			}
		
		return IntegerMath.LCMList(lengthArray).value;
		
		
		
		
		
		
		}
		
		public static var Identity:Permutation = new Permutation(new Array(), new Array())
		
		
		
		
		//This function composes two permutations into one 
		public static function Compose(sigma:Permutation, tao:Permutation):Permutation{
			
			//This is the new domain for the new permutation
			var newDomain:Array = sigma.domain.concat(tao.domain);
						
			//This is the new coDomain for the new permutation
			var newCoDomain:Array = new Array();
			//This code deletes duplicate elements in an array
			for (var i:int = 0; i <newDomain.length; i ++){
				if (newDomain.lastIndexOf(newDomain[i]) !=i ){
					newDomain.splice(newDomain.lastIndexOf(newDomain[i]),1);
					i--;
				}
			
			}
					
			//This constructs a new codomain by applying tao, and then sigma to the new domain
			for(i = 0; i < newDomain.length; i++){
				newCoDomain.push(sigma.apply(tao.apply(newDomain[i])));
						
			}
			return new Permutation(newDomain, newCoDomain);
			
		
		
		}
		
		public static function Compose_List(list:Array):Permutation{
		
			if(list.length == 0) return Permutation.Identity; 
			
			if(list.length == 1) return list[0];
			
			while(list.length >2){
				list[0] = Compose(list[0],list[1]);
				list.splice(1,1)
			}
			
			return Compose(list[0],list[1]);
				
		}
		
		//This function tests if two permutations are equal
		public static function Equal(sigma:Permutation, tao:Permutation):Boolean{
		
			for(var i:int = 0; i<sigma.domain.length; i++){
				if(sigma.apply(sigma.domain[i]) != tao.apply(sigma.domain[i])){
					return false;
				}
			}
			for(i = 0; i<tao.domain.length; i++){
				if(tao.apply(tao.domain[i]) != sigma.apply(tao.domain[i])){
					return false;
				}
			}
			return true;
		
		}
		//This function tell whether or not two permutations commute
		public static function Commute(sigma:Permutation, tao:Permutation):Boolean{
		
		if(Equal( Compose(sigma, tao),Compose(tao,sigma)))
		{
		return true;
		}
		return false;
		
		}
		
		
		
		
	}
}