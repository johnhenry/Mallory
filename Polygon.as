package com.google.code.p.Mallory
{
	public dynamic class Polygon extends Vector
	{
		public function Polygon(...rest)
		{

			if(rest.length == 1 && rest[0] is int ){
				super (rest[0]);
			}else{
				for(var i:uint=0; i<rest.length; i++){
				this.push(null);
				this[i]=rest[i];
				}
			}
		}

		public function vertex(index:uint):*{
			
			return this[IntegerMath.Modulus(index,length)];
		
		
		}
		
		public function get vertexCount():uint{
			return this.length;
		}
		
		public function get edgeCount():uint{
			
			if(vertexCount <3) return this.length - 1;
			return vertexCount;

		}
		
		public function edge(index:uint):Polygon{
			
			return new Polygon(vertex(index), vertex(index+1));
		
		}
		
		public function perimeter():Number{
			var per:uint;
			for(var i:int = 0; i < edgeCount; i++){
				per += RealMath.DistanceVector(vertex(i),vertex(i+1));
			}
			return per;
		}	
		
		
		private function triArea():Number{

			var A:Number = RealMath.DistanceVector(vertex(0),vertex(1));
			var B:Number = RealMath.DistanceVector(vertex(1),vertex(2));
			var C:Number = RealMath.DistanceVector(vertex(2),vertex(0));						
			var S:Number = (A+B+C)/2;

			return Math.sqrt(S*(S-A)*(S-B)*(S-C));
			
			
		}		
		


		public function area():Number{
			
			if(vertexCount <3) return 0;
			
			if(vertexCount == 3) return triArea();
			
			var tempTangle:Polygon = new Polygon(vertex(0),vertex(1),vertex(2)); 
			var degenerate:Polygon = this.clone();
			degenerate.splice(1,1);


			return tempTangle.triArea()+degenerate.triArea();
		}
		
		//Note:http://board.flashkit.com/board/showthread.php?t=675963
		//Note:cos(ang)=(ab*ab+bc*bc-ac*ac)/(2*ab*bc)
		//Note:Currently Broken
		public function angle(i:int):Number{
			return 0;

			var index:ComplexNumber = new ComplexNumber(i);
			
			var ab:ComplexNumber = VectorMath.DistanceBetween(vertex(index),vertex(index+1));
	
			var bc:ComplexNumber = VectorMath.DistanceBetween(vertex(index),vertex(index-1));			
		
			var ac:ComplexNumber = VectorMath.DistanceBetween(vertex(index+1),vertex(index-1));
			
			//ComplexMath.Divide(ComplexMath.AddArgs(ComplexMath.Square(ab),ComplexMath.Square(bc),ComplexMath.Square(ac).neg()),ComplexMath.MultiplyArgs(ab,bc,2));
			return ComplexMath.Identity(ComplexMath.ArcCosine(ComplexMath.Divide(ComplexMath.AddArgs(ComplexMath.Square(ab),ComplexMath.Square(bc),ComplexMath.Square(ac).neg()),ComplexMath.MultiplyArgs(ab,bc,2))));
		}	
			
		//This function returns a clone of a given polygon.
		public override function clone(deep:Boolean=true):*{
			var newPolygon:Polygon = new Polygon(this.length);
			for(var i:uint=0; i<newPolygon.length; i++){
				if(deep){
					if(this[i] is Vector){
						newPolygon[i] = this[i].clone();
					}else{
						newPolygon[i] = this[i];	
					}
				}else{
					newPolygon[i] = this[i];
				}
				
			}

			return newPolygon;
		}	
		
	}
}