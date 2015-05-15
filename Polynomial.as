package com.google.code.p.Mallory
{
	public dynamic class Polynomial extends Vector
	{
		
		public function Polynomial(...rest) {
			if(rest.length == 1 && rest[0] is int ){
				super (rest[0]);
			}else{
				for(var i:uint=0; i<rest.length; i++){
				this[i]=rest[i];
				}
			}
		
		}
		public function degree():Number{
			return length -1;
		}		
		public function derivative():Polynomial{
			
			var der:Polynomial = new Polynomial()
			
			for(var i:int=0; i < length; i++){
					der.push(this[i]* i);
				}
				der.splice(0,1);
				
			return der;
		}
		
		public function antiderivative():Polynomial{
			
			var der:Polynomial = new Polynomial()
			
			der.push(0);			
			for(var i:int=1; i < length; i++){
					der.push(this[i-1]/ i);
				}

				
			return der;
		}
		
		public static function Multiply(a:Polynomial, b:Polynomial):Polynomial{
			var product:Polynomial = new Polynomial();
	
			for(var i:int = 0; i < a.dimension.value; i++){
				for(var j:int = 0; j < b.dimension.value; j++){
					if(!product[i+j]){
						product[i+j] = 0;
					};
					product[i+j] = product[i+j]+(a[i]*b[j]);
				}				
			}
		
			return product;
		}
		

		
		
		
		public  function toPolyString(variable:String = "x", descending:Boolean = true):String{
			var rep:Array = new Array();
			var i:int;
			
			if(descending){
				for(i = length-1; i>-1; i--){
					if(i == 0){
					rep.push(this[i]);					
					}else if(i ==1){
					rep.push(this[i] +"*"+variable);					
					}else{
					rep.push(this[i] +"*"+variable+ "^" + i);
					}
								
				}
			}else{
				for(i = 0; i<length; i++){
					if(i == 0){
					rep.push(this[i]);					
					}else if(i ==1){
					rep.push(this[i] +"*"+variable);					
					}else{
					rep.push(this[i] +"*"+variable+ "^" + i);
					}				
				}
			}
			return rep.join("+");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}