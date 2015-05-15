package com.google.code.p.Mallory
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	
	import mx.core.*;

	public class GraphUtils
	{
		
		
		
		
		
		//This functions creates a vector of elements bases on a 1-dimensional range and a given formula
		//It's recommend that the unaryOperation return a point
		public static function SingleRangeVector(unaryOperation:Object,xMin:Number=-10,xMax:Number=10,xStep:Number=1):Vector{
				var xValues:Vector = VectorUtils.ArithmeticSequence(xMin,xMax,xStep);
				return VectorUtils.Transform(xValues, function(x:Number):*{
					return unaryOperation(x)
					}
				);
		}	
		
		
		public static function PlaceDisplayObject(displayObject:DisplayObject,point:*,altProperties:Array=null):DisplayObject{
			displayObject.x=0;
			displayObject.y=0;
			displayObject.scaleX = displayObject.scaleY = 1;
			
			if(altProperties){
				var max:uint = Math.max(point.length,altProperties.length)
				for(var i:int=0; i<max; i++){
					displayObject[altProperties[i]] = point[i];
				}	
			}else{
					if(point.x){
						displayObject.x = point.x;
					}
					if(point.y){
						displayObject.y = point.y;
					}				
					if(point.z){
						//displayObject.width = displayObject.height = point.z
						displayObject.scaleX = displayObject.scaleY= Math.abs(point.z);
					}	
				
			
			}
			return displayObject;
		}
		
		public static function PlaceDisplayObjectBarGraph(displayObject:DisplayObject,point:*,barWidth:Number=40):DisplayObject{
			displayObject.x=0;
			displayObject.y=0;
			displayObject.scaleX = displayObject.scaleY = 1;
			displayObject.width=barWidth;
			
			if(point.x){
				if(point.x<0){
					
				}
				displayObject.x = point.x;
			}
			if(point.y){
				if(point.y<0){
					displayObject.scaleY *=-1;
				}
				displayObject.height = point.y;
			}

			return displayObject;
		}
		
		public static function PlaceDisplayObjects(displayObjects:Vector, points:Vector,altProperties:Array=null,barGraph:Boolean=false,barWidth:Number=40):UIComponent{
			var container:UIComponent = new UIComponent();

			for(var i:int = 0; i<displayObjects.length; i++){

				container.addChild(PlaceDisplayObject(displayObjects[i],points[i],altProperties))
			}

			return container;
		}
		
		public static function PlaceDisplayObjectsBarGraph(displayObjects:Vector, points:Vector,barWidth:Number=40):UIComponent{
			var container:UIComponent = new UIComponent();

			for(var i:int = 0; i<displayObjects.length; i++){

				container.addChild(PlaceDisplayObjectBarGraph(displayObjects[i],points[i],barWidth))
			}

			return container;
		}		
		
		
		
	
		public static function VectorToCurve(points:Vector,thickness:Number=0,color:uint=0,alpha:Number=1,pixelHinting:Boolean=false,scaleMode:String = "normal",caps:String=null,joints:String=null,miterLimit:Number=3):UIComponent{
			//I think there may be a problem here. I think i'm supposed to be able to use a sprite as a component, but i can't add it to the display list because "TypeError: Error #1034: Type Coercion failed: cannot convert flash.display::Sprite@1a18e41 to mx.core.IUIComponent."
			var container:UIComponent  = new UIComponent();
			var g:Graphics = container.graphics;

			g.lineStyle(thickness,color,alpha,pixelHinting,scaleMode,caps,joints,miterLimit);

			g.moveTo(points[0][0],points[0][1]);
			for(var i:int = 1; i<points.length; i++){
				g.lineTo(points[i].x,points[i].y);
			}
			
			return container;
			
		}		
		
		public static function PolygonToCurve(polygon:Polygon,strokeThickness:Number=0,strokeColor:uint=0,strokeAlpha:Number=1,fillColor:uint=0xffffff, fillAlpha:Number=1,pixelHinting:Boolean=false,scaleMode:String = "normal",caps:String=null,joints:String=null,miterLimit:Number=3):UIComponent{
			//I think there may be a problem here. I think i'm supposed to be able to use a sprite as a component, but i can't add it to the display list because "TypeError: Error #1034: Type Coercion failed: cannot convert flash.display::Sprite@1a18e41 to mx.core.IUIComponent."
			var component:UIComponent  = new UIComponent();
			var g:Graphics = component.graphics;

			g.lineStyle(strokeThickness,strokeColor,strokeAlpha,pixelHinting,scaleMode,caps,joints,miterLimit);
			g.beginFill(fillColor,fillAlpha);
			g.moveTo(polygon.vertex(0).x,polygon.vertex(0).y);
			for(var i:int = 1; i<=polygon.edgeCount; i++){
				g.lineTo(polygon.vertex(i).x,polygon.vertex(i).y);
			}
			g.endFill();
			return component;
			
		}	


	}
}