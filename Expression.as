package com.google.code.p.Mallory
{
	import mx.messaging.AbstractConsumer;
	
	public class Expression 
	{
		public function Expression(newRepresentation:*="",newIndependantVariables:Array=null){
			_representation = new String(newRepresentation);
			_indeVars = newIndependantVariables;
			
			if(_indeVars == null){
				_indeVars = [];
			}
		}
		
		private var _representation:String;
		private var _indeVars:Array;
		

		
		public function indeVarString():String{
			return _indeVars.join(",");
		}
		
		public function toString(expanded:Boolean=true,name:String="function"):String{
			if(expanded){
				return name + "("+indeVarString()+")=" + _representation;				
			}
			return _representation;

		}
		
		public function evaluate(values:*=null,enviornment:Enviornment=null):*{
			var subEnviornment:Enviornment;
			var i:uint;
			if(!(values is Array)){
				values = [values]
			}		
			
			if(enviornment==null){
				subEnviornment = new Enviornment();
				for(i=0; i<_indeVars.length; i++){
					subEnviornment.assign(_indeVars[i],values[i]);
				}
				return StringEvaluator.Evaluate(_representation,subEnviornment)
			}
			
			subEnviornment = enviornment.clone();
			
			for(i=0; i<_indeVars.length; i++){
				subEnviornment.assign(_indeVars[i],values[i]);
			}
			return StringEvaluator.Evaluate(StringEvaluator.Evaluate(_representation,subEnviornment),enviornment);
		}
		

	}
}