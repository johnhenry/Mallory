package com.google.code.p.Mallory
{
	import mx.validators.ValidationResult;
	
	public class VectorUtils
	{	
		/////
		//////////
		///////////////
		//Section 0 : Glossary 
		///////////////
		//////////
		/////

		//Multi-Dimensional, adj. - An vector is multi dimensional if it contains elements which are also vectors.  	
		//Flat (Completley), adj. - A vector is flat if it contains no elements which are also vectors
		//End Node, n. - An element is an end node if exists somewhere in a vector (single or multi-dimensional) and is not itself a vector
		//Depth, n. - A vector's depth is the length of the path from it's top level to one of it's end nodes. Note: Depth may very depending on which path is choosen. 
		//Matrix, n. - A matrix is a vector who's elemenst are all vector of equal length	
		
		/////
		//////////
		///////////////
		//Section I : Generic Vectors 
		//These are functions for manipulating generic vectors
		///////////////
		//////////
		/////
		
		///////////////
		//1:Truth Functions and Comparison
		//These functions test conditions on a vector
		///////////////
		
		
		//This function returns true if and only if the given argument is a vector
		public static function IsVector(e:*):Boolean{
			return e is Vector;
		}
		//This function returns true if and only if the given argument is not a vector.
		public static function IsNotVector(e:*):Boolean{
			return !(e is Vector);
		}
		//This function returns true if and only if the given vector is multidimensional
		public static function IsMultiDimensional(vector:Vector, vectorCriterion:Object=null):Boolean{
			var answer:Boolean = true;
			if(vectorCriterion ==null){
				vectorCriterion = IsVector; 
			}
			
					
			for each(var e:* in vector){
				if(!vectorCriterion(e)){
					answer = false;
					break;
				}
			} 
			return answer;
		}
		
		//This function returns true if and only if a given element is in a vector
		public static function Contains(vector:Vector, element:*=null, equalityFunction:Object=null):Boolean{
			if(equalityFunction ==null){
				return vector.lastIndexOf(element) !=-1;	
			}

			for each (var i:* in vector){
				if(equalityFunction(element, i)) return true;
			}
			
			return false;
		}
		
		
		
		
		//This function returns the longer of two vectors. If they are both equal in length, it returns the first.
		public static function Longer(alpha:Vector, beta:Vector):Vector{
			if(Math.max(alpha.length,beta.length)==alpha.length) return alpha;
			return beta;
		}
		//This function returns the shorter of two vectors. If they are both equal in length, it returns the second.		
		public static function Shorter(alpha:Vector, beta:Vector):Vector{
			if(Math.max(alpha.length,beta.length)==alpha.length)  return beta;
			return alpha;
		}		
		
		
		//This function returns true if and only if the given argument is not a vector.
		public static function IsNotMultiDimensional(vector:Vector, vectorCriterion:Object=null):Boolean{
			return !(IsMultiDimensional(vector,vectorCriterion));
		}
		
		//This runction returns true if and only if a vector is completely flat
		public static function IsFlat(vector:Vector,vectorCriterion:Object=null):Boolean{
			return IsNotMultiDimensional(vector,vectorCriterion);
		}							
		
		///////////////
		//2:Constructors
		//These functions create vectors from objects that aren't other objects
		///////////////
						
		//This function returns a vector populated by an arithmetic sequence up to a specified limit
		public static function ArithmeticSequence(seed:Number=0,limit:Number=100,step:Number=1):Vector{
			var newVector:Vector = new Vector();
			
			
			if(step >0){
				if(limit<seed){
					limit=seed;
				}
				while(seed <= limit){
					newVector.push(seed);
					seed +=step;
				}
					
			}else if(step <0){
				if(limit>seed){
					limit=seed;
				}
				while(seed >= limit){
					newVector.push(seed);
					seed +=step;
				}	
			}else{
				newVector.push(seed);
			}
			return newVector;
		}
		
		public static function ArithmeticBounds(lower:Number, upper:Number, size:uint):Vector{
			return ArithmeticSequence(lower, (upper-lower)/size, upper);
		}		
		
		
		
		//This function returns a vector populated by a geometric sequence up to a specified limit		
		public static function GeometricSequence(seed:Number=1,limit:Number=1000,step:Number=2):Vector{
			var newVector:Vector = new Vector();

			
			if(Math.abs(step) >1){
				if(Math.abs(limit)<Math.abs(seed)){
					limit=seed;
				}
				while(seed <= Math.abs(limit)){
					newVector.push(seed);
					seed *=step;
				}	
			}else if(Math.abs(step) <1 && step!=0){
				if(Math.abs(limit)<Math.abs(seed)){
					limit=seed;
				}
				while(seed >= Math.abs(limit)){
					newVector.push(seed);
					seed *=step;
				}	
			}else{
				newVector.push(seed);
			}
			return newVector;
		}
		
		//This function creates a vector of a certain length filled copies of an element e
		public static function ConstantVector(length:uint=1,e:*=null):Vector{
			var newVector:Vector = new Vector();
			for(var i:int=0; i<length; i++){
				newVector.push(e);
			}
			return newVector;
		}
		
		//This function creates a vector from an array
		public static function FromArray(array:Array):Vector{
			var newVector:Vector = new Vector();
				for each(var e:* in array){
					newVector.push(e);
				}
			return newVector;
		}
		
		//This function merges two elements into a single vetor.
		//If one element is not a vector, then it is merged into the other
		//If both elements are not a vector, then they are merged to form a single vector of length two.
		public static function Merge(vectorA:*=null,vectorB:*=null):Vector{
			var copy:Vector;
			if(vectorA is Vector && vectorB is Vector){
				return Vector.ArrayToVector(vectorA.concat(vectorB));
			}else if(vectorA is Vector){
				copy= vectorA.clone();
				copy.push(vectorB);
				return copy;
			}else if(vectorB is Vector){
				copy = vectorB.clone();
				copy.addElement(vectorB,0);
				return copy;
			}
			return new Vector(vectorA,vectorB);
		}				
		
		//This function creates a vector populated by a recursive sequence.
		//If keep is set to false, then the sequence generated then the seed changes at each successive call and has a fixed length;
		//When this is used, the formual should generated new elements based on a constant place in the seed array
		//formula = function(seeds:Array):*{return seeds[0] + [1]} 
		/////////////////
		//If keep is set to true, then the sequence generated is used as the seed array for each successive element
		//When this is used, the formual should generated new elements based on the length of the seed sequence
		//formula = function(seeds:Array):*{return seeds[seeds.length-1] + [seeds.length-2]}
		/////////////////
		//These are only suggestions for the usage of the keep. Just make sure that the parameters remain valid for each sussessive call to formula
		public static function RecursiveSequence(seeds:Array, formula:Object, endCondition:Object,keep:Boolean=false):Vector{
			var newVector:Vector = new Vector();
			for each(var e:* in seeds){
				newVector.push(e)
			}
			
			if(keep){
				//In the case that keep is true, the sequence works off of it's ever increasing self
				while(!endCondition(newVector)){
					newVector.push(formula(newVector));
				}				
				
			}else{
				//In the case that keep is false, the sequence works only off of an array of seeds of a fixed length
				while(!endCondition(seeds)){
					newVector.push(formula(seeds));
					seeds.shift();
					seeds.push(newVector[newVector.length-1]);
				}	
			}
			return newVector;
		}
		
		//WARNING: Will not return a vector if depth is set to 0
		//This function wraps each element of a vector in a vector making it multidimensional
		public static function Wrap(element:*, depth:uint=1):*{

			if(depth==0){
				return element;
			}
			var newVector:Vector = new Vector();
			newVector.push(element);			
			newVector = Wrap(newVector,depth-1);
			return newVector;
			
		}	
		
	
		
		
		

		//WARNING: REQUIRES INTERNET CONNECTIONS
		//This function returns a vector populed by a an integer sequence retrieved form the On-Line E? of Integer Sequences(http://www.research.att.com/~njas/sequences/)
		public static function FromOEIS(selection:uint=1):Vector{
			//
			var searchURL:String = "http://www.research.att.com/~njas/sequences/table?a="+selection+"&fmt=4"
			var vectorString:String;
			//Place Holder Code
			switch(selection){
				case 1: vectorString = "1,2,3"; break;
				case 2: vectorString = "4,5,6"; break;
				case 3: vectorString = "7,8,9"; break;
				default: vectorString = "0,0,0";
			}
			//End Place Holder Code
			
			return Transform(FromArray(vectorString.split(",")),int);
		}	

		///////////////
		//3:Vector Transformations
		//These functions change vectors into other objects
		///////////////
		
		public static function FillByIndex(v:Vector,undaryOperation:Object):Vector{
			var newVector:Vector = new Vector(v.length);
			for(var i:int = 0; i<newVector.length; i++){
					newVector[i]= undaryOperation(i);
			}
			return newVector;
			
		}
		
		//This function transforms each element in a vector according to a unary opperation
		public static function Transform(vector:Vector,unaryOperation:Object):Vector{
			var newVector:Vector = new Vector();
			for each(var e:* in vector){
				newVector.push(unaryOperation(e));
			}
			return newVector;
		}
		//This function replaces each element in a vector with another specified element
		public static function Replace(vector:Vector,element:*):Vector{
			var newVector:Vector = new Vector();
			for each(var e:* in vector){
				newVector.push(element);
			}
			return newVector;
		}		
		
		//This function transforms each end node in a vector according to a unary opperation
		//An additional criterion may be specified to recognize an element as an end node.
		public static function TransformEndNodes(vector:Vector,unaryOperation:Object, endNodeCriterion:Object = null):Vector{
			var newVector:Vector = vector.clone();
			var level:int;
			if(endNodeCriterion == null){
				endNodeCriterion = IsNotVector;
			}
			
			
			for(var i:uint = 0; i<newVector.length; i++){
				if(endNodeCriterion(newVector[i]) || !(newVector[i] is Vector)){
					newVector[i] = unaryOperation(newVector[i]);
				}else{
					newVector[i] = TransformEndNodes(newVector[i],unaryOperation); 
				}
				
			}
			return newVector;
		}
		//This function replaces each end node in a vector with a specified element
		//An additional criterion may be specified to recognize an element as an end node.
		public static function ReplaceEndNodes(vector:Vector,element:*, endNodeCriterion:Object = null):Vector{
			var newVector:Vector = vector.clone();
			var level:int;
			
			if(endNodeCriterion == null){
				endNodeCriterion = IsNotVector;
			}
					
			for(var i:uint = 0; i<newVector.length; i++){
				if(endNodeCriterion(newVector[i]) || !(newVector[i] is Vector)){
					newVector[i] = element;
				}else{
					newVector[i] = ReplaceEndNodes(newVector[i],element); 
				}
				
			}
			return newVector;
		}		

		//This function returns a trimed down version of a given vector.
		public static function Trim(vector:Vector,first:int=0, last:int=0):Vector{
			var newVector:Vector = vector.clone();			
			newVector.splice(vector.length-last,last);
			newVector.splice(0,first);
			return newVector;
			
		}
		
		//This function removes specific elements from a vector. 
		public static function RemoveElements(vector:Vector,...remove):Vector{
			var newVector:Vector = vector.clone();
				for (var i:int; i<newVector.length; i++){
					for each(var e:* in remove){
						if(newVector[i]==e){
							newVector.removeElement(i);
							i--;
						}	
					}
				}
			return newVector;
		}
		//This funciton returns a vector populated with elements that match given criterion from another vector
		public static function Filter(vector:Vector, matchCriterion:Object):Vector{
			var newVector:Vector = new Vector();
				for each(var e:* in vector){
					if(matchCriterion(e)){
						newVector.push(e);
					}
				}
			return newVector;	
		}


		/*DESCRIPTION:
		-------------------------------------
		Returns an vector of the elements that appear the most in a given vector
		
		-------------------------------------
		EXAMPLE:
		-------------------------------------
		public var sampleList:Array = [1,2,3,4,5];
		trace(StatList.mode(sampleList));//Output: "1,2,3,4,5"
		trace(StatList.mode([5,6,3,2,5]));//Output: "5"
		trace(StatList.mode([5,6,3,6,5]));//Output: "5,6"
		
		*/		

		public static function Modes(list:Vector):Vector{
		
			var modes:Vector = new Vector();
			var counted:Vector = new Vector();
			var counts:Vector = new Vector();
		
			for(var i:uint = 0; i<list.length; i++){
				if(counted.lastIndexOf(list[i])==-1){
				counts[counts.length] = {value:list[i], occurences:Count(list,list[i])};
 
				counted.push(list[i]);
				}
			}
		
			counts.sortOn(["occurences"],Array.DESCENDING | Array.NUMERIC);
		
			var highCount:uint = counts[0].occurences;
		
			for(i = 0; i<counts.length; i++){
				if(counts[i].occurences < highCount) break;
				modes.push(counts[i].value);
			}
				
			return modes;
		}

		
		
		//This function returns a completly flat version of a given vector
		public static function Flatten(vector:Vector):Vector{
			var newVector:Vector = vector.clone();
			while(!IsFlat(newVector)){
				for(var i:uint =0; i<newVector.length; i++){
					if(newVector[i] is Vector){
						var tempVector:Vector = newVector[i].clone();
						newVector.removeElement(i);
						for each(var e:* in tempVector){
							newVector.addElement(e,i);
							i++;
						}
						i--;
					}
				}
			}

			return newVector;
		}
		//This function returns a completely flat version of a given vector provided that all of the elements of said vector have the SAME DEPTH
		public static function FlattenSD(vector:Vector):Vector{
			var newVector:Vector = vector.clone();
			if(newVector.length==0){
				return new Vector();
			}
			if(!(newVector[0] is Vector)){
				return newVector;
			}
			
			while(newVector.length >1){
				newVector[0] = VectorUtils.Merge(newVector[0],newVector[1]).clone()
				newVector.removeElement(1);
			} 
			
			return newVector[0];
		}
		
		
		//This function returnes a flat (well, flatter according to how deep you go) version of a given vector provided that all of the elemenst of said vector have the SAME DEPTH
		public static function FlattenSDLevels(vector:Vector,depth:uint=0):Vector{
			var newVector:Vector = vector.clone();
			var level:int;
			if(depth >0){
				level = depth;
			}else{
				 level = NestedDepthSD(vector)
			}
			
			for(var i:uint = 0; i<level; i++){
				newVector = Flatten(newVector);
			}
			return newVector;
		}
		
	
		//This function creates a fractal vector by replacint a vector's end nodes with copies of itself
		public static function Fractal(vector:Vector):Vector{
			return ReplaceEndNodes(vector,vector.clone()); 
		}
		
	
		//This function creates fractals from a vector at specified levels
		public static function FractalLevels(vector:Vector,level:uint=0):Vector{
			var newVector:Vector = vector.clone();
			for(var i:uint = 0; i<level; i++){
				newVector = Fractal(newVector);
			}
			return newVector;
		}			
		
		///////////////
		//4:Vector Combinations
		//These functions combine multiple vectors into one
		///////////////	


		//This funciton inserts the elements of the second vector into the first
		public static function Insert(target:Vector,newVector:Vector,index:int=-1):Vector{
			if(index <0){
				index = target.length;
			}
			
			var finalVector:Vector = target.clone();
			for(var i:uint=0;i<newVector.length;i++){
				finalVector.splice(index+i,0,newVector[i]);
			}
			return finalVector;
		}
		
		//This creates a new vector by combining elements from two vectors
		public static function Combine(alpha:Vector,beta:Vector,binaryOperation:Object,defaultValue:*=undefined):Vector{
			var finalVector:Vector = new Vector(Math.max(alpha.length,beta.length));
			for(var i:uint=0;i<finalVector.length;i++){
				if(alpha[i]&&beta[i]){
					finalVector[i] = binaryOperation(alpha[i],beta[i]);
				}else if(alpha[i]){
					if(defaultValue != undefined){
						finalVector[i]=defaultValue;
					}else{
						finalVector[i]=alpha[i];
					}

				}else{
					if(defaultValue != undefined){
						finalVector[i]=defaultValue;
					}else{
						finalVector[i]=beta[i];
					}
				}
			}
			return finalVector;
		}		
		
		
		
		
		///////////////
		//5:Object Transformations
		//These functions turn vectors into other objects.
		///////////////
		
		/*DESCRIPTION:
		-------------------------------------
		Returns the lenght of a given set of numbers
		-------------------------------------
		EXAMPLE:
		-------------------------------------
			
		*/					
		public static function Length(list:Vector):uint{
			return list.length;
		
		}	
				
		
		//This function collapases a vector into a single element according to a binary operation
		public static function Collapse(vector:Vector,binaryOperation:Object,defaultObject:*=null):*{
			var newVector:Vector = vector.clone();
			if(newVector.length == 0){
				return defaultObject;
			}
			
			if(newVector.length==1){
				return newVector[0];
			}
			newVector.setElement(binaryOperation(newVector[0],newVector[1]),0);
			newVector.removeElement(1);
			return Collapse(newVector,binaryOperation);
		}
		
		//This function returns the number of elements in a vector that match a given criterion
		public static function Matches(vector:Vector, matchCriterion:Object):uint{
			var appearences:uint=0
				for each(var e:* in vector){
					if(matchCriterion(e)){
						appearences++;
					}
				}
			return appearences;	
		}
		
		//This function returns the number of times a given element appears in a vector
		public static function Count(vector:Vector, matchElement:*):uint{
			return Matches(vector,function(x:*):Boolean{ return Boolean(x == matchElement)});

		}		 
		
		//This function returns a vector populated with the the number of consecutive matches to a given criterion in a given vector
		public static function ConsecutiveMatches(vector:Vector, matchCriterion:Object):Array{
			var appearences:Array = new Array(1);
			appearences[0] = 0;
				for each(var e:* in vector){
					if(matchCriterion(e)){
						appearences[appearences.length-1]++;
					}else{
						if(!(appearences[appearences.length-1]==0)){
							appearences.push(new int(0));	
						}
						
					}
				}
			return appearences;	
		}		
		
		//This function returns the depth of a vector given that all elements have the SAME DEPTH		
		public static function NestedDepthSD(vector:Vector,initialDepth:int=0):int{
			var depth:int = initialDepth;
			
			if(!(vector[0] is Vector)){
				return depth;
			}else{
				return NestedDepthSD(vector[0],depth+1);
			}
		}

		/////
		//////////
		///////////////
		//Section II : Tree Vectors 
		//These are functions for manipulating vectors known to be trees
		///////////////
		//////////
		/////
		
		
		
		
		
		
		
		
		
		
		
		
		
		
						
		/////
		//////////
		///////////////
		//Section III : Matrix Vectors
		//These are functions for manipulating vectors known to be matricies
		///////////////
		//////////
		/////
		
		///////////////
		//0 : Constants
		//These are constants
		///////////////
		
		//This is a seperator used to make elements of a vector line up vertically when outputed as a string
		public static const RowSeperator:String = ",\r";		
				
		
		///////////////
		//1 : Truth Functions
		//
		///////////////
			
		//This funtion returns true iff and only if a given vector is a matrix
		public static function IsMatrix(vector:Vector):Boolean{
			if(vector[0] is Vector){
				var length:int = vector[0].length
			}else{
				return false;
			}
			
			for each(var v:* in vector){
				if(!(v is Vector) || !(v.length ==length)){
					return false;
				} 
			
			} 
			return true;
		}
		
		///////////////
		//2 : Attributes
		//These functions return given attributes of a matrix
		//////////////		
		
		//This function returns the width of a given matrix
		public static function Width(vector:Vector):uint{
			return vector[0].length;
		}
		//This function returns the height of a given matrix
		public static function Height(vector:Vector):uint{
			return vector.length;
		}

		
		///////////////
		//3 : Constructors
		//These functions create matricies from "scratch
		//////////////		

		public static function ConstantMatrix(height:uint=1,width:uint=1,e:*=null):Vector{
			var newMatrix:Vector = new Vector();
			
			for(var i:int = 0; i<height; i++){
				newMatrix.push(new Vector(width));
				for(var j:int = 0; j<width; j++){
					newMatrix[i][j] = e;
				}
			}			
			return newMatrix;
		}
		
		
		public static function GenerateIdentity(height:uint=1,width:uint=1,one:*=1,zero:*=0):Vector{
			var identity:Vector = VectorUtils.ConstantMatrix(height,width);
			return VectorUtils.FillMatrixByIndex(identity,function(i:uint,j:uint):Number{
				if(i==j){
					return one;
				}
				return zero;
			});

		}		
		
		//This function takes a vector and wraps it as a matrix row		
		public static function VectorToMatrixRow(vector:Vector):Vector{
			return new Vector(vector);
		}
		//ths function takes a vector and wraps it as a matrix column
		public static function VectorToMatrixColumn(vector:Vector):Vector{
			return Transpose(VectorToMatrixRow(vector));
		}				

		///////////////
		//3 : Transformations
		//These functions create matricies using existing matricies
		//////////////		
		
		public static function FillMatrixByIndex(m:Vector,binaryOperation:Object):Vector{
			var newMatrix:Vector = m.clone();
			for(var i:int = 0; i<Height(newMatrix); i++){
				for(var j:int = 0; j<Width(newMatrix); j++){
					newMatrix[i][j] = binaryOperation(i,j);
				}
			}
			return newMatrix;
			
		}
		
		//This function replaces each element in a matrix with another specified element
		public static function ReplaceMatrix(m:Vector,element:*):Vector{
			var newVector:Vector = m.clone();
			for(var i:uint=0; i<Height(newVector); i++){
				for(var j:uint=0; j<Width(newVector); j++){
					newVector[i][j] = element;
				}	
			}
			return newVector;
		}			
		
		//This function returns the transpose of a given matrix
		public static function Transpose(vector:Vector):Vector{
			var newVector:Vector = new Vector(0);
			for(var k:uint = 0; k< Width(vector); k++){
				newVector.push(new Vector(Height(vector)));
			}
			
			
				for(var i:uint = 0; i <Height(vector); i++){
					for(var j:uint = 0; j <Width(vector); j++){
						newVector[j][i] = vector[i][j];
						}
					}
				return newVector;
		}
		//This function returns a row of a vector as a matrix
		public static function GetRow(m:Vector,index:uint=0):Vector{
			return Wrap(m[index]);
		}
		
		//This function returns a column of a vector as a matrix
		public static function GetColumn(m:Vector,index:uint=0):Vector{
			return Transpose(GetRow(Transpose(m),index));
		}
		
		//This function returns a matrix with a specified row removed
		public static function RowRemoved(m:Vector,index:uint=0):Vector{
			var m2:Vector = m.clone();
			m2.removeElement(index);
			return m2;
		}
		
		//This function returns a matrix with a specified column removed
		public static function ColumnRemoved(m:Vector,index:uint=0):Vector{
			return Transpose(RowRemoved(Transpose(m),index));
		}		
		
		//This function returns a matrix with a specified row inserted
		public static function RowInserted(target:Vector,inserted:Vector,index:int = -1):Vector{
			return Insert(target,Wrap(inserted),index);
		}
		
		//This function returns a matrix with a specified column inserted
		public static function ColumnInserted(target:Vector,inserted:Vector,index:int = -1):Vector{
			return Transpose(RowInserted(Transpose(target),inserted,index));
		}
		//This function returs a matrix with two vectors or martices into a single matrix (row-wise)
		public static function MergeRows(vectorA:Vector=null,vectorB:Vector=null):Vector{
			return Merge(vectorA,vectorB);
		}		
		//This function returs a matrix with two vectors or martices into a single matrix (column-wise)
		public static function MergeColumns(vectorA:Vector=null,vectorB:Vector=null):Vector{
			return Transpose(MergeRows(Transpose(vectorA),Transpose(vectorB)));
		}			
		
		//This function returns a matrix with a specifiec row set to another row (single dimensional vector)
		public static function RowSet(target:Vector=null,newVector:Vector=null,index:uint=0):Vector{
			var m2:Vector = target.clone();
			m2.setElement(newVector,index);
			return m2;

		}		
		
		//This function returns a matrix with a specifiec colunm set to another colunm (single dimensional vector)
		public static function ColumnSet(target:Vector=null,newVector:Vector=null,index:uint=0):Vector{
			return Transpose(RowSet(Transpose(target),newVector,index));
		}
		
		//This function places the elements of a matrix into another matrix
		public static function PlaceBlock(target:Vector,block:Vector,i:uint,j:uint):Vector{
			var newTarget:Vector = target.clone();
				for(var iPrime:uint = 0; iPrime < Height(block); iPrime++){
					for(var jPrime:uint =0; jPrime < Width(block); jPrime++){
						if(newTarget[i+iPrime]){
							if(newTarget[i+iPrime].length > j+jPrime){
								newTarget[i+iPrime][j+jPrime] = block[iPrime][jPrime];
							}								
						}
					}
				}
			return newTarget;
		}
		
		

		//Breaks a block matrix of matricies into a matrix of elements. Sililar to Flatten
		//Note: This function could probably be simplified using the Place Block Function, which i thought of later.
		public static function BreakBlock(M:Vector):Vector{
			var newHeight:int = 0;
			var newWidth:int = 0;
			var h:uint = Height(M);
			var w:uint = Width(M);
			
			for(var k:uint =0; k < h; k++)
			{
				newHeight += Height(M[k][0]);	
			}
						
			for(k = 0; k < w; k++)
			{
				newWidth += Width(M[0][k]);	
			}

			var brokenMatrix:Vector= ConstantMatrix(newHeight,newWidth);
			var currentHeight:uint = 0;
			var currentWidth:uint = 0;
			var currentMatrix:Vector;
			while(currentHeight < newHeight){
					for(var i:uint = 0; i < h; i++){
						for(var j:uint = 0; j<w; j++){
							currentMatrix = M[i][j];
							for(var iPrime:uint = 0; iPrime < Height(currentMatrix); iPrime++){
								for(var jPrime:uint =0; jPrime < Width(currentMatrix); jPrime++){

									brokenMatrix[currentHeight + iPrime][currentWidth + jPrime] = currentMatrix[iPrime][jPrime];
								}
							}
							currentWidth+=Width(currentMatrix);							
						}						
						currentWidth = 0;
						currentHeight += Height(currentMatrix);
					}
			}	
			return brokenMatrix;
		}
		
		
		
		
		
		
		
		//This function returns a matrix with padding 
		public static function Pad(matrix:Vector,element:*=null,padRows:Boolean=true,padCols:Boolean=true,top:Boolean=true,bottom:Boolean=true,left:Boolean=true,right:Boolean=true):Vector{
			var newVector:Vector = matrix.clone();
			var paddingVector:Vector;
			var insertCount:uint;


			if(padRows){
				insertCount=1;
				paddingVector = ConstantVector(Width(newVector),element);
				while(insertCount < Height(newVector)){
					newVector = RowInserted(newVector,paddingVector,insertCount);
					insertCount +=2;				
				}

			}
			
			if(padCols){
				insertCount=1;
				paddingVector = ConstantVector(Height(newVector),element);
				while(insertCount < Width(newVector)){
					newVector = ColumnInserted(newVector,paddingVector,insertCount);
					insertCount +=2;				
				}
			}






			if(top){
				paddingVector = ConstantVector(Width(newVector),element);
				newVector = RowInserted(newVector,paddingVector,0);
			}
			
			if(bottom){
				paddingVector = ConstantVector(Width(newVector),element);
				newVector = RowInserted(newVector,paddingVector,-1);
			}
						
			if(left){
				paddingVector = ConstantVector(Height(newVector),element);
				newVector = ColumnInserted(newVector,paddingVector,0);
			}
			
			if(right){
				paddingVector = ConstantVector(Height(newVector),element);
				newVector = ColumnInserted(newVector,paddingVector,-1);
			}
			
			
			
						
			
			return newVector;
			
		}
				
			
		
		///////////////
		//5:Object Transformations
		//These functions turn vectors into other objects.
		///////////////		
		
		//This function returns a matrix's diagonal as a vector
		public static function Diagnoal(M:Vector,off:int=0):Vector{
		
			var i:int = 0;
			var diag:Vector = new Vector();	
				
			if(off >=0){
				for(i = 0; i < Width(M) - off; i++){
						diag.push(M[i][i + off]);
				}
			}else{
				off*= -1;
				for(i = 0; i < Height(M) - off; i++){

						diag.push(M[i + off][i]);
				}
			}
			return diag;
		}
		
		//This function returns a matrix's minor diagonal as a vector
		//Note: I'm not quite sure if i got it working exactly right with the offsets
		public static function MinorDiagnoal(M:Vector,off:int=0):Vector{
		

			var i:int = 0;
			var diag:Vector = new Vector();

				
			if(off >=0){
				for(i = 0; i < Width(M) - off; i++){
						diag.push(M[i][Width(M) - i - 1 - off]);
				}
			}else{
				off*= -1;
				for(i = 0; i < Height(M) - off; i++){

						diag.push(M[i + off][Width(M)- i-1]);
				}
			}
			return diag;
		}
		
		
		
			
		///////////////
		//6 : Display
		//These functions aid in displaying a matrix
		//////////////
			
		//This function returns a matrix as a "well-formated" string for printing.
		//If minSpace is greater than 0, each element is given enough space so that elements in colums line up properly
		//If center is greater than 0 each element is centered with extra space put on the left
		//If center is less than 0 each element is centered with extra space put on the right
		public static function MatrixString(vector:Vector, minSpace:uint=0, center:int=0,seperator:String=",",leftBracket:String="[",rightBracket:String="]",rowSeperator:String=",",openingBracket:String="[",closingBracket:String="]"):String{
			var newVector:Vector = vector.clone();
			if(minSpace >0){
				for(var i:uint = 0; i <Height(newVector); i++){
					for(var j:uint = 0; j <Width(newVector); j++){
						if(newVector[i][j]==null){
							newVector[i][j] = "null"
						}
						newVector[i][j] = newVector[i][j].toString()
						if(minSpace <newVector[i][j].length){
							minSpace = newVector[i][j].length
						}
					}
				}
				if(center!=0){
					for(i = 0; i <Height(newVector); i++){
						for(j = 0; j <Width(newVector); j++){

							var addLeftSpace:uint = Math.ceil((minSpace - newVector[i][j].length)/2);
							var addRightSpace:uint = Math.floor((minSpace - newVector[i][j].length)/2);							
							
							if(center <0){
								addLeftSpace = Math.floor((minSpace - newVector[i][j].length)/2);
								addRightSpace = Math.ceil((minSpace - newVector[i][j].length)/2);
							}
							
							for(var k:uint=0; k < addLeftSpace; k++){
								newVector[i][j] = " " + newVector[i][j];
							}
							for(k=0; k < addRightSpace; k++){
								newVector[i][j] += " ";
							}							
						}
					}					
				}else{
					for(i = 0; i <Height(newVector); i++){
						for(j = 0; j <Width(newVector); j++){
							var addSpace:uint = minSpace - newVector[i][j].length;
							for(var m:uint=0; m < addSpace; m++){
								newVector[i][j] = " " + newVector[i][j];
							}
						}
					}	
				}
			}
			
			for(var n:uint=0; n<newVector.length; n++){
					newVector[n] =	newVector[n].toString(seperator,leftBracket,rightBracket);
			}
			rowSeperator += "\r";
			for(var p:uint=0; p<openingBracket.length; p++){
				rowSeperator +=" ";
			}
			return newVector.toString(rowSeperator,openingBracket,closingBracket);
		}		
		
		
		
		
		
		
		
		
		
	}
}