package com.google.code.p.Mallory
{
	import org.papervision3d.*;
	import org.papervision3d.core.geom.Face3D;
	import org.papervision3d.core.geom.Mesh3D;
	import org.papervision3d.core.geom.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.objects.DisplayObject3D;	
	public class Graph3DUtils
	{
		
		
		//This functions creates a vector of elements bases on a 2-dimensional range and a given formula
		//It's recommend that the binaryOperation return a point
		public static function DualRangeVector(binaryOperation:Object,xMin:Number=-10,xMax:Number=10,xStep:Number=1,yMin:Number=-10,yMax:Number=10,yStep:Number=1):Vector{
			var xValues:Vector = VectorUtils.ArithmeticSequence(xMin,xMax,xStep);
			return VectorUtils.Transform(xValues,
					function(x:Number):Vector{ 
						var yValues:Vector = VectorUtils.ArithmeticSequence (yMin,yMax,yStep);
						return VectorUtils.Transform(yValues, function (y:Number):*{
							return binaryOperation(x,y);
						});
						
					}
				);	
	
		}
		

		//WARNING: NOT YET READY		
		//This functions creates a vector of elements bases on an N-dimensional range and a given formula
		//The variables mins,maxes,steps as well as the argument passes to NOperation should all be arrays of length N
		//It's recommend that the NOperation return a point
		//I'm not even yet sure if this is goign to work, but I'll try
		public static function NRangeVector(NOperation:Object,mins:Array,maxes:Array,steps:Array):Vector{
			var xValues:Vector = VectorUtils.ArithmeticSequence(mins.shift(),maxes.shift(),steps.shift());
			if(mins.length==0){
					return VectorUtils.Transform(xValues, function(xArray:Array):*{
						return NOperation(xArray)
					}
				);
			}else{
				return null;
				//VectorUtils.NRangeVector((xValues, NRangeVector(NOperation,mins,maxes,steps));
			}
		}	
		
		
		
		
		
		
		
		
		
		
		
		
		
		public static function PointToDisplayObject2D():void{
		}
		public static function PlaceDisplayObject3D(displayObject:DisplayObject3D,point:*,altProperties:Array=null):DisplayObject3D{

			
			displayObject.x=0;
			displayObject.y=0;
			displayObject.z=0;
			displayObject.scaleX = displayObject.scaleY = displayObject.scaleZ = 1;
			
			
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
					displayObject.z = point.z;
				}									
				if(point is Vector && point.t){
					displayObject.scaleX = displayObject.scaleY = displayObject.scaleZ = point.t;
				}	
			}
			return displayObject;
		}
		
		public static function Create3DCurveSegment(firstPoint:*,secondPoint:*,color:uint=0x000000, alpha:Number=1,planeThickness:Number=1,planeAngle:Number=0):Mesh3D{
				planeThickness/=2;			
				var a:Vertex3D = new Vertex3D(firstPoint.x,firstPoint.y,firstPoint.z);
				var b:Vertex3D = new Vertex3D(secondPoint.x,secondPoint.y,secondPoint.z);

				
				var cm:ColorMaterial = new ColorMaterial(color,alpha);
				cm.oneSide = false;
				
				var phi:Number = 90-RealMath.RadiansToDegrees(Math.atan2(b.y-a.y,b.x-a.x));
				var a1:Vertex3D = new Vertex3D(a.x - Math.cos(phi)*planeThickness*Math.cos(planeAngle),a.y + Math.sin(phi)*planeThickness*Math.sin(planeAngle))
				var a2:Vertex3D = new Vertex3D(a.x + Math.cos(phi)*planeThickness*Math.cos(planeAngle),a.y - Math.sin(phi)*planeThickness*Math.sin(planeAngle))
				var b1:Vertex3D = new Vertex3D(b.x - Math.cos(phi)*planeThickness*Math.cos(planeAngle),b.y + Math.sin(phi)*planeThickness*Math.sin(planeAngle))
				var b2:Vertex3D = new Vertex3D(b.x + Math.cos(phi)*planeThickness*Math.cos(planeAngle),b.y - Math.sin(phi)*planeThickness*Math.sin(planeAngle))				
			
				
				var lineFace1:Face3D = new Face3D([a1,b1,a2]);
				var lineFace2:Face3D = new Face3D([b1,b2,a2]);
				return new Mesh3D(cm,lineFace1.vertices.concat(lineFace2.vertices),[lineFace1,lineFace2]);	
		}

		public static function Create3DPrism(firstPoint:*,secondPoint:*,color:uint=0x000000, alpha:Number=1,planeThickness:Number=1):Mesh3D{
				planeThickness/=2;
				//planeThickness*=0;			
				var a:Vertex3D = new Vertex3D(firstPoint.x,firstPoint.y,firstPoint.z);
				var b:Vertex3D = new Vertex3D(secondPoint.x,secondPoint.y,secondPoint.z);
				var vertices:Array = new Array();
				
				
				var cm:ColorMaterial = new ColorMaterial(color,alpha);
				cm.oneSide = false;
				
				var phi:Number = 90-RealMath.RadiansToDegrees(Math.atan2(b.y-a.y,b.x-a.x));
				var a1:Vertex3D = new Vertex3D(a.x - Math.cos(phi),a.y + Math.sin(phi)*planeThickness,a.z)
				var a11:Vertex3D = new Vertex3D(a1.x,a1.y,a1.z+planeThickness)
				var a12:Vertex3D = new Vertex3D(a1.x,a1.y,a1.z-planeThickness)				
				
				var a2:Vertex3D = new Vertex3D(a.x + Math.cos(phi),a.y - Math.sin(phi)*planeThickness,a.z)
				var a21:Vertex3D = new Vertex3D(a2.x,a2.y,a2.z+planeThickness)				
				var a22:Vertex3D = new Vertex3D(a2.x,a2.y,a2.z-planeThickness)				
				
				var b1:Vertex3D = new Vertex3D(b.x - Math.cos(phi),b.y + Math.sin(phi)*planeThickness,a.z)
				var b11:Vertex3D = new Vertex3D(b1.x,b1.y,b1.z+planeThickness)
				var b12:Vertex3D = new Vertex3D(b1.x,b1.y,b1.z-planeThickness)				
				
				var b2:Vertex3D = new Vertex3D(b.x + Math.cos(phi),b.y - Math.sin(phi)*planeThickness,a.z)				
				var b21:Vertex3D = new Vertex3D(b2.x,b2.y,b2.z+planeThickness)				
				var b22:Vertex3D = new Vertex3D(b2.x,b2.y,b2.z-planeThickness)	


				var A1:Face3D = new Face3D([a11,a12,a22])
				vertices = vertices.concat(A1.vertices);
				var A2:Face3D = new Face3D([a11,a21,a22])
				vertices = vertices.concat(A2.vertices);
				
				var B1:Face3D = new Face3D([b11,b12,b22])
				vertices = vertices.concat(B1.vertices);
				var B2:Face3D = new Face3D([b11,b21,b22])
				vertices = vertices.concat(B2.vertices);				
				
				var C1:Face3D = new Face3D([a11,a21,b21])
				vertices = vertices.concat(C1.vertices);
				var C2:Face3D = new Face3D([a11,b11,b21])
				vertices = vertices.concat(C2.vertices);

				var D1:Face3D = new Face3D([a21,b21,b22])
				vertices = vertices.concat(D1.vertices);
				var D2:Face3D = new Face3D([a21,a22,b22])
				vertices = vertices.concat(D2.vertices);				
				
				var E1:Face3D = new Face3D([a22,b22,b12])
				vertices = vertices.concat(E1.vertices);
				var E2:Face3D = new Face3D([a22,a12,b12])
				vertices = vertices.concat(E2.vertices);

				var F1:Face3D = new Face3D([a12,a11,b11])
				vertices = vertices.concat(F1.vertices);
				var F2:Face3D = new Face3D([a12,b12,b11])
				vertices = vertices.concat(F2.vertices);				

				return new Mesh3D(cm,vertices,[A1,A2,B1,B2,C1,C2,D1,D2,E1,E2,F1,F2]);	
		}

		public static function VectorTo3DCurve(points:Vector,color:uint=0,alpha:Number=1,planeThickness:Number=1,planeAngle:Number=0):DisplayObject3D{
			//I think there may be a problem here. I think i'm supposed to be able to use a sprite as a component, but i can't add it to the display list because "TypeError: Error #1034: Type Coercion failed: cannot convert flash.display::Sprite@1a18e41 to mx.core.IUIComponent."
			var container:DisplayObject3D  = new DisplayObject3D();

			for(var i:int = 0; i<points.length-1; i++){
				container.addChild(Create3DPrism(points[i],points[i+1],color,alpha,planeThickness));
			}
			
			return container;
			
		}		
		
		public static function VectorTo3DPrism(points:Vector,color:uint=0,alpha:Number=1,planeThickness:Number=1):DisplayObject3D{
			//I think there may be a problem here. I think i'm supposed to be able to use a sprite as a component, but i can't add it to the display list because "TypeError: Error #1034: Type Coercion failed: cannot convert flash.display::Sprite@1a18e41 to mx.core.IUIComponent."
			var container:DisplayObject3D  = new DisplayObject3D();
			
			for(var i:int = 0; i<points.length-1; i++){
				container.addChild(Create3DPrism(points[i],points[i+1],color,alpha,planeThickness));
			}
			
			return container;
			
		}		
		
		
		
		
		
		
		public static function PlaceDisplayObject3DBarGraph(displayObject:DisplayObject3D,point:*,barWidth:Number=40):DisplayObject3D{

			
			displayObject.x=0;
			displayObject.y=0;
			displayObject.z=0;
			displayObject.scaleX = displayObject.scaleY = displayObject.scaleZ = 1;

			if(point.x){
				displayObject.x = point.x;
			}
			if(point.y){
				displayObject.y = point.y;
			}					
			if(point.z){
				displayObject.z = point.z;
				//displayObject.height = point[2];
			}
	
			return displayObject;
		}		
		
		
		
		
		
		
		
		
		
		public static function PolygonToMesh3D(polygon:Polygon,color:uint=0,alpha:Number=1):Mesh3D{
			var vertexArray:Array = new Array();
			var faceArray:Array = new Array();
			
			var degenerate:Polygon = polygon.clone();
			
			while(degenerate.length>2){
				var face:Face3D = new Face3D([new Vertex3D(degenerate.vertex(0).x, degenerate.vertex(0).y,degenerate.vertex(0).z),
												new Vertex3D(degenerate.vertex(1).x, degenerate.vertex(1).y,degenerate.vertex(1).z),
												new Vertex3D(degenerate.vertex(2).x, degenerate.vertex(2).y,degenerate.vertex(2).z)]);
				for(var j:int = 0; j<face.vertices.length;j++){
					vertexArray.push(face.vertices[j])
				}
				
				faceArray.push(face);
				degenerate.splice(1,1);
			}


			var colorMaterial:ColorMaterial = new ColorMaterial(color,alpha);
			colorMaterial.oneSide = false;
			return new Mesh3D(colorMaterial,vertexArray,faceArray);			
		}
		
		
		

		
		
		public static function PointMatrixToMesh3D(vector:Vector,color1:uint=0,alpha1:Number=1,color2:uint=0xffffff,alpha2:Number=1):Mesh3D{
			
			var vertexArray1:Array = new Array();
			var vertexArray2:Array = new Array();
			var faceArray1:Array = new Array();
			var faceArray2:Array = new Array();			
			var face:Face3D;
			var k:uint;
			
			
			//first sweep
			var colorMaterial1:ColorMaterial = new ColorMaterial(color1,alpha2);
			colorMaterial1.oneSide = false;							
			for(var i:uint=0; i<VectorUtils.Width(vector)-1; i++){
				for(var j:uint=0; j<VectorUtils.Height(vector)-1;j++){
					if(vector[i][j] !=null && vector[i+1] && vector[i][j+1]){
						face = new Face3D([new Vertex3D(vector[i][j].x, vector[i][j].y,vector[i][j].z),
											new Vertex3D(vector[i+1][j].x, vector[i+1][j].y,vector[i+1][j].z),
											new Vertex3D(vector[i][j+1].x, vector[i][j+1].y,vector[i][j+1].z)]);
						
						for(k = 0; k<face.vertices.length;k++){
							vertexArray1.push(face.vertices[k])
						}
						faceArray1.push(face);												
											
					}
				}
			}
			
			//second sweep
			var colorMaterial2:ColorMaterial = new ColorMaterial(color2,alpha2);
			colorMaterial2.oneSide = false;				
			for(i=1; i<VectorUtils.Width(vector);i++){
				for(j=1; j<VectorUtils.Height(vector);j++){
					if(vector[i][j] !=null && vector[i-1] && vector[i][j-1]){
						face = new Face3D([new Vertex3D(vector[i][j].x, vector[i][j].y,vector[i][j].z),
											new Vertex3D(vector[i-1][j].x, vector[i-1][j].y,vector[i-1][j].z),
											new Vertex3D(vector[i][j-1].x, vector[i][j-1].y,vector[i][j-1].z)]);
						
						for(k = 0; k<face.vertices.length;k++){
							vertexArray2.push(face.vertices[k])
						}
						faceArray2.push(face);																	
						
					}
				}
			}			
			
			var finalMesh:Mesh3D = new Mesh3D(null,null,null);
			finalMesh.addChild(new Mesh3D(colorMaterial1,vertexArray1,faceArray1));
			finalMesh.addChild(new Mesh3D(colorMaterial2,vertexArray2,faceArray2));
			return finalMesh;
			
			
			if(useFirst){
				return new Mesh3D(colorMaterial1,vertexArray1,faceArray1)	
			}
			return new Mesh3D(colorMaterial2,vertexArray2,faceArray2)
			
		}		

	}
}